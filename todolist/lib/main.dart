import 'package:flutter/material.dart';
import 'TodoScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      title: 'Flutter Demo',
      home: TodoScreen(),
    );
    return materialApp;
  }
}