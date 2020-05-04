import 'package:fluro_example/route.dart';
import 'package:flutter/material.dart';

void main() {
  // Add this here to initialize the routes
  FluroRouter.setupRouter();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Fluro Tutorial',
        // Initial Page set to Login Page
        initialRoute: 'login',
        // Use the generator provided by Fluro package
        onGenerateRoute: FluroRouter.router.generator);
  }
}

//You can then use Navigator.push and the flutter routing mechanism will match the routes for you. You can also manually push to a route yourself. To do so: router.navigateTo(context, "/users/1234", transition: TransitionType.fadeIn);