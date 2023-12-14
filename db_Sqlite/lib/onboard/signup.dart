import 'package:db_sqlite/Usermodel.dart';
import 'package:db_sqlite/app_DB.dart';
import 'package:db_sqlite/onboard/login.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
var nameCon = TextEditingController();

var email = TextEditingController();

var pass = TextEditingController();

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
            controller: nameCon,
          ),
          SizedBox(
            height: 11,
          ),
          TextField(
            controller: email,
          ),
          SizedBox(
            height: 11,
          ),
          TextField(
            controller: pass,
          ),
          SizedBox(
            height: 11,
          ),
          ElevatedButton(onPressed: ()async{
            if(nameCon.text.isNotEmpty &&
            email.text.isNotEmpty&&
            pass.text.isNotEmpty){
              var appDB = AppDataBase.instance;
              var check = await appDB.createaccount(UserModel(
                  user_id: 0,
                  user_name: nameCon.text.toString(),
                  user_email: email.text.toString(),
                  user_pass: pass.text.toString()));

              var msg = "";
               if(check = true){
                 msg = " Account created successfully";
                 Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                   return Login();
                 }));
               }else{
                 msg = "email already exist !!";
               }

              ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));
            }
           }, child: Text("Sign_up")),
          TextButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return Login();
            }));
          }, child: Text("Already Have An Account, Login Now"))
        ],
      ),
    );
  }
}
