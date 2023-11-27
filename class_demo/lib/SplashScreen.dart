import 'dart:async';

import 'package:flutter/material.dart';

import 'Homescreen.dart';
import 'Splash.dart';

class SplashScreen extends State<Splash> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 3), () {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.all(10.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            child: Image.asset('assets/images/bodybuilding.jpg',height: 600,),
          ),
          Text('\nHome Workout For Men',style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: Colors.white
          ),)
        ],
      ),
    );
  }
}