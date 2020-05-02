import 'package:flutter/material.dart';
import 'package:realworld/views/home_view.dart';

void main() => runApp(Conduit());

class Conduit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      title: 'Conduit',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: HomeScreen(),
    );
    return materialApp;
  }
}