import 'dart:math';

import 'package:flutter/material.dart';

class opacity extends StatefulWidget {

  @override
  State<opacity> createState() => _SecondPageState();
}

class _SecondPageState extends State<opacity> {
  double mocupicity=0.5;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Opacity'),
        leading: Icon(Icons.gif_box),
        elevation: 11,
      ),
      body: Center(
        child: InkWell(
          onTap: (){
            mocupicity = mocupicity == 1? 0.5 : 1 ;
            setState(() {

            });
          },
          child: AnimatedOpacity(
            opacity:  mocupicity,
            duration: Duration(seconds: 2),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
