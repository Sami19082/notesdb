import 'package:notes_db_provider/appdata.dart';

class UserModel {
  int uid;
  String uname;
  String uemail;
  String upass;

  UserModel({required this.uid,required this.uname,required this.uemail,required this.upass});

  factory UserModel.fromMap(Map<String,dynamic>map){
    return UserModel(
        uid: map[AppDataBase.USER_ID],
        uname: map[AppDataBase.USER_NAME],
        uemail:map[AppDataBase.USER_EMAIL],
        upass: map[AppDataBase.USER_PASS], );
  }

  Map<String,dynamic>toMap(){
    return {
      AppDataBase.USER_NAME : uname,
      AppDataBase.USER_EMAIL : uemail,
      AppDataBase.USER_PASS : upass
    };
  }
}
