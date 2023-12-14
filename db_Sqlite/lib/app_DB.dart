import 'package:db_sqlite/modelclass.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

import 'Usermodel.dart';

class AppDataBase{
  AppDataBase._();
  static final AppDataBase instance = AppDataBase._();

  Database? myDB;

  static final String LOGIN_PREFS_KEY = "uid";

  //USER TABLE
static final String USER_TABLE = 'users';
static final String USER_ID = "userid";
static final String USER_NAME = "username";
static final String USER_PASS = "userpass";
static final String USER_EMAIL = "usermail";

//NOTES TABLE
  //add userid also
  static final String NOTES_TABLE = "notes";
  static final String NOTES_TITLE = "title";
  static final String NOTES_DECS = "desc";
  static final String NOTES_ID = 'noteID';


 Future <Database> initDB()async{

   var docDirectory = await getApplicationDocumentsDirectory();
   var dbPath = join(docDirectory.path,"notesDb.db");

   return  openDatabase(
     dbPath,
     version: 1,
     onCreate: (data, version){
       // create all tables here //
       data.execute("create table $USER_TABLE ( $USER_ID integer primary key autoincrement, $USER_NAME text, $USER_EMAIL text, $USER_PASS text )");
       data.execute("create table $NOTES_TABLE ( $NOTES_ID integer primary key autoincrement, $USER_ID integer, $NOTES_TITLE text, $NOTES_DECS text )");
     }
   );
  }

  Future<Database> getDB()async{
    if(myDB!=null){
      return myDB!;
    }else{
      myDB =  await initDB();
      return myDB!;
    }
  }

 void addNote(NotesModel newNote)async{
   var db = await getDB();
   db.insert(NOTES_TABLE,newNote.tomap());
 }

 Future<List<NotesModel>> fetchNotes(int uid)async{
   var db = await getDB();

   List<NotesModel> arrdata=[];

  var data = await db.query(NOTES_TABLE,where: "$USER_ID =?", whereArgs: ["$uid"]);

  for(Map<String,dynamic> eachdata in data){

    var notesmodels = NotesModel.fromMap(eachdata);
    arrdata.add(notesmodels);

    return arrdata;
  }
  return arrdata;
 }

 void edit(){

 }

 //Queries for user

Future<bool> createaccount(UserModel newuser) async{

   var checked = await checkifexist(newuser.user_email);
if(!checked){
  //create user
  var db = await getDB();
  db.insert(USER_TABLE, newuser.toMap());
  return true;
}else{
  //do not create account
  return false;
}

}

Future<bool> checkifexist(String email) async{
   var db = await getDB();
   var data = await db.query(USER_TABLE,where:  "$USER_EMAIL = ?", whereArgs: [email]);
   return data.isNotEmpty;
}

//signup

Future<bool> authanticate(String email, String pass)async{
   var db = await getDB();
  var data = await db.query(USER_TABLE,where: "$USER_EMAIL =? and $USER_PASS =?", whereArgs: [email,pass]);
  
  if(data.isNotEmpty){
    var prefs = await SharedPreferences.getInstance();
    prefs.setInt(LOGIN_PREFS_KEY,UserModel.fromMap(data[0]).user_id);
  }
  return data.isNotEmpty;
}

}