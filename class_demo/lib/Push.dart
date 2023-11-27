import 'package:flutter/material.dart';

class Push extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Push-Ups'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset('assets/images/push.gif'),
            ),
            Text(
              '  Push-Ups',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '   1.Contract your abs and tighten your core by pulling'
                  ' your \n       belly button toward your spine. ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '   2.Inhale as you slowly bend your elbows and lower yourself \n      to the floor,'
                  ' until your elbows are at a 90-degree angle.',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '   3.Exhale while contracting your chest muscles and pushing \n      back '
                  'up through your hands, returning to the start position. ',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ));
  }
}