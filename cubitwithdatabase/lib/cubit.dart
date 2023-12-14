import 'package:cubitwithdatabase/notemodel.dart';
import 'package:cubitwithdatabase/stateclass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'appdata.dart';

class NoteCubit extends Cubit<NoteState>{
  AppDataBase appDB;
  NoteCubit({required this.appDB}) : super(InitialState());
  //events
//add note
void addnote(NoteModel newNote) async{
  emit(LoadingState());
  var check= await appDB.addNote(newNote);
  if(check){
    List<NoteModel> arrNotes = await appDB.fetchnotes();
    emit(LoadedState(mnotes: arrNotes));
  }else{
    emit(ErrorState(errormsg: "Note Not Added!!"));
  }
}
}