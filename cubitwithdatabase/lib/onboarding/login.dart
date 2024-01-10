import 'package:cubitwithdatabase/appdata.dart';
import 'package:cubitwithdatabase/cubit.dart';
import 'package:cubitwithdatabase/main.dart';
import 'package:cubitwithdatabase/onboarding/signup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Login extends StatelessWidget {
  var emailcontroller = TextEditingController();
  var passcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: Column(
        children: [
          Text(
            "Welcome Back",
            style: TextStyle(fontSize: 30),
          ),
          SizedBox(
            height: 21,
          ),
          TextField(
            controller: emailcontroller,
          ),
          TextField(
            controller: passcontroller,
          ),
          ElevatedButton(
              onPressed: () async {
                if (emailcontroller.text.isNotEmpty &&
                    passcontroller.text.isNotEmpty) {
                  var email = emailcontroller.text.toString();
                  var pass = passcontroller.text.toString();
                  var appDB = AppDataBase.instance;
                  if (await appDB.authenticateUser(email, pass)) {
                    Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) {
                      return Homepage();
                    }));
                    var prefs =  await SharedPreferences.getInstance();
                    prefs.setBool(AppDataBase.LOGIN_PREF_KEY, true);
                  }else{
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Invalid Passward or Email")));
                  }
                }
              },
              child: Text("Login")),
          TextButton(onPressed: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return SignUp();
            }));
          }, child: Text("New User? Register Here"))
        ],
      ),
    );
  }
}
