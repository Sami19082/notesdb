import 'dart:io';

import 'package:notes_db_provider/notemodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase{
  AppDataBase._();
  static final AppDataBase instance = AppDataBase._();
  Database? _database;
  static final NOTE_TABLE = "note";
  static final NOTE_ID = "note_id";
  static final NOTE_TITLE = "title";
  static final NOTE_DESC = "desc";
  
  Future<Database>getDB()async{
    if(_database != null){
      return _database!;
    }else{
      _database =await initDB();
      return _database!;
    }
  }
  
  Future<Database> initDB() async{
    Directory document = await getApplicationDocumentsDirectory();
    var dbpath = join(document.path,"noteDB.db");
    return openDatabase(
      dbpath,
      version: 1,
      onCreate: (db,version)async{
      db.execute(
          "Create table $NOTE_TABLE ( $NOTE_ID integer primary key autoincrement, $NOTE_TITLE text, $NOTE_DESC text)");
    });
  }

  Future<bool> addNote(NoteModel note)async{
    var db = await getDB();
    int rowseffect = await db.insert(NOTE_TABLE, note.toMap());
    return rowseffect > 0 ;
  }

  Future<List<NoteModel>> fetchAllNotes()async{
    var db = await getDB();
    List<Map<String,dynamic>> notes = await db.query(NOTE_TABLE);
    List<NoteModel> listNotes = [];
    var data = await db.query(NOTE_TABLE);
    for(Map<String,dynamic> each in data){
      listNotes.add(NoteModel.fromMap(each));
    }
    return listNotes;
  }

  Future<bool> updateNote(NoteModel updatedNote)async{
    var db = await getDB();
    var count = await db.update(NOTE_TABLE, updatedNote.toMap(),where: "$NOTE_ID = ${updatedNote.note_id}");
    return count>0;
  }
  Future<bool>deleteNote(int index)async{
    var db = await getDB();
    var count = await db.delete(NOTE_TABLE,where:"$NOTE_ID = ?",whereArgs: ["$index"]);
    return count>0;
  }
}