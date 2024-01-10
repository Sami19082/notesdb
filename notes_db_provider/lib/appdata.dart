import 'dart:io';

import 'package:notes_db_provider/notemodel.dart';
import 'package:notes_db_provider/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  AppDataBase._();

  static final AppDataBase instance = AppDataBase._();
  Database? _database;

  //prefs key
  static final LOGIN_PREFS_KEY = "ukey";
  static final LOGIN_UID_KEY = "logid";

  //table
  static final NOTE_TABLE = "note";
  static final NOTE_ID = "note_id";
  static final NOTE_TITLE = "title";
  static final NOTE_DESC = "desc";

  //user table
  static final USER_ID = 'uid';
  static final USER_TABLE = "utable";
  static final USER_NAME = "uname";
  static final USER_EMAIL = "uemail";
  static final USER_PASS = "upass";


  Future<Database> getDB() async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await initDB();
      return _database!;
    }
  }

  Future<Database> initDB() async {
    Directory document = await getApplicationDocumentsDirectory();
    var dbpath = join(document.path, "noteDB.db");
    return openDatabase(
        dbpath,
        version: 1,
        onCreate: (db, version) async {
          db.execute(
              "Create table $NOTE_TABLE ( $NOTE_ID integer primary key autoincrement, $USER_ID integer, $NOTE_TITLE text, $NOTE_DESC text)");
          db.execute(
              "Create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_NAME text, $USER_EMAIL text, $USER_PASS text )");
        });
  }

//note table
  Future<void> addNote(NoteModel note) async {
    var db = await getDB();
    var uid = await getUID();
    note.user_id = uid;
    db.insert(NOTE_TABLE, note.toMap());
  }

  Future<List<NoteModel>> fetchAllNotes() async {
    var db = await getDB();
    var uid = await getUID();
    List<NoteModel> _arrData = [];

    var data = await db.query(NOTE_TABLE,where: "$USER_ID = ?",whereArgs: [uid]);

    for (Map<String, dynamic> each in data) {
      var noteModel = NoteModel.fromMap(each);
      _arrData.add(noteModel);
    }
    return _arrData;
  }

  void updateNote(NoteModel updatedNote) async {
    var db = await getDB();
    db.update(NOTE_TABLE, updatedNote.toMap(),
        where: "$NOTE_ID = ${updatedNote.note_id}");
  }

  void deleteNote(int noteid) async {
    var db = await getDB();
    db.delete(NOTE_TABLE, where: "$NOTE_ID = ?", whereArgs: ["$noteid"]);
  }

  // User management

  Future<bool> createAccount(UserModel newuser)async{
    var check = await checkifexist(newuser.uemail);
    if(!check){
      //create user
      var db = await getDB();
      db.insert(USER_TABLE, newuser.toMap());
      return true;
    }
    return false;
  }


  Future<bool> checkifexist(String email)async{
    var db = await getDB();
    var data = await db.query(USER_TABLE ,where: "$USER_EMAIL =?",whereArgs: [email]);
  return data.isNotEmpty;
  }

  //login
Future<bool> authenticate(String email,String pass)async{
    var db = await getDB();
   var data = await db.query(USER_TABLE,where: '$USER_EMAIL = ? and $USER_PASS = ?',whereArgs: [email,pass]);
   if(data.isNotEmpty){
     var prefs = await SharedPreferences.getInstance();
     prefs.setInt(AppDataBase.LOGIN_UID_KEY, UserModel.fromMap(data[0]).uid);
   }
    return data.isNotEmpty;
}

Future<int> getUID()async{
    var prefs = await SharedPreferences.getInstance();
    var uid = prefs.getInt(LOGIN_UID_KEY);
    return uid ?? 0;
}

}