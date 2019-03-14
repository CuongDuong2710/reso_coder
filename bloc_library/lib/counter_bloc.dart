import 'package:bloc/bloc.dart';
import 'package:bloc_library/counter_event.dart';
import 'package:bloc_library/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  void onIncrement() {
    dispatch(IncrementEvent());
  }

  void onDecrement() {
    dispatch(DecrementEvent());
  }

  @override
  CounterState get initialState => CounterState.initial();

  @override
  Stream<CounterState> mapEventToState(
      CounterState currentState, CounterEvent event) async* {
    if (event is IncrementEvent) {
      yield currentState..counter += 1;
    } else if (event is DecrementEvent) {
      yield currentState..counter -= 1;
    }
  }
}
