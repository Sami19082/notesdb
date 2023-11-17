import 'dart:math';

import 'package:flutter/material.dart';

class position extends StatefulWidget {
  const position({super.key});

  @override
  State<position> createState() => _positionState();
}

class _positionState extends State<position> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Animated Positioned"),
        leading: Icon(Icons.point_of_sale_sharp),
      ),
      body: Center(
        child: SizedBox(
          width: 200,
          height: 350,
          child: Stack(
            children: [
              AnimatedPositioned(
                height:  selected ? 200.0 : 50.0,
                  width: selected ? 50.0: 200.0,
                  top:  selected ? 50.0 : 150.0,
                  curve: Curves.fastOutSlowIn,
                  duration: Duration(seconds: 2),
                child: InkWell(
                  onTap: (){
                    setState(() {
                      selected = ! selected;
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent,
                      borderRadius: BorderRadius.circular(21),
                    ),
                  ) ,
                ),),

            ],
          ),
        ),
      ),
    );
  }
}
