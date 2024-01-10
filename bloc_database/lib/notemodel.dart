import 'package:bloc_database/note_database.dart';

class NoteModel{
  int noteID;
  int user_ID;
  String noteDesc;
  String noteTitle;

  NoteModel({required this.noteID,required this.noteTitle,required this.noteDesc,required this.user_ID});

  factory NoteModel.fromMap(Map<String,dynamic> map){
    return NoteModel(
      user_ID: map[AppDataBase.USER_ID],
        noteID: map[AppDataBase.COLUMN_ID],
        noteTitle: map[AppDataBase.COLUMN_TITLE],
        noteDesc: map[AppDataBase.COLUMN_DESC]);
  }

  Map<String,dynamic>toMap(){
    return {
      AppDataBase.USER_ID : user_ID,
      AppDataBase.COLUMN_TITLE : noteTitle,
      AppDataBase.COLUMN_DESC : noteDesc,
    };
  }
}