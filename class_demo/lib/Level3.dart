import 'package:flutter/material.dart';
import 'Box.dart';
import 'Cobra.dart';
import 'Incline.dart';
import 'Incline_Push.dart';
import 'Jump.dart';
import 'Knee.dart';
import 'Push.dart';
import 'Shoulder.dart';
import 'main.dart';

class Level3 extends StatelessWidget {
  var LevelContent = [
    {"name": "JUMPING JACKS", "name1": "00:20"},
    {"name": "INCLINE PUSH-UPS", "name1": "×10"},
    {"name": "PUSH-UPS", "name1": "×5"},
    {"name": "WIDE ARM PUSH-UPS", "name1": "×5"},
    {"name": "INCLINE PUSH-UPS", "name1": "×8"},
    {"name": "PUSH-UPS", "name1": "×5"},
    {"name": "WIDE ARM PUSH-UPS", "name1": "×5"},
    {"name": "SHOULDER STRETCH", "name1": "00:20"},
    {"name": "CHEST STRETCH", "name1": "00:20"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Level 3'),
        ),
        body: ListView.builder(
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsetsDirectional.all(8.0),
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(26)),
                child: Padding(
                    padding: const EdgeInsetsDirectional.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                              if (index == 0) {
                                return Jump();
                              } else if (index == 1) {
                                return Incline();
                              } else if (index == 2) {
                                return Box();
                              } else if (index == 3) {
                                return Push();
                              } else if (index == 4) {
                                return Incline_Push();
                              } else if (index == 5) {
                                return Knee();
                              } else if (index == 6) {
                                return Shoulder();
                              } else if (index == 7) {
                                return Cobra();
                              } else {
                                return Text('No Content Found');
                              }
                            }));
                      },
                      child: Row(
                        children: [
                          SizedBox(
                            height: 11,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                LevelContent[index]['name']!,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                ),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                LevelContent[index]['name1']!,
                              )
                            ],
                          )
                        ],
                      ),
                    )),
              ),
            );
          },
          itemCount: LevelContent.length,
        ));
  }
}