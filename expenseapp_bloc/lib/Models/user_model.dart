import 'package:expenseapp_bloc/Database/app_database.dart';

class UserModel {
  int UID;
  String uname;
  String umail;
  String upass;

  UserModel(
      {required this.UID,
      required this.uname,
      required this.umail,
      required this.upass});

  factory UserModel.fromMap(Map<String,dynamic> maps){
    return UserModel(
    UID: maps[AppDataBase.USER_ID],
    uname: maps[AppDataBase.USER_NAME],
    umail: maps[AppDataBase.USER_MAIL],
    upass: maps[AppDataBase.USER_PASS]);
  }

  Map<String,dynamic> toMap(){
    return {
      AppDataBase.USER_NAME : uname,
      AppDataBase.USER_MAIL : umail,
      AppDataBase.USER_PASS : upass,
    };
  }
}
