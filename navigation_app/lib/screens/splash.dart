import 'dart:async';

import 'package:flutter/material.dart';
import 'package:navigation_app/screens/login1.dart';

class splash extends StatefulWidget {

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
@override
  void initState(){
super.initState();
Timer(
   Duration(seconds: 3),
    (){
     Navigator.pushReplacement(context,
         MaterialPageRoute(builder: (context){
           return homepage();
         }));
    });
}



  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('Asset/image/img_7.png'),
              fit: BoxFit.fill
        )
      ),

    );
  }
}
