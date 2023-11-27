import 'package:flutter/material.dart';

class Incline extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Incline Push-Ups'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset('assets/images/inclinep.gif'),
          ),
          Text(
            ' INCLINE PUSH-UPS',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 40),
          Text(
            '  1.Incline pushups are a great way to start a pushup routine if \n     you have trouble doing the basic pushup.'
                ' The exercise still \n     targets the main chest muscles (the pectoralis major and \n     minor) but puts far less '
                'stress on your elbows.',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '   2.This is perfect for beginners, for anyone doing upper body \n       and shoulder rehab, or even seniors who need to build \n       upper '
                'body strength to improve their quality of life and \n       independence.',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}