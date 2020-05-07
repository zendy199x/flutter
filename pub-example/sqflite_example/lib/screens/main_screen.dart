import 'package:flutter/material.dart';

import '../database/tasks_db.dart'; // new
import '../models/task.dart'; // new

// import screens
import 'add_task_screen.dart';

class MainScreen extends StatefulWidget {
  static const id = 'main_screen';

  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  List<Task> tasks = []; // new

  Future getTasks() async {
    // new
    // Lấy tất cả task và gán vào list tasks
    final db = TasksDB(); // new
    tasks = await db.getTasks(); // new
    setState(() {}); // new
  } // new

  Future deleteTask(int id) async {
    // new
    // Xóa task ở record có id là id được truyền vào
    final db = TasksDB(); // new
    await db.delete(id); // new
    tasks = await db.getTasks(); // new
    await getTasks(); // new
    setState(() {}); // new
  } // new

  @override // new
  void initState() {
    // new
    getTasks(); // new
    super.initState(); // new
  } // new

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo App'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          // Navigate sang màn hình add task và chờ kết quả trả về
          final result =
              await Navigator.pushNamed(context, AddTaskScreen.id); // Edited
          // Nếu kết quả trả về là true tức là có thêm task nên ta sẽ cập nhật lại list tasks
          if (result == true) getTasks(); // new
        },
        child: Icon(Icons.add),
      ),
      body: ListView.builder(
        itemCount: tasks.length, // Edited
        itemBuilder: (context, index) {
          return ListTile(
            title: Text(tasks[index].task), // Edited
            trailing: PopupMenuButton(
              onSelected: (i) async {
                if (i == 0) {
                  // Tương tự như FAB add task, ta chờ xem có update task thì up
                  // lại list tasks
                  final result = await Navigator.pushNamed(
                    // Edited
                    context, // new
                    AddTaskScreen.id, // new
                    // truyền task qua màn hình add task để edit
                    arguments: tasks[index], // new
                  ); // new
                  if (result == true) getTasks(); // new
                } else if (i == 1) {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        title: Text('Confirm your deletion'),
                        content: Text(
                            'This task will be deleted permanently. Do you want to do it?'),
                        actions: <Widget>[
                          FlatButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('CANCEL'),
                          ),
                          FlatButton(
                            onPressed: () {
                              // delete task có id  là id của item hiện tại
                              deleteTask(tasks[index].id); // new
                              Navigator.pop(context);
                            },
                            child: Text(
                              'DELETE',
                              style: TextStyle(color: Colors.red),
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
              },
              itemBuilder: (context) {
                return [
                  PopupMenuItem(
                    value: 0,
                    child: Text('Edit'),
                  ),
                  PopupMenuItem(
                    value: 1,
                    child: Text('Delete'),
                  ),
                ];
              },
            ),
          );
        },
      ),
    );
  }
}
