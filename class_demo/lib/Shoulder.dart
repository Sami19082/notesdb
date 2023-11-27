import 'package:flutter/material.dart';

class Shoulder extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Shoulder Stretch')),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset('assets/images/shoulder.gif'),
          ),
          SizedBox(
            height: 20,
          ),
          Text(
            '   SHOULDER STRETCH',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '     1.Relax your shoulders.\n     2.Raise one arm to shoulder'
                ' height, and reach it across \n        your chest.'
                '\n     3.Pull the arm slightly toward you with your other arm. '
                '\n        This will help you get a gentle stretch. Hold for about \n        6 seconds.'
                '\n     4.Repeat 2 to 4 times.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          )
        ],
      ),
    );
  }
}