
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listcubit/list_state.dart';

class ListCubit extends Cubit<ListState>{
  ListCubit() : super(ListState(mdata: []));

  void addnote(Map<String,dynamic>newNote){
    var currData = state.mdata;
    currData.add(newNote);
    emit(ListState(mdata: currData));
  }

  //update
void updateNote(Map<String,dynamic> updatenote, int index){
    var currData = state.mdata;
    currData[index]= updatenote;
    emit(ListState(mdata: currData));
}

//delete
void deleteNote(int index){
var currdata = state.mdata;
currdata.removeAt(index);
emit(ListState(mdata: currdata));
}
}