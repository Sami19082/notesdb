import 'dart:async';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefs/sharedpref.dart';
import 'package:sharedprefs/showopen.dart';

class splashscreen extends StatefulWidget {
  @override
  State<splashscreen> createState() => _splashscreenState();
}

class _splashscreenState extends State<splashscreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 2), () async{
      var preffs = await SharedPreferences.getInstance();
      bool? checklogin = preffs.getBool(Loginpagestate.LOGINKEY);
      Widget NavigateTo = Loginpage();
      if(checklogin!=null && checklogin){
        NavigateTo = Homepage();
      }

      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
        return NavigateTo;
      }));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade200,
      body: Center(
        child: Column(
          children: [
           SizedBox(
              width: 300,height: 300, child: Icon(Icons.flutter_dash_outlined)),
            Text("Flutterian",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)
          ],
        ),
      ),
    );
  }
}
