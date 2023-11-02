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

 List< List<Map<String,dynamic>>> tolist = [];

 List<Map<String,dynamic>> details3=[
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

 List<Map<String,dynamic>> details4=[
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

 List<Map<String,dynamic>> details5=[
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


    return Scaffold(
      appBar: AppBar(
       title: Text('WORKOUTS'),
      ),
      body: Container(
        child:ListView.builder(
          itemCount:  tolist[widget.nindex].length,
            itemBuilder: (context, index){
        var achdata=tolist[widget.nindex][index];
              return Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.black),
                ),
                child: Column(
                  children: [
                    Text(achdata['title'],style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                    Text(achdata['sub'],style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w400),),
                    Text(achdata['subs'],style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),

                  ],
                ),
              );
            })
      ),
    );
  }
}
