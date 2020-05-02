import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conduit'),
      ),
      body: Center(
        child: Container(
          child: Text('Home Screen', style: TextStyle(
            fontSize: 25.0, color: Colors.green, fontWeight: FontWeight.w600
          ))
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
    );
  }
}