import 'package:flutter/material.dart';
import 'loginPage.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "OnClick in Flutter",
      home: new LoginPage()
    );
  }
}