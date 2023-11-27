import 'package:flutter/material.dart';

import 'Level1.dart';
import 'Level10.dart';
import 'Level11.dart';
import 'Level12.dart';
import 'Level13.dart';
import 'Level14.dart';
import 'Level15.dart';
import 'Level3.dart';
import 'Level4.dart';
import 'Level5.dart';
import 'Level6.dart';
import 'Level7.dart';
import 'Level8.dart';
import 'Level9.dart';
import 'level2.dart';

class Levels3 extends StatelessWidget {
  var arrContent = [
    {
      'name': 'LEVEL 1/1:45',
      'subtitle': 'Light Intensity',
      'image': 'assets/images/one.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 2/2:00',
      'subtitle': 'Light Intensity',
      'image': 'assets/images/two.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 3/2:35',
      'subtitle': 'Light Intensity',
      'image': 'assets/images/three2.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 4/3:15',
      'subtitle': 'Light Intensity',
      'image': 'assets/images/four1.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 5/3:50',
      'subtitle': 'Light Intensity',
      'image': 'assets/images/five.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 6/4:30',
      'subtitle': 'Light Intensity',
      'image': 'assets/images/six.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 7/5:10',
      'subtitle': 'Light Intensity',
      'image': 'assets/images/seven.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 8/4:10',
      'subtitle': 'Moderate Intensity',
      'image': 'assets/images/eight.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 9/4:30',
      'subtitle': 'Moderate Intensity',
      'image': 'assets/images/nine.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 10/5:15',
      'subtitle': 'Moderate Intensity',
      'image': 'assets/images/ten.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 11/5:25',
      'subtitle': 'Moderate Intensity',
      'image': 'assets/images/eleven.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 12/6:00',
      'subtitle': 'Moderate Intensity',
      'image': 'assets/images/twelve.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 13/6:35',
      'subtitle': 'High Intensity',
      'image': 'assets/images/thirteen.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 14/7:25',
      'subtitle': 'High Intensity',
      'image': 'assets/images/fourteen.png',
      'arrow': '>'
    },
    {
      'name': 'LEVEL 15/6:05',
      'subtitle': 'High Intensity',
      'image': 'assets/images/fifteen.png',
      'arrow': '>'
    },
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LEGS'),
      ),
      body: ListView.builder(
        itemBuilder: (context, index) => Card(
          elevation: 7,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(26)),
          child: ListTile(
            leading: CircleAvatar(
              child: Image.asset(arrContent[index]['image']!),
              radius: 30,
            ),
            title: InkWell(
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) {
                  if (index == 0) {
                    return Level1();
                  } else if (index == 1) {
                    return Level2();
                  } else if (index == 2) {
                    return Level3();
                  } else if (index == 3) {
                    return Level4();
                  } else if (index == 4) {
                    return Level5();
                  } else if (index == 5) {
                    return Level6();
                  } else if (index == 6) {
                    return Level7();
                  } else if (index == 7) {
                    return Level8();
                  } else if (index == 8) {
                    return Level9();
                  } else if (index == 9) {
                    return Level10();
                  } else if (index == 10) {
                    return Level11();
                  } else if (index == 11) {
                    return Level12();
                  } else if (index == 12) {
                    return Level13();
                  } else if (index == 13) {
                    return Level14();
                  } else if (index == 14) {
                    return Level15();
                  } else {
                    return Text('No Content Found');
                  }
                }));
              },
              child: Text(
                arrContent[index]['name']!,
                style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              ),
            ),
            subtitle: Text(
              arrContent[index]['subtitle']!,
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            trailing: Column(
              children: [
                SizedBox(
                  height: 7,
                ),
                CircleAvatar(
                  radius: 12,
                  child: Text(
                    arrContent[index]['arrow']!,
                  ),
                )
              ],
            ),
          ),
        ),
        itemCount: arrContent.length,
      ),
    );
  }
}