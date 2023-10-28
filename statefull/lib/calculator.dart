import 'dart:io';

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: Homepage()));
}
class Homepage extends StatefulWidget{
  @override
  State<StatefulWidget> createState()=> HomepageState();
}
class HomepageState extends State<Homepage>{
  var text1= TextEditingController();
  var text2= TextEditingController();
  var result= 0;
  int orb=0;
  int a=0;
  int b=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CALCULATOR'),
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center ,
          children: [
            Center(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text('Calculator',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 40)),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: text1,
              decoration: InputDecoration(
                label: Text('ENTER A NUMBER',style: TextStyle(fontStyle: FontStyle.italic),),
                hintText: 'enter first number',
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey,
                        width: 2
                    )
                ),
              ),),
            SizedBox(
              height: 20,
            ),
            TextField(
              controller: text2,
              decoration: InputDecoration(
                label: Text('ENTER A NUMBER',style: TextStyle(fontStyle: FontStyle.italic)),
                hintText: 'enter first number',
                hintStyle: TextStyle(fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: BorderSide(color: Colors.white,style: BorderStyle.solid,),
                ),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.grey,
                        width: 2
                    )
                ),
              ),),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      onPressed: (){

                        orb= 1;
                      },
                      child: Text('ADD',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.cyan))),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      onPressed: (){

                        orb= 2;

                      },
                      child: Text('SUB',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.cyan))),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      onPressed: (){

                        orb= 3;

                      },
                      child: Text('MULTI',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.cyan))),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: ElevatedButton(
                      onPressed: (){

                        orb=4;

                      },
                      child: Text('DIV',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.cyan))),
                ),

              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: ElevatedButton (
                  onPressed: (){
                    a = int.parse(text1.text.toString());
                    b = int.parse(text2.text.toString());
                    if (a!=0 && b!=0) {
                      if (orb == 1) {
                        // int a = int.parse(text1.text.toString());
                        // int b = int.parse(text2.text.toString());
                        int cal = a + b;
                        setState(() {
                          result = cal;
                        });
                      } else if (orb == 2) {
                        // int a = int.parse(text1.text.toString());
                        // int b = int.parse(text2.text.toString());
                        int cal = a - b;
                        setState(() {
                          result = cal;
                        });
                      } else if (orb == 3) {
                        // int a = int.parse(text1.text.toString());
                        // int b = int.parse(text2.text.toString());
                        int cal = a * b;
                        setState(() {
                          result = cal;
                        });
                      } else if (orb == 4) {
                        // int a = int.parse(text1.text.toString());
                        // int b = int.parse(text2.text.toString());
                        int cal = a ~/ b;
                        setState(() {
                          result = cal;
                        });
                      }
                    }else{
                      print('sami');
                    }

                  },
                  child: Text('Calculate',style: TextStyle(fontStyle: FontStyle.italic,color: Colors.cyan))),
            ),
            result== 0.0 ? Container():Center(
              child: Text('RESULT : $result',style: TextStyle(fontStyle: FontStyle.italic,fontSize: 25)),
            )
          ],
        ),
      ),
    );
  }
}