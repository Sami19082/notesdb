import 'dart:async';

import 'package:flutter/material.dart';

import 'Animated_Widgets.dart';

class splash extends StatefulWidget {
  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> with TickerProviderStateMixin{
  late  AnimationController controller;
  bool isplay = false;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2))..addListener(() {
       setState(() {

       });
    })..forward();
   super.initState();
   Timer(Duration(seconds: 3), () {
     Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
       return Animated();
     }));
   });
  }
  
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.shade100.withOpacity(0.8),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedIcon(icon:AnimatedIcons.play_pause, progress: controller,size: 100,),
            SizedBox(height: 50,),
            Text('Animated Widgets',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 35,fontStyle:FontStyle.italic,color: Colors.black),)
          ],
        ),
      ),
    );
  }
}
