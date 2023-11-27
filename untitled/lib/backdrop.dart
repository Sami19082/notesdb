import 'dart:ui';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: cutter()));
}
class cutter extends StatelessWidget {
  const cutter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('backdrop widget'),
        leading: Icon(Icons.widgets),
      ),
      body: Stack(
        children: [
          Image.asset('assets/image/img.png'),
          BackdropFilter(filter: ImageFilter.blur(
            sigmaY: 5,
            sigmaX: 5),
            child: Center(
              child: Container(
              width: 500,
              height: 500,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.transparent.withOpacity(0.3),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_box_rounded,size: 35,color: Colors.white.withOpacity(.6)),
                  SizedBox(height: 20,),
                  Text('Welcome Dear',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white.withOpacity(0.6)),),
                ],
              ),
                        ),
            ),
          ),


        ],
      ),
    );
  }
}
