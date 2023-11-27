import 'package:flutter/material.dart';

import 'Levels.dart';
import 'Levels1.dart';
import 'Levels2.dart';
import 'Levels3.dart';
import 'main.dart';

class HomeScreen extends StatelessWidget {
  var arrContent = [
    {"name": "ARM & CHEST WORKOUT", 'img': 'assets/images/biceps.jpg'},
    {"name": "ABS WORKOUT", 'img': 'assets/images/body1.jpg'},
    {"name": "SHOULDER & BACK WORKOUT", 'img': 'assets/images/shoulder1.jpg'},
    {"name": "LEG WORKOUT", 'img': 'assets/images/bodylegs.jpg'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Home Workout At Home',
            style: TextStyle(
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        body: Card(
          elevation: 10,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30)
          ),
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsetsDirectional.all(8.0),
                child: Stack(children: [
                  Image.asset(arrContent[index]['img']!),
                  InkWell(
                      child: InkWell(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                if (index == 0) {
                                  return Levels();
                                } else if (index == 1) {
                                  return Levels1();
                                } else if (index == 2) {
                                  return Levels2();
                                } else if (index == 3) {
                                  return Levels3();
                                } else {
                                  return Text('No Content Found');
                                }
                              }));
                        },
                        child: Container(
                          height: 150,
                          child: Padding(
                            padding: const EdgeInsetsDirectional.all(8.0),
                            child: Row(
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      arrContent[index]['name']!,
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 20,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      )),
                ]),
              );
            },
            itemCount: arrContent.length,
          ),
        ));
  }
}