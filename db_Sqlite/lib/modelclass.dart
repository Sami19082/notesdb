import 'package:db_sqlite/app_DB.dart';

class NotesModel{
int userID;
  int note_id;
  String note_title;
  String note_desc;

  NotesModel({required this.note_id,required this.note_title, required this.note_desc,required this.userID});

  factory NotesModel.fromMap(Map<String,dynamic> maps){
    return NotesModel(
        userID : maps[AppDataBase.USER_ID],
        note_id: maps[AppDataBase.NOTES_ID],
        note_title:maps[AppDataBase.NOTES_TITLE],
        note_desc:maps[AppDataBase.NOTES_DECS]);

  }

  Map<String,dynamic> tomap(){
 return{
   AppDataBase.USER_ID : userID,
   AppDataBase.NOTES_TITLE:note_title,
   AppDataBase.NOTES_DECS:note_desc
 };
  }
}