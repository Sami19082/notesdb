import 'package:bloc_database/notemodel.dart';
import 'package:bloc_database/user_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase {
  AppDataBase._();

  static final AppDataBase instance = AppDataBase._();
  Database?_mydatabase;

  //prefs keys

  static final LOGIN_PREFS_KEY = "login";
  static final LOGIN_SET_KEY = 'setter';

  //user table
  static final USER_TABLE = "utable";
  static final USER_ID = "uid";
  static final USER_NAME = "uname";
  static final USER_PASS = "upass";
  static final USER_EMAIL = "umail";


  //note table
  static final TABLE_NAME = "notes";
  static final COLUMN_ID = "noteID";
  static final COLUMN_TITLE = "title";
  static final COLUMN_DESC = "desc";

  //DataBase Initiation

  Future<Database> getDB() async {
    if (_mydatabase != null) {
      return _mydatabase!;
    } else {
      _mydatabase = await initDB();
      return _mydatabase!;
    }
  }

  Future<Database> initDB() async {
    var directory = await getApplicationDocumentsDirectory();
    var dbPath = join(directory.path, "notesDB.db");
    return openDatabase(
        dbPath,
        version: 1,
        onCreate: (db, version) {
          db.execute(
              "Create table $TABLE_NAME ( $COLUMN_ID integer primary key autoincrement, $USER_ID integer, $COLUMN_TITLE text, $COLUMN_DESC text )");
          db.execute(
              "Create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_NAME text, $USER_EMAIL text, $USER_PASS text )");
        }
    );
  }

  //Operations In DataBase

  Future<bool> addNotes(NoteModel newNote) async {
    var mydb = await getDB();
    var uid = await getUID();
    newNote.user_ID = uid;
    var roweffected = await mydb.insert(TABLE_NAME, newNote.toMap());
    return roweffected > 0;
  }

  Future<bool> Update(NoteModel updatedNote) async {
    var db = await getDB();
    var roweffected = await db.update(TABLE_NAME, updatedNote.toMap(),
        where: "$COLUMN_ID = ?", whereArgs: ["${updatedNote.noteID}"]);
    return roweffected > 0;
  }

  Future<bool> delete(int id) async {
    var db = await getDB();
    var roweffected = await db.delete(TABLE_NAME, where: "$COLUMN_ID = $id");
    return roweffected > 0;
  }

  //Fetching From Database

  Future<List<NoteModel>> fetchNotes() async {
    var db = await getDB();
    var uid = await getUID();
    List<NoteModel> arrNotes = [];
    var data = await db.query(
        TABLE_NAME, where: "$USER_ID = ?", whereArgs: [uid]);
    for (Map<String, dynamic> each in data) {
      var noteModels = NoteModel.fromMap(each);
      arrNotes.add(noteModels);
    }
    return arrNotes;
  }

  Future<bool> createAccount(UserModel newuser) async {
    var check = await checkUserExist(newuser.user_email);
    if (!check) {
      var db = await getDB();
      db.insert(USER_TABLE, newuser.toMap());
      return true;
    } else {
      return false;
    }
  }

  Future<bool> checkUserExist(String useremail) async {
    var db = await getDB();
    var data = await db.query(
        USER_TABLE, where: "$USER_EMAIL = ?", whereArgs: [useremail]);
    return data.isNotEmpty;
  }

  Future<bool> authenticateUser(String email ,String pass) async {
  var db= await getDB();
  var data= await db.query(USER_TABLE ,where: "$USER_EMAIL = ? and $USER_PASS = ?",whereArgs: [email,pass]);
  if(data.isNotEmpty){
    var prefs= await SharedPreferences.getInstance();
    prefs.setInt(LOGIN_SET_KEY, UserModel.fromMap(data[0]).user_id);
  }
  return data.isNotEmpty;
  }

  //user management
  Future<int> getUID() async {
    var prefs = await SharedPreferences.getInstance();
    var uid= prefs.getInt(LOGIN_SET_KEY);
    return uid ?? 0;
  }
}