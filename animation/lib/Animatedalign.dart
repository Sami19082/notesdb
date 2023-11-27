import 'dart:math';

import 'package:flutter/material.dart';

class align extends StatefulWidget {
  @override
  State<align> createState() => _alignState();
}

class _alignState extends State<align> {
  Alignment malign = Alignment.topLeft;
  var arr = [
    Alignment.topLeft,
    Alignment.topCenter,
    Alignment.topRight,
    Alignment.bottomCenter,
    Alignment.bottomLeft,
    Alignment.bottomRight,
    Alignment.center,
    Alignment.centerRight,
    Alignment.centerLeft,
  ];
  @override
  Widget build(BuildContext context) {
    return  Material(
      child: InkWell(
        onTap: (){
          malign = arr [Random().nextInt(arr.length-1)];
          setState(() {

          });
        },
        child: Center(
          child: AnimatedAlign(
          duration: Duration(seconds: 2),
          alignment: malign,
           child: Text('Hello',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,fontSize: 35,color: Colors.purpleAccent),),
          ),
        ),
      ),
    );
  }
}
