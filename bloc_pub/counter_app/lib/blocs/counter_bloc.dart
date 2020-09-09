import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:counter_app/events/counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, int> {
  CounterBloc() : super(0);

  // int get initialState => 0;

  @override
  Stream<int> mapEventToState(CounterEvent event) async* {
    print(state);
    switch (event) {
      case CounterEvent.increment:
        var newState = state + 1;
        yield newState;
        break;
      case CounterEvent.decrement:
        var newState = state - 1;
        yield newState;
        break;
      default:
    }
  }
}
