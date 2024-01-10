
import 'package:bloc_database/onboarding/signup.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../main.dart';
import '../note_database.dart';

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
                    prefs.setBool(AppDataBase.LOGIN_PREFS_KEY, true);
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
