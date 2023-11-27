
import 'package:flutter/material.dart';

class Cobra extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cobra Stretch'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Image.asset('assets/images/Cobra.gif'),
          ),
          Text(
            '   COBRA STRETCH',
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 40,
          ),
          Text(
            '      1.Place your hands palms down on the ground beneath \n          your shoulders.'
                '\n     2.Lift your chest up off the ground by straightening your \n        arms.'
                '\n     3.For Cobra Pose, lie down on your abdomen and point \n        your feet behind you. Bring your hands next to your'
                '\n        chest and engage the gluteals and back muscles as \n        you curl '
                'the chest up away from the floor, supporting \n        the shape with your arms.',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
          )
        ],
      ),
    );
  }
}