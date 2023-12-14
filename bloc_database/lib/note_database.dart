import 'package:bloc_database/notemodel.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase{
  AppDataBase._();
  static final AppDataBase instance  = AppDataBase._();
  Database?_mydatabase;

  static final TABLE_NAME= "notes";
  static final COLUMN_ID= "noteID";
  static final COLUMN_TITLE= "title";
  static final COLUMN_DESC  = "desc";

  //DataBase Initiation

  Future<Database>getDB() async{
    if(_mydatabase!=null){
      return _mydatabase!;
    }else{
      _mydatabase= await initDB();
      return _mydatabase!;
    }
  }

  Future<Database>initDB()async{
    var directory = await getApplicationDocumentsDirectory();
    var dbPath = join(directory.path,"notesDB.db");
    return openDatabase(
      dbPath,
      version: 1,
      onCreate: (db,version){
        db.execute("Create table $TABLE_NAME ( $COLUMN_ID integer primary key autoincrement ,$COLUMN_TITLE text, $COLUMN_DESC text )");
      }
    );
  }

  //Operations In DataBase

  Future<bool>addNotes(NoteModel newNote)async{
    var mydb = await getDB();
    var roweffected = await mydb.insert(TABLE_NAME,newNote.toMap());
    return roweffected > 0;
  }

  Future<bool> Update(NoteModel updatedNote) async{
  var db = await getDB();
  var roweffected = await db.update(TABLE_NAME, updatedNote.toMap(),
      where: "$COLUMN_ID = ?",whereArgs: ["${updatedNote.noteID}"]);
  return roweffected > 0;
  }

  Future<bool> delete(int id) async{
    var db = await getDB();
   var roweffected = await db.delete(TABLE_NAME,where: "$COLUMN_ID = $id");
    return roweffected > 0;
  }

  //Fetching From Database

 Future<List<NoteModel>> fetchNotes()async{
    var db = await getDB();
    List<NoteModel> arrNotes = [];
   var data = await db.query(TABLE_NAME);
    for(Map<String,dynamic> each in data){
      var noteModels = NoteModel.fromMap(each);
      arrNotes.add(noteModels);
    }
    return arrNotes;
 }
}