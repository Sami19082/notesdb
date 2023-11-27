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

class Level1 extends StatelessWidget {
  var LevelContent = [
    {"name": "JUMPING JACKS", "name1": "00:20"},
    {"name": "INCLINE PUSH-UPS", "name1": "×4"},
    {"name": "BOX PUSH-UPS", "name1": "×3"},
    {"name": "PUSH-UPS", "name1": "×3"},
    {"name": "INCLINE PUSH-UPS", "name1": "×3"},
    {"name": "KNEE PUSH-UPS", "name1": "×4"},
    {"name": "SHOULDER STRETCH", "name1": "00:20"},
    {"name": "COBRA STRETCH", "name1": "00:20"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Level 1'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) {
          return Padding(
              padding: const EdgeInsetsDirectional.all(8.0),
              child: Container(
                height: 90,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.white,
                ),
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
                          height: 10,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
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
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ));
        },
        itemCount: LevelContent.length,
      ),
    );
  }
}