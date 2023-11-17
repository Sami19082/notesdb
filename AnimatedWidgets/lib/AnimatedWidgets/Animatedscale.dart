import 'package:flutter/material.dart';

class scale extends StatefulWidget {
  const scale({super.key});

  @override
  State<scale> createState() => _scaleState();
}

class _scaleState extends State<scale> with TickerProviderStateMixin{
  late final AnimationController controller = AnimationController(
    duration:Duration(seconds: 2),
      vsync: this)..repeat(reverse:  true);

  late final Animation<double>animation = CurvedAnimation(
      parent: controller,
      curve: Curves.fastOutSlowIn);

  void dispose(){
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Scale'),
        leading: Icon(Icons.format_size),
      ),
      body: Center(
        child: ScaleTransition(
            scale: animation,
          child: FlutterLogo(size: 100,),)
      ),
    );
  }
}
