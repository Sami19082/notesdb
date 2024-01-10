import 'package:flutter/cupertino.dart';
import 'package:notes_db_provider/appdata.dart';

import 'notemodel.dart';

class NoteProvider extends ChangeNotifier{
  AppDataBase db ;

  NoteProvider({required this.db});

  List<NoteModel> _arrNotes = [];

 void fetchNotes()async{
    _arrNotes = await db.fetchAllNotes();
    notifyListeners();
  }

 void addNotes(NoteModel newNote)async{
    await db.addNote(newNote);
    _arrNotes = await db.fetchAllNotes();
    notifyListeners();
  }

  void updateNotes(NoteModel updated)async{
    db.updateNote(updated);
    _arrNotes = await db.fetchAllNotes();
    notifyListeners();
  }

 void deleteNote(int noteID )async{
    db.deleteNote(noteID);
    _arrNotes = await db.fetchAllNotes();
    notifyListeners();
  }

  List<NoteModel> getNotes(){
    return _arrNotes;
  }
}