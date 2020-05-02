import 'package:flutter/material.dart';
import 'login_user.dart';

class _LoginScreenState extends State<LoginScreen> {
  final User user = User();
  @override
  Widget build(BuildContext context) {
    final TextField _txtEmail = TextField(
      decoration: InputDecoration(
        hintText: 'Email',
        border: InputBorder.none
      ),
      keyboardType:  TextInputType.emailAddress,
      autocorrect: false,
      onChanged: (text) {
        setState(() {
          this.user.email = text;
        });
      },
    );

    final TextField _txtPassword = TextField(
      decoration: InputDecoration(
        hintText: 'Password',
        border: InputBorder.none
      ),
      keyboardType: TextInputType.text,
      autocorrect: false,
      obscureText: true,
      onChanged: (text) {
        setState((){
          this.user.password = text;
        });
      },
    );

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        child: Stack (
          children: <Widget>[
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Container(
                    margin: EdgeInsets.only(left: 20.0, right: 40.0, bottom: 40.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: Image.asset('images/flutter_realworld.png'),
                        )
                      ],
                    )
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 20.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
                    ),
                    child: _txtEmail
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 40.0, right: 40.0, bottom: 40.0),
                    decoration: BoxDecoration(
                      border: Border(bottom: BorderSide(width: 1.0, color: Colors.grey))
                    ),
                    child: _txtPassword
                  ),

                  Container(
                    margin: EdgeInsets.only(left: 40.0, right: 40.0),
                    child: Row(
                      children: <Widget>[
                        Expanded(
                          child: RaisedButton(
                            color: Colors.green,
                            textColor: Colors.white,
                            child: Text('LOGIN',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold
                            )),
                            onPressed: () {
                              print('Email: ${user.email}, '
                                    'password: ${user.password}');
                            },
                          )
                        )
                      ],
                    )
                  ),
                ],
              ),
            ),
          ],
        )
      )
    );
  }
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}