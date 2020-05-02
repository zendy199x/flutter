import 'package:flutter/material.dart';
import 'package:realworld/views/home/home_view.dart';
import 'package:realworld/views/login/login_form.dart';

void main() => runApp(Conduit());

class Conduit extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = MaterialApp(
      title: 'Conduit',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      // home: HomeScreen(),
      home: LoginScreen(),
    );
    return materialApp;
  }
}