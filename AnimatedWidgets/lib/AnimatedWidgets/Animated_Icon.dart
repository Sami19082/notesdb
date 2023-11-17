

import 'package:flutter/material.dart';

class Iconpage extends StatefulWidget {
  Iconpage(IconData gif_box);


  @override
  State<Iconpage> createState() => _IconpageState();
}

class  _IconpageState extends State<Iconpage> with TickerProviderStateMixin{
 late AnimationController controller;
 bool isplay = false;
  @override
  void initState() {
    controller = AnimationController(duration: Duration(seconds: 2),vsync: this);
    super.initState();
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Icon'),
        leading: Icon(Icons.icecream_outlined),
        elevation: 11,
      ),
      body: Center(
        child: GestureDetector(
          onTap: (){
            if (isplay == false){
              controller.forward();
              isplay = true;
            }else{
              controller.reverse();
              isplay = false;
            }
          },
          child: AnimatedIcon(
            icon: AnimatedIcons.play_pause,
            progress: controller,
            size: 100,
          ),
        )
      ),
    );
  }
}
