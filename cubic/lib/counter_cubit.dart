import 'package:cubic/counterstate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CounterCubit extends Cubit<CounterState>{

  CounterCubit(): super(CounterState(count: 0));
 //events
void increamentCount(){
  // var count = state;
  emit(CounterState(count: state.count+1));
}

void decrement(){
  if(state.count>0){
    emit(CounterState(count: state.count-1));
  }
}
}