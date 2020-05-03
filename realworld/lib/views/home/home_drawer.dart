import 'package:flutter/material.dart';
import 'package:realworld/views/login/login_form.dart';

class _HomeDrawerState extends State<HomeDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Expanded(
            child: ListView(
            padding: EdgeInsets.zero,
            children: <Widget>[
              DrawerHeader(
                child: Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Image.asset(
                        './../../images/smiley-cyrus.jpg',
                        width: 80.0,
                        height: 80.0,
                        fit: BoxFit.cover
                      ),
                      Text('username', style: TextStyle(
                        color: Colors.grey[700]
                      )),
                      Text('email@gmail.com', style: TextStyle(
                        color: Colors.grey[500]
                      )),
                    ],
                  ),
                ),
                decoration: new BoxDecoration(
                    color: Colors.blue[100]
                ),
              ),
              ListTile(
                leading: Icon(Icons.input),
                title: Text('Login/Register'),
                onTap: () {
                  LoginScreen();
                }
              ),
              Divider(
                color: Colors.black45
              ),
              ListTile(
                leading: Icon(Icons.home),
                title: Text('Home'),
                onTap: () {}
              ),
              Divider(
                color: Colors.black45
              ),
              ListTile(
                leading: Icon(Icons.settings),
                title: Text('Settings'),
                onTap: () {}
              ),
              ListTile(
                leading: Icon(Icons.info),
                title: Text('About'),
                onTap: () {}
              ),
            ],
          )
          ),
          Container(
            child: Align(
              alignment: FractionalOffset.bottomCenter,
              child: Container(
                color: Colors.green,
                child: Column(
                  children: <Widget>[
                    ListTile(
                      title: Text('Create by https://github.com/zendy199x', style: TextStyle(
                        fontSize: 13.0, color: Colors.white, fontStyle: FontStyle.italic
                      )),
                      onTap: () {}
                    )
                  ],
                )
              )
            )
          )
        ]
      )
    );
  }
}

class HomeDrawer extends StatefulWidget {
  @override
  _HomeDrawerState createState() => _HomeDrawerState();
}