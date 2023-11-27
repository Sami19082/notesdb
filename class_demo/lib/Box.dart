import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Box Push-Ups')),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset('assets/images/boxp.gif'),
            ),
            Text(
              ' BOX PUSH-UPS',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '  1.How to: Start on your hands and knees in table top \n     position. '
                  'With your arms straight, your shoulders should \n     be over your'
                  ' wrists and your hips should be over your \n     knees (a). '
                  'Bend your elbows and lower your upper body \n     slowly to the '
                  'ground (b). When your nose reaches the floor, \n     press up with '
                  'your arms and return to the starting position \n    (c). Perform t'
                  'hree sets of 8-10 reps.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ));
  }
}