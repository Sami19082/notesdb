import 'package:flutter/material.dart';

class Jump extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Jumping Jacks'),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Image.asset('assets/images/jumpingj.gif'),
            ),
            Text(
              '   JUMPING JACKS',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              '      1.Start with your feet together and your arms by your sides\n   '
                  '      then jump up with your feet apart and your hands \n         overhead',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Text(
              '       2.Return to the start position then do the next rep.This \n          exercise provides'
                  ' a full-body workout and works \n          all your large muscle groups',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            )
          ],
        ));
  }
}