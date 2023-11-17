import 'package:flutter/material.dart';

class textstyl extends StatefulWidget {
  const textstyl({super.key});

  @override
  State<textstyl> createState() => _textstylState();
}

class _textstylState extends State<textstyl> {
  bool first = true;
  double fontSize = 60;
  Color color = Colors.blueAccent.shade100;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Default TextStyle'),
        leading: Icon(Icons.text_fields),
      ),
      body:Column(
        children:[
          Expanded(
            flex: 3,
            child: Center(
              child: SizedBox(
                height: 120,
                child: AnimatedDefaultTextStyle(
                  duration: Duration(microseconds: 200),
                  style: TextStyle(
                    fontSize:  fontSize,
                    color: color,
                    fontWeight: FontWeight.bold,
                  ),
                  child: Text('Flutter'),
                ),),
            ),
          ),
          TextButton(onPressed: (){
            setState(() {
              fontSize = first ? 90 : 60;
              color = first ? Colors.lightBlueAccent : Colors.red;
              first = ! first;
            });
          }, child: Text('Switch',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),))
        ],
      )
    );
  }
}
