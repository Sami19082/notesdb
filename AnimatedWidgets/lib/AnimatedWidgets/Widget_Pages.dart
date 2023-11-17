import 'dart:math';

import 'package:flutter/material.dart';

class SecondPage extends StatefulWidget {

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  double mlength = 100;
  double mheight = 100;
  Color mcolor = Colors.blue;
  double mborder = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Container'),
        leading: Icon(Icons.gif_box),
        elevation: 11,
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            mheight= Random().nextInt(300).toDouble();
            mlength = Random().nextInt(300).toDouble();
            mcolor = Colors.primaries[Random().nextInt(Colors.primaries.length-1)];
            mborder = Random().nextInt(21).toDouble();
            setState(() {

            });
          },
          child: AnimatedContainer(
            duration: Duration(seconds: 2),
            height: mheight,
            width: mlength,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(mborder),
              color: mcolor,
            ),
          ),
        ),
      ),
    );
  }
}
