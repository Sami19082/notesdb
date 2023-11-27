
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class Appdatabase{

  Appdatabase._();

  static final Appdatabase instance = Appdatabase._();
  Database? Mydata;

  Future<Database> initDB()async{

    var Documnets = await getApplicationDocumentsDirectory();
    var path =  join(Documnets.path,"notesDB.db");
    return openDatabase(
      path,
      version: 1,
      onCreate:(db, version) {
       db.execute("create table notes ( notesID integer primary key autoincrement, title text, desc text )");
      },
    );
  }
  Future<Database> getDB()async{
    if(Mydata!=null){
      return Mydata!;
    }else{
      Mydata=  await initDB();
      return Mydata!;
    }
  }

  void addnotes(String mtitle ,String mdesc)async{
    var data = await getDB();
    data.insert("notes", {
      "title": mtitle,
      "desc": mdesc
    });
  }

  Future<List<Map<String, dynamic>>> fetchData()async{
    var db = await getDB();
    var datas = await db.query("notes");
    return datas;
  }



}