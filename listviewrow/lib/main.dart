import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class HorizonalList extends StatefulWidget {
  @override
  HorizonalListState createState() => HorizonalListState();
}

class HorizonalListState extends State<HorizonalList> {
  @override
  Widget build(BuildContext context) {
    final screenSize=MediaQuery.of(context).size;
    return new Scaffold(
      body: new Container(
        child: new ListView(
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          children: <Widget>[
            new Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.red,
              child: new Center(
                child: new Text(
                  'Page 1',
                  style: new TextStyle(
                    fontSize: 40.0,
                    color: Colors.white
                  )
                )
              )
            ),
            new Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.blue,child: new Center(
                child: new Text(
                  'Page 2',
                  style: new TextStyle(
                    fontSize: 40.0,
                    color: Colors.white
                  )
                )
              )
            ),
            new Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.green,child: new Center(
                child: new Text(
                  'Page 3',
                  style: new TextStyle(
                    fontSize: 40.0,
                    color: Colors.white
                  )
                )
              )
            ),
            new Container(
              width: screenSize.width,
              height: screenSize.height,
              color: Colors.pink,child: new Center(
                child: new Text(
                  'Page 4',
                  style: new TextStyle(
                    fontSize: 40.0,
                    color: Colors.white
                  )
                )
              )
            )
          ]
        )
      )
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final materialApp = new MaterialApp(
      title: '',
      home: new HorizonalList()
    );
    return materialApp;
  }
}
