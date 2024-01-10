
import 'package:flutter/material.dart';
import 'package:notes_db_provider/appdata.dart';
import 'package:notes_db_provider/note_provider.dart';
import 'package:notes_db_provider/user_onboard/sign_up.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home.dart';

class Login extends StatelessWidget {

  var name = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Login"),
      ),
      body: Column(mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Hi, Welcome Back..!",style: TextStyle(fontSize: 35,color: Colors.black),),
          SizedBox(height: 15,),
          TextField(
            controller: email,
          ),
          SizedBox(height: 15,),
          TextField(
            controller: pass,
          ),
          SizedBox(height: 15,),
          ElevatedButton(onPressed: ()async{
            if(pass.text.isNotEmpty&&email.text.isNotEmpty){
              var check = await context.read<NoteProvider>().db.authenticate(
                  email.text.toString(), pass.text.toString());
              var msg ="";
              if(check){
                msg = "Login successfully";
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return HomePage();
                }));
                var prefs = await SharedPreferences.getInstance();
                prefs.setBool(AppDataBase.LOGIN_PREFS_KEY, true);
              }else{
                msg = "Incorrect Details";
              }
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
            }
           }, child: Text("Login")),
          SizedBox(height: 15,),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Signup();
            }));
           }, child: Text("New User ?\n   Login"))
        ],
      ),
    );
  }
}
