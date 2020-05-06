import 'package:flutter/material.dart';

import 'package:realworld/views/home/home_tab.dart';
import 'package:realworld/views/home/home_drawer.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conduit'),
      ),
      body: Stack(
        children: <Widget>[
          HomeTabScreen()
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => {},
        tooltip: 'Add',
        child: Icon(Icons.add),
      ),
      drawer: HomeDrawer(),
    );
  }
}