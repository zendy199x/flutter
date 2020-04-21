import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MainPage extends StatefulWidget {
  final String title;
  MainPage({this.title}): super();
  @override
  State<StatefulWidget> createState() {
    return new MainPageState();
  }
}

class MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text(widget.title),
      ),
      body: new GridView.extent(
        maxCrossAxisExtent: 150.0, //càng nhỏ chiếm cột càng nhiều
        mainAxisSpacing: 5.0, //row spacing
        crossAxisSpacing: 5.0, //column spacing
        padding: const EdgeInsets.all(5.0),
        children: _buildGridTitles(29),
      )
    );
  }
}

List<Widget> _buildGridTitles(numberOfTiles) {
  List<Stack> containers = new List<Stack>.generate(numberOfTiles,
  (int index) {
    //index = 0, 1, 2...
    final imageName = index < 9 ? 'images/image0${index + 1}.JPG' : 'images/image${index + 1}.JPG';
    return new Stack(
      alignment: const Alignment(1.0, 1.0),
      children: <Widget>[
        new Container(
          child: new Image.asset(
            imageName,
            width: 150.0,
            height: 150.0,
            fit: BoxFit.fill
          ),
        ),
        new Container(
          padding: const EdgeInsets.all(5.0),
          decoration: new BoxDecoration(
            color: new Color.fromARGB(150,71, 150, 236)
          ),
          child: new Text('${index}', style: new TextStyle(
          fontSize: 20.0,
          fontWeight: FontWeight.bold,
          color: Colors.black,
        )),
        ),
      ],
    );
  });
  return containers;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: "",
      home: new MainPage(title: "GridView of Images")
    );
  }
}