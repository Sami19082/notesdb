import 'package:cubitwithdatabase/notemodel.dart';
import 'package:cubitwithdatabase/stateclass.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'appdata.dart';

class NoteCubit extends Cubit<NoteState>{
  AppDataBase appDB;
  NoteCubit({required this.appDB}) : super(InitialState());
  //events
//add note
void addNote(NoteModel newNote) async{
  emit(LoadingState());
  var check= await appDB.addNote(newNote);
  if(check){
    List<NoteModel> arrNotes = await appDB.fetchnotes();
    emit(LoadedState(mnotes: arrNotes));
  }else{
    emit(ErrorState(errormsg: "Note Not Added..!!"));
  }
}
//update
void updateNote(NoteModel updated) async{
  emit(LoadingState());
  var check =await appDB.updateNotes(updated);
  if(check){
    List<NoteModel> arrNotes = await appDB.fetchnotes();
    emit(LoadedState(mnotes: arrNotes));
  }else{
    emit(ErrorState(errormsg: "Note Not Updated..!!"));
  }
}

//delete
void deleteNote(int noteID)async{
  emit(LoadingState());
  var check = await appDB.deleted(noteID);
  if(check){
    var arrnotes = await appDB.fetchnotes();
    emit(LoadedState(mnotes: arrnotes));
  }else{
    emit(ErrorState(errormsg: "Note Can't be Deleted..!!"));
  }
}

void fetchallNotes()async{
  emit(LoadingState());
  List<NoteModel> arrNotes = await appDB.fetchnotes();
  emit(LoadedState(mnotes: arrNotes));
}
}