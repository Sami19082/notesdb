import 'package:notesdb/model_class.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class AppDataBase{
 AppDataBase._();
static final AppDataBase instance = AppDataBase._();
Database? Appdata;

//TABLE
static final String NOTE_TABLE = 'notes';
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
      db.execute("create table $NOTE_TABLE ( $NOTE_ID integer primary key autoincrement, $NOTE_TITLE text, $NOTE_DESC text )");
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

Future<List<NoteModel>> fetchdata()async{

  var fetch = await getDB();
  List<NoteModel> arrNotes = [];

  var data = await fetch.query(NOTE_TABLE);

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
}