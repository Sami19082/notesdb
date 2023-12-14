import 'package:flutter/cupertino.dart';
import 'package:notes_db_provider/appdata.dart';

import 'notemodel.dart';

class NoteProvider extends ChangeNotifier{
  List<NoteModel> _arrNotes = [];
  AppDataBase db =  AppDataBase.instance;

  fetchNotes()async{
    _arrNotes = await db.fetchAllNotes();
    notifyListeners();
  }

  addNotes(NoteModel newNote)async{
    var check = await db.addNote(newNote);
    if(check){
      fetchNotes();
      notifyListeners();
    }
  }

  List<NoteModel> getNotes(){
    return _arrNotes;
  }
}