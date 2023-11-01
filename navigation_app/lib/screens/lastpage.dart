import 'package:flutter/material.dart';
import 'package:navigation_app/screens/3rdpage.dart';

class lastpage extends StatelessWidget {
 int index;
 lastpage({required this.index});
  List<Map<String,dynamic>> details=[
    {
      'title':'JUMPING JACKS 20s',
      'subs':'Start with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
      'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
    },
    {
      'title':'JUMPING JACKS 20s',
      'subs':'Start with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
      'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
    },
    {
      'title':'JUMPING JACKS 20s',
      'subs':'Start with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
      'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
    },
    {
      'title':'JUMPING JACKS 20s',
      'subs':'Start with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
      'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
    },
    {
      'title':'JUMPING JACKS 20s',
      'subs':'Start with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
      'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
    },

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
       title: Text(details[index]['title']),
      ),
      body: Container(
        child:Column(
          children: [
            Text(details[index]['sub']),
            Text(details[index]['subs'])

          ],
        ),
      ),
    );
  }
}
