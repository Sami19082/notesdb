import 'package:bloc_database/note_database.dart';

class NoteModel{
  int noteID;
  String noteDesc;
  String noteTitle;

  NoteModel({required this.noteID,required this.noteTitle,required this.noteDesc});

  factory NoteModel.fromMap(Map<String,dynamic> map){
    return NoteModel(
        noteID: map[AppDataBase.COLUMN_ID],
        noteTitle: map[AppDataBase.COLUMN_TITLE],
        noteDesc: map[AppDataBase.COLUMN_DESC]);
  }

  Map<String,dynamic>toMap(){
    return {
      AppDataBase.COLUMN_TITLE : noteTitle,
      AppDataBase.COLUMN_DESC : noteTitle,
    };
  }
}