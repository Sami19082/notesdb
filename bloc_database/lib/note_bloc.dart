import 'package:bloc_database/note_event.dart';
import 'package:bloc_database/note_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'note_database.dart';

class NoteBloc extends Bloc<NoteEvent,NoteState>{
  AppDataBase db;

  NoteBloc({required this.db}) : super(NoteInitiated()){
   //Add Notes
    on<AddNoteEvent>((event, emit) async{
      // start load
      emit(NoteLoading());
      var check = await db.addNotes(event.newNote);
      if(check){
        var listNotes = await db.fetchNotes();
        //show added note
        emit(NoteLoaded(allnotes: listNotes));
      } else {
        //if error
        emit(NoteError(errormsg: "Note Not Added"));
      }
    });

    //fetch note
    on<FetchAllNote>((event, emit) async{
      emit(NoteLoading());
      var listNotes = await db.fetchNotes();
      emit(NoteLoaded(allnotes: listNotes));
    });
    //delete

    on<UpdateNote>((event, emit) async {
      emit(NoteLoading());
     var check = await db.Update(event.updatenote);
     if(check){
       var listnotes = await db.fetchNotes();
       emit(NoteLoaded(allnotes: listnotes));
     }else{
       emit(NoteError(errormsg: "Note Not Added"));
     }
    });

    //delete
    on<DeleteEvent>((event, emit) async {
      var check = await db.delete(event.mindex);
      if(check){
        var listnotes = await db.fetchNotes();
        emit(NoteLoaded(allnotes: listnotes));
      }else{
        emit(NoteError(errormsg: "Note Not Found"));
      }
    });
  }
}