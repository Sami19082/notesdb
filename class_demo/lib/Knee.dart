import 'package:flutter/material.dart';

class Knee extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Knee Push-Ups'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset('assets/images/knee.gif'),
            ),
            Text(
              '   KNEE PUSH-UPS',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
              '     1.Kneel on the floor.\n\n     2.Extend arms and put hands '
                  'shoulder-width apart on the \n        floor in front of you.'
                  '\n\n     3.Tighten abs while you bend arms, '
                  'lowering your torso \n        until chest grazes the floor.'
                  '\n\n     4.Push torso back up by straightening arms. Slow and \n        steady, baby.'
                  '\n\n     5.Rinse and repeat.',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ));
  }
}