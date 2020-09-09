import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../counter.dart';

class CounterView extends StatelessWidget {
  const CounterView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Counter'),
        ),
        body: Center(
          child: BlocBuilder<CounterCubit, int>(
            builder: (context, state) {
              return Text('$state', style: textTheme.headline2);
            },
          ),
        ),
        floatingActionButton: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            FloatingActionButton(
              key: const Key('counterView_increment_floatingActionButton'),
              child: const Icon(Icons.add),
              onPressed: () => context.bloc<CounterCubit>().increment(),
            ),
            const SizedBox(height: 8),
            FloatingActionButton(
              key: const Key('counterView_decrement_floatingActionButton'),
              child: const Icon(Icons.remove),
              onPressed: () => context.bloc<CounterCubit>().decrement(),
            ),
          ],
        ),
      ),
    );
  }
}
