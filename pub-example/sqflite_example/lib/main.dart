import 'package:flutter/material.dart';

import 'models/task.dart';

// import screens
import 'screens/main_screen.dart';
import 'screens/add_task_screen.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MainScreen.id,
      routes: {
        MainScreen.id: (_) => MainScreen(),
        // AddTaskScreen.id: (_) => AddTaskScreen() // Xóa dòng này đi
      },
      // Thêm đoạn code bên dưới vào
      onGenerateRoute: (settings) {
        // Nếu Navigator được gọi và màn hình đến là AddTaskScreen
        if (settings.name == AddTaskScreen.id) {
          return MaterialPageRoute(
            builder: (context) {
              // Nếu có dữ liệu truyền vào thì đưa qua constructor
              if (settings.arguments != null) {
                Task task = settings.arguments;
                return AddTaskScreen(task);
              }
              // default là null
              return AddTaskScreen(null);
            },
          );
        }
        return null;
      },
    );
  }
}
