import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:query_params/query_params.dart';
import 'package:todolist/global.dart';

class Task{
  int id;
  String name;
  bool finished;
  int todoId;

  //Constructor
  Task({
    this.id,
    this.name,
    this.finished,
    this.todoId
  });

  //Do the same as Todo
  factory Task.fromJson(Map<String, dynamic> json) {
    Task newTask = Task(
      id: json['id'] as int,
      name: json['name'] as String,
      finished: json['isfinished'] as bool,
      todoId: json['todoid'] as int
    );
    return newTask;
  }

  //Clone a Task, or 'copy constructor'
  factory Task.fromTask(Task anotherTask) {
    return Task(
      id: anotherTask.id,
      name: anotherTask.name,
      finished: anotherTask.finished,
      todoId: anotherTask.todoId
    );
  }
}

//Controllers = 'functions relationng to Task'
Future<List<Task>> fetchTasks(http.Client client, int todoId) async {
  final response = await client.get('$URL_TASKS_BY_TODOID/$todoId');
  if (response.statusCode == 200) {
    Map <String, dynamic> mapResponse = jsonDecode(response.body);
    if (mapResponse['result'] == 'ok') {
      final tasks = mapResponse['data'].cast<Map<String, dynamic>>();
      return tasks.map<Task>((json) {
        return Task.fromJson(json);
      }).toList();
    } else {
      return [];
    }
  } else {
    throw Exception('Failed to load Task');
  }
}

//Fetch Task by id
Future<Task> fetchTaskById(http.Client client, int id) async {
  final String url = '$URL_TASKS/$id';
  final response = await client.get(url);
  if (response.statusCode == 200) {
    Map <String, dynamic> mapResponse = jsonDecode(response.body);
    if (mapResponse['result'] == 'ok') {
      Map<String, dynamic> mapTask = mapResponse['data'];
      return Task.fromJson(mapTask);
    } else {
      return Task();
    }
  } else {
    throw Exception('Failed to get detail task with Id ={id}');
  }
}

//Update a task
Future<Task> updateATask(http.Client client, Map<String, dynamic> params) async {
  final response = await client.put('$URL_TASKS/${params['id']}', body: params);
  if (response.statusCode == 200) {
    final responseBody = await jsonDecode(response.body);
    return Task.fromJson(responseBody);
  } else {
    throw Exception('Failed to update a Task. Error: ${response.toString()}');
  }
}

//Delete a Task
Future<Task> deleteATask(http.Client client, int id) async {
  final String url = '$URL_TASKS/$id';
  final response = await client.delete(url);
  if (response.statusCode == 200) {
    final responseBody = await jsonDecode(response.body);
    return Task.fromJson(responseBody);
  } else {
    throw Exception('Failed to delete a Task');
  }
}