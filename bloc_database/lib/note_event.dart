import 'package:bloc_database/notemodel.dart';

abstract class NoteEvent{}

//add event
class AddNoteEvent extends NoteEvent{
  NoteModel newNote;
  AddNoteEvent({required this.newNote});
}

//update
class UpdateNote extends NoteEvent{
  NoteModel updatenote;
  int mindex;

  UpdateNote({required this.mindex,required this.updatenote, required this.NoteModel });
}

//delete
class DeleteEvent extends NoteEvent{
  int mindex;
  DeleteEvent({required this.mindex});
}

//fetch event
class FetchAllNote extends NoteEvent{

}