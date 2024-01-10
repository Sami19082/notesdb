
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../note_database.dart';
import '../user_model.dart';
import 'login.dart';

class SignUp extends StatefulWidget {
  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  var namecontroller= TextEditingController();

  var passcontroller = TextEditingController();

  var gmailcontroller= TextEditingController();
@override
  void initState() {
    super.initState();
    
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign Up"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Create Account"),
          SizedBox(
            height: 21,
          ),
          TextField(
            controller:namecontroller ,
          ),
          TextField(
            controller: gmailcontroller,
          ),
          TextField(
            controller: passcontroller,
          ),
          ElevatedButton(onPressed: ()async{
            if(namecontroller.text.isNotEmpty&&gmailcontroller.text.isNotEmpty&&passcontroller.text.isNotEmpty){

              var appDB= AppDataBase.instance;

              var check= await appDB.createAccount(UserModel(
                  user_id: 0,
                  user_name: namecontroller.text.toString(),
                  user_email: gmailcontroller.text.toString(),
                  user_pass: passcontroller.text.toString()));
              var msg= "";
              if(check){
                msg = 'Account Created';
                var prefs = await SharedPreferences.getInstance();
                var name = namecontroller.text.toString();
                prefs.setString(AppDataBase.USER_NAME, name);
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return Login();
                }));
              }else{
                msg = "Already Exist";
              }
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
            }
          }, child: Text("Sign_UP")),
        ],
      ),
    );
  }
}
