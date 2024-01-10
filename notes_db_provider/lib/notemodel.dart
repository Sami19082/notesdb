import 'package:notes_db_provider/appdata.dart';

class NoteModel{
  int note_id;
  int user_id;
  String title;
  String desc;
  NoteModel({required this.note_id,required this.title,required this.desc,required this.user_id});
  factory NoteModel.fromMap(Map<String,dynamic>map){
    return NoteModel(
      user_id: map[AppDataBase.USER_ID],
        note_id: map[AppDataBase.NOTE_ID],
        title: map[AppDataBase.NOTE_TITLE],
        desc: map[AppDataBase.NOTE_DESC]);
  }

  Map<String,dynamic> toMap(){
    return {
      AppDataBase.USER_ID : user_id,
      AppDataBase.NOTE_TITLE : title,
      AppDataBase.NOTE_DESC : desc
    };
  }
}