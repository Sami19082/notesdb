import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase{
 AppDataBase._();
static final AppDataBase instance = AppDataBase._();
Database? Appdata;

Future <Database> initdb()async{
  var docDictionary = await getApplicationDocumentsDirectory();
  var appPath = join(docDictionary.path,"notesDB.db");
  return openDatabase(
    appPath,
    version: 1,
    onCreate: (db, version) {
      db.execute("create table notes ( noteID integer primary key autoincrement, title text, desc text )");
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

void addnotes(String mtitle, String mdesc)async{
  var db = await getDB();
  db.insert("table", {
  "title":mtitle,
    "desc": mdesc
  });
}

Future<List<Map<String, dynamic>>> fetchdata()async{
  var fetch = await getDB();
  var data = fetch.query("notes");
  return data;
}
}