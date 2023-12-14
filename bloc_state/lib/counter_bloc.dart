import 'package:bloc_state/counter_events.dart';
import 'package:bloc_state/counter_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterBloc extends Bloc<CounterEvents,CounterState>{
  CounterBloc():super(CounterState(count: 0)){
    on<Increment>((event, emit) => emit(CounterState(count: state.count+event.value)));

    on<Decrement>((event, emit) {
      if(state.count>0){
        emit(CounterState(count: state.count-event.value));
      }
    });
  }
}