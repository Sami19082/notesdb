import 'package:flutter/material.dart';
import 'package:navigation_app/screens/3rdpage.dart';

class lastpage extends StatefulWidget {
 int nindex;
 lastpage({required this.nindex});

  @override
  State<lastpage> createState() => _lastpageState();
}

class _lastpageState extends State<lastpage> {
  List<Map<String,dynamic>> details=[
    {
      'title':'JUMPING JACKS 20s',
      'subs':'Start with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
      'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
    },
    {
      'title':'Abdominal Crunches',
      'subs':'with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
      'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
    },
    {
      'title':'Russian Twist',
      'subs':'your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
      'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
    },
    {
      'title':'Mountain Climber',
      'subs':'r and your arms by your sides, then jump up with your feet apart and your hands overhead',
      'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
    },
    {
      'title':'Leg Raises',
      'subs':' then jump up with your feet apart and your hands overhead',
      'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
    },

  ];

 List<Map<String,dynamic>> details2=[
   {
     'title':'Incline Pushups',
     'subs':'Start with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'knee push up',
     'subs':'with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'wide push up',
     'subs':'your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'hindu pushup',
     'subs':'r and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'cobra stretch',
     'subs':' then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },

 ];


 List<Map<String,dynamic>> details3=[
   {
     'title':'Arms Raises',
     'subs':'Start with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Side Arm Raise',
     'subs':'with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Triceps Dips',
     'subs':'your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'ARms Circle',
     'subs':'r and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Diamond Pushup',
     'subs':' then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },

 ];

 List<Map<String,dynamic>> details4=[
   {
     'title':'Side Hop',
     'subs':'Start with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Squats',
     'subs':'with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Backward Lunge',
     'subs':'your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Donkey kick',
     'subs':'r and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Knee to chest',
     'subs':' then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },

 ];

 List<Map<String,dynamic>> details5=[
   {
     'title':'Arms Raises',
     'subs':'Start with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Knee Push Up',
     'subs':'with your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Cat Cow pose',
     'subs':'your Feet togather and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Childs Poser',
     'subs':'r and your arms by your sides, then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },
   {
     'title':'Side Arms Raise',
     'subs':' then jump up with your feet apart and your hands overhead',
     'sub': 'Return to start position then do the next rap. this exercise provides a full body workout and works all your large muscle groups'
   },

 ];

  List< List<Map<String,dynamic>>> tolist = [];

  @override
  void initState() {
    super.initState();
    tolist.add(details);
    tolist.add(details2);
    tolist.add(details3);
    tolist.add(details4);
    tolist.add(details5);
  }

  Widget build(BuildContext context) {

    var achdata='';
    if(widget.nindex==0){
      achdata = tolist[widget.nindex][index] as String;
    }


    return Scaffold(
      appBar: AppBar(
       title: Text('WORKOUTS'),
      ),
      body: Container(
child: Text(''),
              ),);


  }
}
