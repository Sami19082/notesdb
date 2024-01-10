import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:expenseapp_bloc/Database/app_database.dart';
import 'package:expenseapp_bloc/custom_widgets/login_textfield.dart';
import 'package:expenseapp_bloc/onboarding/signup.dart';
import 'package:expenseapp_bloc/screens/homepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Loginscreen extends StatelessWidget {
  static final String LOGIN_PREFS_KEY = "isLogin";
  final TextEditingController emailcontroller = TextEditingController();
  final TextEditingController passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Login Page"),
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      AnimatedTextKit(
                          repeatForever: true,
                          isRepeatingAnimation: true,
                          animatedTexts: [
                            WavyAnimatedText("Welcome",
                                textStyle: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w900)),
                          ]),
                      AnimatedTextKit(
                          repeatForever: true,
                          isRepeatingAnimation: true,
                          animatedTexts: [
                        TyperAnimatedText("Back",
                            speed: Duration(microseconds: 250),
                            textStyle: TextStyle(
                                fontWeight: FontWeight.w900,
                                color: Colors.black,
                                fontSize: 30)),
                      ]),
                      LoginTextField(
                          controller: emailcontroller,
                          hintText: "Enter your Email"),
                      SizedBox(
                        height: 10,
                      ),
                      LoginTextField(
                          controller: passController,
                          hintText: "Enter your Password"),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        width: double.infinity,
                        height: 50,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Colors.orange),
                            onPressed: () async {
                              if (emailcontroller.text.isNotEmpty &&
                                  passController.text.isNotEmpty) {
                                var email = emailcontroller.text.toString();
                                var pass = passController.text.toString();
                                var appDB = AppDataBase.instance;
                                if (await appDB.authenticateUser(email, pass)) {
                                  Navigator.pushReplacement(context,
                                      MaterialPageRoute(builder: (context) {
                                    return HomePage();
                                  }));
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(content: Text("Invalid Details")));
                                }
                                var prefs = await SharedPreferences.getInstance();
                                prefs.setBool(LOGIN_PREFS_KEY, true);
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold),
                            )),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(onPressed: (){

                          }, child: Text("Forget Password ?",style: TextStyle(fontSize: 17,color: Colors.black),)),
                          Divider(
                            height: 15,
                            thickness: 2,
                            color: Colors.black,
                          ),
                          TextButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return SignUp();
                            }));
                          }, child: Text("Create Account",style:  TextStyle(fontSize: 22,color: Colors.purple),))
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
