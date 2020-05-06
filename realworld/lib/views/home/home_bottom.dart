import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons, Colors;

class HomeBottom extends StatefulWidget {
  final Function(int) onChange;
  final int index;

  HomeBottom({this.onChange, this.index: 0});

  @override
  _HomeBottomState createState() => _HomeBottomState();
}

class _HomeBottomState extends State<HomeBottom> {
  BottomNavigationBarItem _tabItem(String title, Icon icon) {
    return BottomNavigationBarItem(
      icon: icon,
      title: Text('$title'),
    );
  }

  @override
  Widget build(BuildContext context) {
    List<BottomNavigationBarItem> tabs = [
      _tabItem('YOUR FEED', Icon(Icons.person_add)),
      _tabItem('GLOBAL FEED', Icon(Icons.public)),
    ];

    return MediaQuery.of(context).viewInsets.bottom == 0
        ? Align(
            alignment: Alignment.topCenter,
            child: CupertinoTabBar(
              onTap: widget.onChange,
              currentIndex: widget.index,
              backgroundColor: Colors.white30,
              iconSize: 24.0,
              items: tabs,
            ),
          )
        : Align();
  }
}
