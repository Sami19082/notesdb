
import 'package:flutter/material.dart';

void main (){
  runApp(MaterialApp(home: Controllers(),));
}

class Controllers extends StatefulWidget {
  const Controllers({super.key});

  @override
  State<Controllers> createState() => _ControllersState();
}

class _ControllersState extends State<Controllers> with SingleTickerProviderStateMixin {
late  AnimationController controller;
late Animation<double> animationDouble;
late Animation<Color?> animationTween;
@override
  void initState() {
    super.initState();
    controller = AnimationController(vsync: this, duration: Duration(seconds: 2)) ..addListener(() {
      print(animationDouble.value);
      setState(() {});
    })..repeat(
      //reverse: false // restart
      reverse : true // reverse
    );
    animationDouble = Tween<double>(begin: 100,end: 200).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
    animationTween = ColorTween(begin: Colors.green,end: Colors.orangeAccent).animate(CurvedAnimation(parent: controller, curve: Curves.bounceOut));
  }

  // @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Controller'),
      ),
      body: Center(
        child:  Material(
          child: Container(
            width: animationDouble.value,
            height: animationDouble.value,
            color: animationTween.value,
          ),
        )
      ),
    );
  }
}
