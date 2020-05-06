import 'package:flutter/material.dart';

class GlobalFeedView extends StatefulWidget {
  GlobalFeedView({Key key}) : super(key: key);

  @override
  _GlobalFeedViewState createState() => _GlobalFeedViewState();
}

class _GlobalFeedViewState extends State<GlobalFeedView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:  Center(
        child: Container(
          child: Text('Global Feed', style: TextStyle(
            fontSize: 25.0, color: Colors.green, fontWeight: FontWeight.w600
          ))
        ),
      ),
    );
  }
}