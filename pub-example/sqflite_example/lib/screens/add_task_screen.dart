import 'package:flutter/material.dart';

import '../database/tasks_db.dart'; // new
import '../models/task.dart'; // new

class AddTaskScreen extends StatefulWidget {
  static const id = 'add_task_screen';

  final Task task; // new

  AddTaskScreen(this.task); // new

  @override
  _AddTaskScreenState createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  final _taskController = TextEditingController();
  bool _inSync = false;
  String _taskError;

  @override // new
  void initState() { // new
    Task task = widget.task; // new
    // Nếu có task được truyền qua màn hình add, tức là đang chỉnh sửa task
    if (task != null) { // new
      // Thực hiện gán task vào TextField
      _taskController.text = task.task; // new
    } // new
    super.initState(); // new
  } // new

  void addTask() async { // new
    // Kiểm tra TextField xem có trống hay không
    if (_taskController.text.isEmpty) { // new
      setState(() { // new
        _taskError = 'Please enter this field'; // new
      }); // new
      return null; // new
    } // new
    setState(() { // new
      _taskError = null; // new
      _inSync = true; // new
    }); // new
    final db = TasksDB(); // new
    final task = Task( // new
      task: _taskController.text.trim(), // new
    ); // new
    // insert task vào database
    await db.insert(task); // new
    setState(() { // new
      _inSync = false; // new
    }); // new
    // Trở về màn hình chính với giá trị trả về là true
    Navigator.pop(context, true); // new
  } // new

  void updateTask() async { // new
    if (_taskController.text.isEmpty) { // new
      setState(() { // new
        _taskError = 'Please enter this field'; // new
      }); // new
      return null; // new
    } // new
    setState(() { // new
      _taskError = null; // new
      _inSync = true; // new
    }); // new
    final db = TasksDB(); // new
    // Update task với giá trị mới ở record có id là id của task truyền vào
    final task = Task( // new
      id: widget.task.id, // new
      task: _taskController.text.trim(), // new
    ); // new
    await db.update(task); // new
    setState(() { // new
      _inSync = false; // new
    }); // new
    Navigator.pop(context, true); // new
  } // new

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add task'),
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: !_inSync
              ? () {
                  Navigator.pop(context);
                }
              : null,
        ),
        actions: <Widget>[
          !_inSync
              ? IconButton(
                  icon: Icon(Icons.done),
                  onPressed: () {
                    // Nếu như có truyền vào task tức là mình update
                    // nếu không thì add task
                    widget.task == null ? addTask() : updateTask(); // new
                  },
                )
              : Icon(Icons.refresh),
        ],
        elevation: 0.0,
        textTheme: TextTheme(
          title: Theme.of(context).textTheme.title,
        ),
        iconTheme: IconThemeData(
          color: Colors.black87,
        ),
      ),
      body: WillPopScope(
        onWillPop: () async {
          if (!_inSync) return true;
          return false;
        },
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: TextField(
            controller: _taskController,
            decoration: InputDecoration(
              labelText: 'Task',
              errorText: _taskError,
              border: OutlineInputBorder(),
            ),
          ),
        ),
      ),
    );
  }
}