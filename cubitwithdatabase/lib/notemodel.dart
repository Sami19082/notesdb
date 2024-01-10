

import 'package:cubitwithdatabase/appdata.dart';

class NoteModel{
int note_id;
int userID;
String mtitle;
String mdesc;

NoteModel({this.note_id = 0,required this.mtitle,required this.mdesc,required this.userID});

//from map
factory NoteModel.fromMap (Map<String,dynamic>map){
  return NoteModel(
    userID: map[AppDataBase.USER_ID],
      note_id: map[AppDataBase.NOTE_ID],
      mtitle: map[AppDataBase.NOTE_TITLE],
      mdesc: map[AppDataBase.NOTE_DESC]);
}

Map<String,dynamic> toMap(){
  return {
    AppDataBase.USER_ID : userID,
    AppDataBase.NOTE_TITLE : mtitle,
    AppDataBase.NOTE_DESC : mdesc,
  };
}
}