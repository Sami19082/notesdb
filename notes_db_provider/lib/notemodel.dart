import 'package:notes_db_provider/appdata.dart';

class NoteModel{
  int? note_id;
  String title;
  String desc;
  NoteModel({this.note_id,required this.title,required this.desc});
  factory NoteModel.fromMap(Map<String,dynamic>map){
    return NoteModel(
        note_id: map[AppDataBase.NOTE_ID],
        title: map[AppDataBase.NOTE_TITLE],
        desc: map[AppDataBase.NOTE_DESC]);
  }

  Map<String,dynamic> toMap(){
    return {
      AppDataBase.NOTE_TITLE : title,
      AppDataBase.NOTE_DESC : desc
    };
  }
}