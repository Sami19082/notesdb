
import 'package:flutter/material.dart';
import 'dart:math' as math;

class Builders extends StatefulWidget {

  @override
  State<Builders> createState() => _BuilderState();
}

class _BuilderState extends State<Builders> with TickerProviderStateMixin{
  late final AnimationController controller = AnimationController(
    duration: Duration(seconds: 10),
      vsync: this,)..repeat();
  @override
  void dispose(){
    controller.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Builder'),
        elevation: 11,
        leading: Icon(Icons.build),
      ),
      body:Center(
        child: AnimatedBuilder(
          animation: controller,
          child: FlutterLogo(
            size: 100,
          ),
          builder: (BuildContext context, Widget? child) {
            return Transform.rotate(
                angle: controller.value*2.0*math.pi,
              child: child,
            );
          },
        ),
      ),
    );
  }
}
