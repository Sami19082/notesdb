import 'package:flutter/material.dart';
import 'package:login_signoffline/Appdb.dart';
import 'package:login_signoffline/login.dart';
import 'package:login_signoffline/usermodel.dart';

class signup extends StatelessWidget {
 var name = TextEditingController();
 var email = TextEditingController();
 var pass = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign_Up"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Create Account",style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
        SizedBox(height: 21,),
        TextField(
          controller: name,
        ),
        SizedBox(height: 21,),
        TextField(
          controller: email,
        ),
        SizedBox(height: 21,),
        TextField(
          controller: pass
        ),
        ElevatedButton(onPressed: ()async{
          if(name.text.isNotEmpty&&email.text.isNotEmpty&&pass.text.isNotEmpty){
            var appdb = AppDataBase.instance;
          var check = await appdb.createAccount(UserModel(
                user_id: 0,
                user_name: name.text.toString(),
                user_pass: pass.text.toString(),
                user_mail: email.text.toString()));

          var msg = "";
          if(check){
            msg = "Account created successfully";
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return Login();
            }));
          }else{
            msg = "Account already exist";
          }

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg)));

          }
        }, child: Text("Sign_up")),
        SizedBox(height: 12,),
        TextButton(onPressed: (){
          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
            return Login();
          }));
        }, child: Text("Already have account!!"))
      ],
      ),
    );
  }
}
