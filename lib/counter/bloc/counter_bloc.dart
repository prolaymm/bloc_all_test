import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';
import 'counter_event.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  CounterBloc() : super(const CounterInitial()) {
    on<IncrementEvent>(increment);
    on<DecrementEvent>(decrement);
/*    on<IncrementEvent>((event, emit) {
      emit((CounterState(counterValue: state.counterValue + 1)));
    });
    on<DecrementEvent>((event, emit) {
      emit((CounterState(counterValue: state.counterValue + -1)));
    });*/
  }

  increment(event, emit) {
    emit((CounterState(counterValue: state.counterValue + 1)));
  }

  decrement(event, emit) {
    emit((CounterState(counterValue: state.counterValue + -1)));
  }
}
