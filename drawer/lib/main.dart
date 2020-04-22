import 'package:flutter/material.dart';
import 'mainPage.dart';

//Define "root widget"
void main() => runApp(new MyApp());//one-line function

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //build function returns a "Widget"
    return new MaterialApp(
      title: "Drawer in Flutter",
      home: new MainPage()
    );
  }
}
