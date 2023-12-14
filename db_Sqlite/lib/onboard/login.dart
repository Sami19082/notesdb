import 'package:db_sqlite/app_DB.dart';
import 'package:db_sqlite/main.dart';
import 'package:db_sqlite/onboard/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {

  var email = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Login"),
      ),
      body: Column(
        mainAxisAlignment:  MainAxisAlignment.center,
        children: [
          Text("Hi Welcome Back",style: TextStyle(fontSize: 34),),
          SizedBox(height: 21,),
          TextField(
            controller: email,
          ),
          SizedBox(height: 21,),
          TextField(
            controller: pass,
          ),
          SizedBox(height: 21,),
          ElevatedButton(onPressed: ()async{

            if(email.text.isNotEmpty&&pass.text.isNotEmpty){
              var Email = email.text.toString();
              var Pass = pass.text.toString();

              var appDB = AppDataBase.instance;
              if(await appDB.authanticate(Email, Pass)){
                Navigator.pushReplacement(context, MaterialPageRoute(builder:(context){
                  return Homepage();
                }));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid username")));
              }
            }
          }, child: Text("Login")),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return Signup();
            }));
          }, child: Text("New User? Create Account"))
        ],
      ),
    );
  }
}
