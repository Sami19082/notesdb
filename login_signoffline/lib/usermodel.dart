import 'package:login_signoffline/Appdb.dart';

class UserModel{
  int user_id;
  String user_name;
  String user_pass;
  String user_mail;

  UserModel({required this.user_id, required this.user_name, required this.user_pass,required this.user_mail});

  factory UserModel.fromMap(Map<String,dynamic> map){
    return UserModel(
        user_id: map[AppDataBase.USER_ID],
        user_name: map[AppDataBase.USER_PASS],
        user_pass: map[AppDataBase.USER_MAIL],
        user_mail: map[AppDataBase.USER_NAME]);
  }
  Map<String,dynamic> toMap(){
    return {
      AppDataBase.USER_NAME:user_name,
      AppDataBase.USER_MAIL:user_mail,
      AppDataBase.USER_PASS:user_pass
    };
  }
}
