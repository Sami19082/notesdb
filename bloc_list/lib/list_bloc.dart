
import 'package:flutter_bloc/flutter_bloc.dart';

import 'list-state.dart';
import 'list_events.dart';

class ListBloc extends Bloc<ListEvents,ListState>{
  ListBloc() : super(ListState(mData: [])){
    on<AddMap>((event, emit) {
      var currData = state.mData;
      currData.add(event.newMap);
      emit(ListState(mData: currData));
    });

    on<Update>((event, emit){
      var currData = state.mData;
     currData[event.index] = event.UpdateMap;
      emit(ListState(mData: currData));
    });

    on<Delete>((event, emit) {
      var currData = state.mData;
      currData.removeAt(event.index);
      emit(ListState(mData: currData));
    });

    on<FetchAllMap>((event, emit) {
      emit(ListState(mData: state.mData));
    });
  }
}