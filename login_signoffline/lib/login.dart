import 'package:flutter/material.dart';
import 'package:login_signoffline/Appdb.dart';
import 'package:login_signoffline/home.dart';
import 'package:login_signoffline/sign_up.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  var lemail = TextEditingController();
  var lpass = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome Back!!",style: TextStyle(fontSize: 35),),
          SizedBox(height: 21,),
          TextField(
            controller: lemail,
          ),
          SizedBox(height: 21,),
          TextField(
            controller: lpass,
          ),
          ElevatedButton(onPressed: ()async{
            if (lemail.text.isNotEmpty&&lpass.text.isNotEmpty){
              var Email = lemail.text.toString();
              var Pass = lpass.text.toString();
              var appDB = AppDataBase.instance;
              if(await appDB.authenticate(Email, Pass)){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                  return HomePage();
                }));
              }else{
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid UserName")));
              }
            }
          }, child: Text("Login")),
          SizedBox(height: 12,),
          TextButton(onPressed: (){
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return signup();
            }));
          }, child: Text("New user? SignUP"))
        ],
      ),
    );
  }
}
