import 'package:flutter/material.dart';
import 'listViewExample.dart';
//Define "root widget"
void main() => runApp(new MyApp());//one-line function

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = new MaterialApp(
      title: '',
      home: new ListViewExample(),
    );
    return materialApp;
  }
}