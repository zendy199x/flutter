import 'package:counter_app/blocs/counter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:counter_app/events/counter_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  //Now we need to install bloc
  //We have 2 Event => Increment / Decrement
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      home: BlocProvider(
        create: (context) => CounterBloc(),
        child: CounterPage(),
      ),
    );
  }
}
