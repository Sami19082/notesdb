import 'package:flutter/material.dart';
import 'package:notes_db_provider/note_provider.dart';
import 'package:notes_db_provider/user_model.dart';
import 'package:notes_db_provider/user_onboard/login.dart';
import 'package:provider/provider.dart';


class Signup extends StatelessWidget {

  var name = TextEditingController();
  var email = TextEditingController();
  var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:  AppBar(
        title: Text("Sign-Up"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Create Account",style: TextStyle(fontSize: 35,color: Colors.blue),),
          SizedBox(height: 15,),
          TextField(
            controller: name,
          ),
          SizedBox(height: 15,),
          TextField(
            controller: email,
          ),
          SizedBox(height: 15,),
          TextField(
            controller: pass,
          ),
          ElevatedButton(onPressed: ()async{
            if(name.text.isNotEmpty&&pass.text.isNotEmpty&&email.text.isNotEmpty){
             var check = await context.read<NoteProvider>().db.createAccount(UserModel(
                 uid: 0,
                 uname: name.text.toString(),
                 uemail: email.text.toString(),
                 upass: pass.text.toString()));
             var msg ="";
             if(check){
               msg = "Account created successfully";
             }else{
               msg = "Account already exist";
             }
             ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

             Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
               return Login();
             }));
            }
          }, child: Text("Sign-Up")),
        ],
      ),
    );
  }
}
