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

    Widget buildButton(IconData icon, String buttonTitle) {
      final Color tintColor = Colors.blue;
      return new Column(
        children: <Widget>[
          new Icon(icon, color: tintColor),
          new Container(
            margin: const EdgeInsets.only(top: 5.0),
            child: new Text("Home", style: new TextStyle(fontSize: 16.0,
            fontWeight: FontWeight.w600, color: tintColor
            ))
          ),
        ],
      );
    }

    Widget fourButtonsSection = new Container(
      child: new Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          //build in a separated function
          buildButton(Icons.home, "Home"),
          buildButton(Icons.arrow_back, "Back"),
          buildButton(Icons.arrow_forward, "Next"),
          buildButton(Icons.share, "Share"),
        ],
      ),
    );
    final bottomTextSection = new Container(
      padding: const EdgeInsets.all(20.0),
      //How to show long text ?
      child: new Text('''I am Nguyen Van Duc, I live in HCMC, Vietnam. I create this channel which contains videos in Swift programming language, Python, NodeJS, Angular, Typescript, ReactJS, React Native, ios and android programming, Kotlin programming, new technologies' overviews. These videos will help people learn latest programming language and software framework. They will be also very useful for their work or business. My channel's languages are English and Vietnamese.
      ''',
        style: new TextStyle(
            color: Colors.grey[850],
            fontSize: 16.0
        )
      ),
    );
    //build function returns a "Widget"
    return new MaterialApp(
      title: "",
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Flutter App'),
        ),
        body: new ListView(
          children: <Widget>[
            new Image.asset(
              'images/display.png',
              fit: BoxFit.cover
            ),
            //You can add more widget bellow
            titleSection,
            fourButtonsSection,
            bottomTextSection
          ],
        )
      )
    );//Widget with "Material design"
  }
}