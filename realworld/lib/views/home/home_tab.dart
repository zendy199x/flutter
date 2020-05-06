import 'package:flutter/material.dart';
import 'package:realworld/views/your_feed/your_feed_view.dart';
import 'package:realworld/views/global_feed/global_feed_view.dart';

class HomeTabScreen extends StatefulWidget {
  @override
  _HomeTabScreenState createState() => _HomeTabScreenState();
}

class _HomeTabScreenState extends State<HomeTabScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Column(
        children: <Widget>[
          Container(
            constraints: BoxConstraints(maxHeight: 150.0),
            child: Material(
              // color: Colors.transparent,
              // textStyle: Theme.of(context).primaryTextTheme.body2,
              child: TabBar(
                indicatorColor: Colors.blue,
                indicatorWeight: 2.0,
                tabs: [
                  Tab(text: "YOUR FEED"),
                  Tab(text: "GLOBAL FEED"),
                ],
              ),
            ),
          ),
          Expanded(
            child: TabBarView(
              children: [
                YourFeedView(),
                GlobalFeedView(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
