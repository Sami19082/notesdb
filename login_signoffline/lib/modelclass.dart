
import 'Appdb.dart';

class NoteModel{
  int user_id;
  int note_id;
  String note_title;
  String note_desc;

  NoteModel({required this.note_id,
    required this.note_title,
    required this.note_desc,
    required this.user_id});

//from map --> Model
  factory NoteModel.fromMap(Map<String, dynamic> map){
    return NoteModel(
        user_id: map[AppDataBase.USER_ID],
        note_id: map[AppDataBase.NOTE_ID],
        note_title: map[AppDataBase.NOTE_TITLE],
        note_desc: map[AppDataBase.NOTE_DESC]);
  }

//Model --> to map
  Map<String,dynamic> toMap(){
    return{
      AppDataBase.USER_ID:user_id,
      AppDataBase.NOTE_TITLE:note_title,
      AppDataBase.NOTE_DESC:note_desc
    };
  }

}