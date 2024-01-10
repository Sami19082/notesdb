import 'package:cubitwithdatabase/notemodel.dart';
import 'package:cubitwithdatabase/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  AppDataBase._();

  static final AppDataBase instance = AppDataBase._();
  Database? myDB;
  static final String LOGIN_UID = "loginid";
  static final String LOGIN_PREF_KEY = "islogin";
  static final String USER_TABLE = "utable";
  static final String NOTE_TABLE = "notetable";

  static final String USER_ID = 'uid';
  static final String USER_NAME = 'uname';
  static final String USER_EMAIL = 'email';
  static final String USER_PASS = 'pass';

  static final String NOTE_ID = "note_id";
  static final String NOTE_TITLE = "title";
  static final String NOTE_DESC = "desc";

  Future<Database> initDB() async {
    var docDirectory = await getApplicationDocumentsDirectory();
    var dbPath = join(docDirectory.path, "noteDB.db");
    return await openDatabase(dbPath, version: 1, onCreate: (db, version) {
      db.execute(
          "create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_NAME text, $USER_EMAIL text, $USER_PASS text)");
      db.execute(
          "create table $NOTE_TABLE ( $NOTE_ID integer primary key autoincrement, $USER_ID integer, $NOTE_TITLE text, $NOTE_DESC text )");
    });
  }

  Future<Database> getDB() async {
    if (myDB != null) {
      return myDB!;
    } else {
      myDB = await initDB();
      return myDB!;
    }
  }

  //addnotes
  Future<bool> addNote(NoteModel newnote) async {
    var db = await getDB();
    var uid= await getUID();
    newnote.userID= uid;
    var rowEffected = await db.insert(NOTE_TABLE, newnote.toMap());
    return rowEffected > 0;
  }

  //update notes
  Future<bool> updateNotes(NoteModel updated) async {
    var db = await getDB();
    var roweffected = await db.update(NOTE_TABLE, updated.toMap(),
        where: "$NOTE_ID = ?", whereArgs: ["${updated.note_id}"]);
    return roweffected > 0;
  }

//delete
  Future<bool> deleted(int ID) async {
    var db = await getDB();
    var roweffected = await db
        .delete(NOTE_TABLE, where: "$NOTE_ID = ?", whereArgs: ["${ID}"]);
    return roweffected > 0;
  }

  //fetchnotes
  Future<List<NoteModel>> fetchnotes() async {
    var db = await getDB();
    var uid = await getUID();
    List<NoteModel> arrNotes = [];
    var data = await db.query(NOTE_TABLE, where: "$USER_ID= ?", whereArgs: ['$uid']);
    for (Map<String, dynamic> each in data) {
      var noteModel = NoteModel.fromMap(each);
      arrNotes.add(noteModel);
    }
    return arrNotes;
  }

  //Queries for USER
  Future<bool> createAccount(UserModel newUser) async {
    //validate
    var check = await checkifUserexsist(newUser.user_email);
    if (!check) {
      //create account
      var db = await getDB();
      db.insert(USER_TABLE, newUser.ToMaps());
      return true;
    } else {
      //do not create account
      return false;
    }
  }

//Login
  Future<bool> authenticateUser(String email, String pass) async {
    var db = await getDB();
    var data = await db.query(USER_TABLE,
        where: "$USER_EMAIL = ? and $USER_PASS = ?", whereArgs: [email, pass]);
    if (data.isNotEmpty) {
      var prefs = await SharedPreferences.getInstance();
      prefs.setInt(LOGIN_UID, UserModel.fromMap(data[0]).user_id);
    }
    return data.isNotEmpty;
  }

//checking
  Future<bool> checkifUserexsist(String email) async {
    var db = await getDB();
    var data = await db
        .query(USER_TABLE, where: "$USER_EMAIL = ?", whereArgs: [email]);
    return data.isNotEmpty;
  }

 Future<int> getUID() async{
    var prefs = await SharedPreferences.getInstance();
    var uid= prefs.getInt(LOGIN_UID);
    return uid ?? 0;
  }
}
