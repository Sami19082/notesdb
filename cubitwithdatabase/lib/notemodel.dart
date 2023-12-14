

import 'package:cubitwithdatabase/appdata.dart';

class NoteModel{
int? note_id;
int? user_id;
String mtitle;
String mdesc;

NoteModel({this.note_id,required this.mtitle,required this.mdesc,this.user_id});

//from map
factory NoteModel.fromMap (Map<String,dynamic>map){
  return NoteModel(
      note_id: map[AppDataBase.NOTE_ID],
      mtitle: map[AppDataBase.NOTE_TITLE],
      user_id: map[AppDataBase.USER_ID],
      mdesc: map[AppDataBase.NOTE_DESC]);
}

Map<String,dynamic> toMap(){
  return {
    AppDataBase.USER_ID  : user_id,
    AppDataBase.NOTE_ID : note_id,
    AppDataBase.NOTE_TITLE : mtitle,
    AppDataBase.NOTE_DESC : mdesc,
  };
}
}