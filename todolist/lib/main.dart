import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      title: 'Flutter Demo',
      home: Text('Flutter Demo Home Page'),
    );
    return materialApp;
  }
}