import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
      ),
      body: Center(
        child: Text("Please Login"),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(Icons.exit_to_app),
          onPressed: () {
            var username = "Zendy";
            //Navigator.pushReplacementNamed() is a function that replaces the stack with whatever route you pass to it, so that the user cannot go back to the previous screen by simply pressing the back button. If in case you would want such a functionality of going back a screen, you can use Navigator.pushNamed() with the same attributes.
            Navigator.pushReplacementNamed(context, "home/$username");
          }),
    );
  }
}
