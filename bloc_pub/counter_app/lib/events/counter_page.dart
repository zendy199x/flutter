import 'package:counter_app/blocs/counter_bloc.dart';
import 'package:counter_app/events/counter_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterPage extends StatelessWidget {
  const CounterPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    // final CounterBloc counterBloc = context.bloc<CounterBloc>();

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
          child: BlocBuilder<CounterBloc, int>(
            builder: (context, state) {
              return Text(
                '$state',
                style: textTheme.headline2,
              );
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
                context.bloc<CounterBloc>().add(CounterEvent.increment);
              },
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              child: const Icon(Icons.remove),
              onPressed: () {
                context.bloc<CounterBloc>().add(CounterEvent.decrement);
              },
            ),
          ],
        ),
      ),
    );
  }
}
