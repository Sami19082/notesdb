import 'package:cubitwithdatabase/notemodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase{
  AppDataBase._();
  static final AppDataBase instance= AppDataBase._();
  Database ? myDB;
  static final String LOGIN_UID= "loginid";
  static final String USER_TABLE = "utable";
  static final String NOTE_TABLE= "table";

static final String USER_ID = 'uid';
static final String USER_NAME  = 'uname';
static final String USER_EMAIL = 'email';
static final String USER_PASS = 'pass';


  static final String NOTE_ID= "note_id";
  static final String NOTE_TITLE = "title";
  static final String NOTE_DESC = "desc";



  Future<Database> initDB() async{
    var docDirectory = await getApplicationDocumentsDirectory();
    var dbPath= join(docDirectory.path,"noteDB.db");
    return await openDatabase(dbPath,version: 1,onCreate: (db,version){
      db.execute("create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_NAME text, $USER_EMAIL text, $USER_PASS text)");
      db.execute("create table $NOTE_TABLE ( $NOTE_ID integer primary key autoincrement, $USER_ID integer, $NOTE_TITLE text, $NOTE_DESC text )");
    });
  }

  Future<Database> getDB() async{
    if(myDB!= null){
     return myDB!;
    }else{
      myDB = await initDB();
      return myDB!;
    }
  }

  Future<bool> addNote(NoteModel newnote)async{
    var db= await getDB();
    var uid= await getUID();
    newnote.note_id= uid;
   var rowEffected= await db.insert(NOTE_TABLE, newnote.toMap());
   return rowEffected>0;
  }

  Future<int>getUID() async{
    var prefs = await SharedPreferences.getInstance();
    var uid= prefs.getInt(AppDataBase.LOGIN_UID);
    return uid ?? 0;
  }

  Future<List<NoteModel>> fetchnotes()async{
    var uid = await getUID();
    var db = await getDB();
    List<NoteModel> arrNotes = [];
    var data = await db.query(NOTE_TABLE,where: "$USER_ID = ?", whereArgs: ["$uid"]);

    for(Map<String,dynamic>each in data){
      var noteModel = NoteModel.fromMap(each);
      arrNotes.add(noteModel);
    }
    return arrNotes;
  }

}