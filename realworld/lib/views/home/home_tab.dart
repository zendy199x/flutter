import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart' show Icons, Colors;

class HomeTab extends StatefulWidget {

  final Function(int) onChange;
  final int index;

  HomeTab({ this.onChange, this.index: 0 });
  
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {

  BottomNavigationBarItem _tabItem(String title, Icon icon) {
    return BottomNavigationBarItem(
      icon: icon,
      title: Text('$title'),
    );
  }
  
  @override
  Widget build(BuildContext context) {

    List<BottomNavigationBarItem> tabs = [
      _tabItem('Global Feed', Icon(Icons.public)),
      _tabItem('Your Feed', Icon(Icons.person_add)),
    ];

    return MediaQuery.of(context).viewInsets.bottom == 0
        ? Align(
            alignment: Alignment.bottomCenter,
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