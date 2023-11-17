import 'dart:math';

import 'package:flutter/material.dart';

class Cross extends StatefulWidget {

  @override
  State<Cross> createState() => _SecondPageState();
}

class _SecondPageState extends State<Cross> {
  bool  isfade = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Cross Fade'),
        leading: Icon(Icons.gif_box),
        elevation: 11,
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            isfade = !isfade;
            setState(() {

            });
          },
          child: AnimatedCrossFade(
            crossFadeState: isfade ? CrossFadeState.showFirst : CrossFadeState.showSecond ,
            duration: Duration(seconds: 2),
            firstChild: Container(
              height: 200,
              width: 200,
              color: Colors.blue,
              child: Center(child: Text('Tap to revel',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),)),
            ),
            secondChild: Container(
              width: 200,
              height: 200,
              color: Colors.redAccent,
              child: Icon(Icons.ice_skating),
            ),
          ),
        ),
      ),
    );
  }
}
