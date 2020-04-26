import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:todolist/TaskScreen.dart';

import 'models/todo.dart';
import 'TaskScreen.dart';

class TodoList extends StatelessWidget {
  final List<Todo> todos;
  //constructor
  TodoList({Key key, this.todos}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
      return GestureDetector(
        child: Container(
          padding: EdgeInsets.all(10.0),
          color: index % 2 == 0 ? Colors.greenAccent : Colors.cyan,
          child:  Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(todos[index].name, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0)),
              Text('Date: ${todos[index].dueDate}', style: TextStyle(fontSize: 16.0))
            ],
          )
        ),
        onTap: () {
          //Navigate to task screen
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TaskScreen(todoId: todos[index].id)
            )
          );
        }
      );
    },
      itemCount: todos.length,
    );
  }
}

class TodoScreen extends StatefulWidget {
  TodoScreen({Key key}) : super(key: key);

  @override
  _TodoScreenState createState() => _TodoScreenState();
}

class _TodoScreenState extends State<TodoScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fetch Todos from Restful API"),
      ),
      body: FutureBuilder<List<Todo>>(
        future: fetchTodos(http.Client()),
        builder: (context, snapshot) {
          if (snapshot.hasError) print(snapshot.error);

          return snapshot.hasData
            ? TodoList(todos: snapshot.data)
            : Center(child: CircularProgressIndicator());
        }
      )
    );
  }
}