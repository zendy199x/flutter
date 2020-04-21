import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget titleSection = new Container(
      padding: const EdgeInsets.all(10.0),//Top, Right, Bottom, Left
      child: new Row(
        children: <Widget>[
          new Expanded(
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                new Container(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: new Text("Hello to My Youtube Channel", style: new TextStyle(fontWeight: FontWeight.bold,
                  fontSize: 18.0
                  )),
                ),
                new Text("Thank you to watching, see you again", style: new TextStyle(color: Colors.grey[600],
                fontSize: 16.0
                ),
                ),
              ],
            ),
          ),
          new Icon(Icons.favorite, color: Colors.red),
          new Text(" 100", style: new TextStyle(fontSize: 16.0))
        ],
      ),
    );

    return new MaterialApp(
      title: "",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text("My Youtube Channel"),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/display.png',
              fit: BoxFit.cover
            ),
            titleSection
          ]
        )
      )
    );
  }
}