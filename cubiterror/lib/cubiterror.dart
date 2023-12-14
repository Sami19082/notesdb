import 'dart:async';
import 'dart:math';
import 'package:cubiterror/statepage.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ListCubit extends Cubit<ListState>{
  ListCubit() : super(ListState(mData: []));

  //add note
  void addNote(Map<String, dynamic>newNote){
    emit(ListState(mData: state.mData,isLoading: true));
    Timer(Duration(seconds: 2), () {
      var random = Random().nextInt(100);
      if(random%5==0){
        //error case
        emit(ListState(mData: state.mData,isLoading: false,isError: true,errorMsg: "Data is not Added"));
      }else{
        var currData = state.mData;
        currData.add(newNote);
        emit(ListState(mData: currData,isLoading: false,isError: false));
      }
    });
  }
  void updateNote(Map<String,dynamic>updateNote,int index){
    var currData= state.mData;
    currData[index] = updateNote;
    emit(ListState(mData: currData));
  }
