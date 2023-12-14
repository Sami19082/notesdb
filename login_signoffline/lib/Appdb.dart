
import 'package:login_signoffline/usermodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'modelclass.dart';

class AppDataBase{
  AppDataBase._();
  static final AppDataBase instance = AppDataBase._();
  Database? Appdata;

  // login pref key

  static final String LOGIN_UID= 'uid';

//TABLE
  static final String NOTE_TABLE = 'notes';
  static final String USER_TABLE = "users";

  //user columns
  static final String USER_ID = 'userid';
  static final String USER_NAME = 'uname';
    static final String USER_MAIL = 'umail';
  static final String USER_PASS = 'upass';

//COLUMNS

  static final String NOTE_ID = 'noteID';
  static final String NOTE_TITLE = 'title';
  static final String NOTE_DESC = 'desc';

  Future <Database> initdb()async{
    var docDictionary = await getApplicationDocumentsDirectory();
    var appPath = join(docDictionary.path,"notesDB.db");
    return openDatabase(
      appPath,
      version: 1,
      onCreate: (db, version) {
        db.execute("create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_NAME text, $USER_MAIL text, $USER_PASS text )");
        db.execute("create table $NOTE_TABLE ( $NOTE_ID integer primary key autoincrement,$USER_ID integer, $NOTE_TITLE text, $NOTE_DESC text )");
      },
    );

  }

  Future<Database> getDB() async{
    if(Appdata!=null){
      return Appdata!;
    }else{
      Appdata = await initdb();
      return Appdata!;
    }
  }

  void addnotes(NoteModel newNote)async{
    var db = await getDB();
    db.insert(NOTE_TABLE, newNote.toMap());
  }

  Future<List<NoteModel>> fetchdata(int uid)async{

    var fetch = await getDB();
    List<NoteModel> arrNotes = [];

    var data = await fetch.query(NOTE_TABLE,where: "$USER_ID = ?",whereArgs: ["$uid"]);

    for(Map<String,dynamic> eachNote in data){
      var noteModel = NoteModel.fromMap(eachNote);
      arrNotes.add(noteModel);
    }
    return arrNotes;
  }

  void update (NoteModel updatenote)async{
    var db = await getDB();
    // db.update(NOTE_TABLE, updatenote.toMap(),where: "$NOTE_ID = ${updatenote.note_id}");
    db.update(NOTE_TABLE, updatenote.toMap(),where: "$NOTE_ID = ?" ,whereArgs: ["${updatenote.note_id}"]);
  }

  void delete(int deletenote)async{
    var db =  await getDB();
    db.delete(NOTE_TABLE,where: "$NOTE_ID = $deletenote");
  }

  Future<bool> createAccount(UserModel newuser) async{
   var check = await checkuserexist(newuser.user_mail);
   if(!check){
     //create user
     var db = await getDB();
     db.insert(USER_TABLE,newuser.toMap());
     return true;
   }else{
     //do not create
    return false;
   }
  }

  Future<bool> checkuserexist(email)async{
    var db = await getDB();
   var data = await db.query(USER_TABLE, where: "$USER_MAIL = ?",whereArgs: [email]);
   return data.isNotEmpty;

  }

  //login
Future<bool> authenticate(String email, String pass)async{
    var db = await getDB();
   var data = await db.query(USER_TABLE,where: "$USER_MAIL = ? and $USER_PASS = ?",whereArgs: [email,pass]);
   if(data.isNotEmpty){
     var prefs = await SharedPreferences.getInstance();
     prefs.setInt(LOGIN_UID, UserModel.fromMap(data[0]).user_id);
   }
   return data.isNotEmpty;
}

}