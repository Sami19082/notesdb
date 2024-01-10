import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:expenseapp_bloc/Database/app_database.dart';
import 'package:expenseapp_bloc/Models/user_model.dart';
import 'package:expenseapp_bloc/custom_widgets/login_textfield.dart';
import 'package:expenseapp_bloc/onboarding/login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatelessWidget {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login Page"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 100,
            ),
            AnimatedTextKit(
                repeatForever: true,
                isRepeatingAnimation: true,
                animatedTexts: [
                  WavyAnimatedText("Create Your Account",
                      textStyle: TextStyle(
                          fontSize: 30,
                          color: Colors.black,
                          fontWeight: FontWeight.w900)),
                ]),
            SizedBox(
              height: 20,
            ),
            LoginTextField(
                controller: nameController, hintText: "Enter Your Name "),
            SizedBox(
              height: 10,
            ),
            LoginTextField(
                controller: nameController, hintText: "Enter Your email "),
            SizedBox(
              height: 10,
            ),
            LoginTextField(
                controller: nameController, hintText: "Enter Your password "),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: () async {
                    if (nameController.text.isNotEmpty &&
                        emailController.text.isNotEmpty &&
                        passController.text.isNotEmpty) {
                      var appDb = AppDataBase.instance;
                      var check = await appDb.createAccount(UserModel(
                          UID: 0,
                          uname: nameController.text.toString(),
                          umail: emailController.text.toString(),
                          upass: passController.text.toString()));
                      var msg = '';
                      if (check) {
                        msg = "Account created successfully ";
                        Navigator.pushReplacement(context,
                            MaterialPageRoute(builder: (context) {
                          return Loginscreen();
                        }));
                      } else {
                        msg = "User Already exist";
                      }
                      ScaffoldMessenger.of(context)
                          .showSnackBar(SnackBar(content: Text(msg)));
                    }
                  },
                  child: Text(
                    "Sign_UP",
                    style: TextStyle(
                        fontSize: 22,
                        color: Colors.black,
                        fontWeight: FontWeight.bold),
                  )),
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have account ??",
                  style: TextStyle(fontSize: 18),
                ),
                TextButton(
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                        return Loginscreen();
                      }));
                    },
                    child: Text(
                      "Login",
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.purple),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
