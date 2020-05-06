import 'package:flutter/material.dart';

import 'package:realworld/views/home/home_tab.dart';
import 'package:realworld/views/home/home_drawer.dart';
import 'package:realworld/views/root/root_bloc.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Conduit'),
      ),
      body: Stack(
        children: <Widget>[
          getBody()
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

  getBody() {
    return StreamBuilder(
      stream: rootBloc.authenticated,
      initialData: false,
      builder: (context, snapshot) {
        return snapshot.data
          ? HomeTabScreen()
          : Container();
      }
    );
  }
}