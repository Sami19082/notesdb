import 'dart:async';

import 'package:bloc_database/main.dart';
import 'package:bloc_database/note_database.dart';
import 'package:bloc_database/onboarding/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async{

      var prefs = await SharedPreferences.getInstance();
      bool? check = prefs.getBool(AppDataBase.LOGIN_PREFS_KEY);

      Widget navigateTo = Login();

      if(check!=null && check){
        navigateTo = Homepage();
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return navigateTo;
      }));
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Splash Page"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text("Welcome To Our Notes App",style: TextStyle(fontSize: 35,color: Colors.yellow,fontWeight: FontWeight.bold,fontStyle: FontStyle.italic),),
          SizedBox(height: 15,),
          Icon(Icons.note_add_sharp,size: 30,color: Colors.brown,),
        ],
      ),
    );
  }
}
