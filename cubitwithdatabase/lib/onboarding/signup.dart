import 'package:cubitwithdatabase/appdata.dart';
import 'package:cubitwithdatabase/onboarding/login.dart';
import 'package:cubitwithdatabase/user_model.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
var namecontroller= TextEditingController();
var passcontroller = TextEditingController();
var gmailcontroller= TextEditingController();
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
