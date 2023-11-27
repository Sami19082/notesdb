import 'package:flutter/material.dart';

class Incline_Push extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Incline Push-Ups',
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(child: Image.asset('assets/images/inclinepushups.gif')),
          Text(
            '  INCLINE PUSH-UPS',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 50,
          ),
          Text(
            '   1.Stand in front of your box or bench, then squat or bend \n      down and place both '
                'hands on either side of it with your \n      fingers pointing forward.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '   2.Once your hands are in the right position, step your body '
                '\n       back into a plank position, one leg at a time.',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 30,
          ),
          Text(
            '   3.Next, bend your arms to help you slowly lower your chest \n       toward the box.'
                'Straighten your arms to bring yourself \n       back up into a straight line.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          )
        ],
      ),
    );
  }
}