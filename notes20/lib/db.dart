import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

import 'modelclass.dart';

class AppDataBase{
  AppDataBase._();
  static final AppDataBase instance = AppDataBase._();
 Database ? Appdata;

 static final String NOTE_TABLE = "notes";
 static final String NOTE_ID = "noteID";
 static final String NOTE_TITLE = "title";
 static final String NOTE_DESC = "desc";

 Future<Database>initdb()async{
   var docDictionary = await getApplicationDocumentsDirectory();
   var apppath = join(docDictionary.path,"notesDB.db");
   return openDatabase(
     apppath,
     version: 1,
     onCreate: (db,version){
       db.execute("create table $NOTE_TABLE ( $NOTE_ID integer primary key autoincrement, $NOTE_TITLE text, $NOTE_DESC text )");
     }
   );
 }
 Future<Database>getdb()async{
   if(Appdata!=null){
     return Appdata!;
   }else{
     Appdata = await initdb();
     return Appdata!;
   }
 }

 void addnotes(NoteModel newNote)async{
   var db = await getdb();
   db.insert(NOTE_TABLE, newNote.toMap());
 }
 Future<List<NoteModel>> fetchdata()async{
   var fetch = await getdb();
   List<NoteModel> arrNotes = [];
   var data = await fetch.query(NOTE_TABLE);

   for(Map<String,dynamic> eachnote in data){
     var notemodel = NoteModel.fromMap(eachnote);
     arrNotes.add(notemodel);
   }
   return arrNotes;
 }

}