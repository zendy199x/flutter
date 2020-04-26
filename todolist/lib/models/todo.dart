import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:todolist/global.dart';

class Todo {
  int id;
  String name;
  String dueDate;
  String description;
  //Constructor
  Todo({
    this.id,
    this.name,
    this.dueDate,
    this.description
  });
  //This is a static method that
  factory Todo.fromJson(Map<String, dynamic> json) { //tạo ra object từ object Todos dạng key, value
    return Todo(
      id: json['id'] as int,
      name: json['name'] as String,
      dueDate: json['duedate'] as String,
      description: json['description'] as String
    );
  }
}

//Fetch data from Restful API
Future<List<Todo>> fetchTodos(http.Client client) async {
  //How to make these URLs in a .dart file ?
  final response = await client.get(URL_TODOS);
  if (response.statusCode == 200) {
    Map<String, dynamic> mapResponse = jsonDecode(response.body); //jsonDecode
    if (mapResponse["result"] == "ok") {
      final todos = mapResponse["data"].cast<Map<String, dynamic>>(); //được các mảng gồm các object key, value dạng map
      final listOfTodos = await todos.map<Todo>((json) {
        return Todo.fromJson(json);
      }).toList();
      return listOfTodos;
    } else {
      return [];
    }
  } else {
    throw Exception("Failed to load Todo from the Internet");
  }
}