import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase{
  AppDataBase._();
  static final AppDataBase instance = AppDataBase._();

  Database? myDB;

 Future <Database> initDB()async{

   var docDirectory = await getApplicationDocumentsDirectory();
   var dbPath = join(docDirectory.path,"notesDb.db");

   return  openDatabase(
     dbPath,
     version: 1,
     onCreate: (data, version){
       // create all tables here //

       data.execute("create table notes ( noteId integer primary key autoincrement, title text, desc text )");
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

 void addNote(String mtitle, String mdesc)async{
   var db = await getDB();
   db.insert("notes", {
     "title": mtitle,
     "desc" : mdesc,
   });
 }

 Future<List<Map<String,dynamic>>> fetchNotes()async{
   var db = await getDB();
  var data = await db.query("notes");
  return data;
 }
}