import 'package:flutter/material.dart';
class Car extends StatefulWidget {
  const Car({super.key});

  @override
  State<Car> createState() => _CarState();
}

class _CarState extends State<Car> with TickerProviderStateMixin{
  late AnimationController controller;
  late Animation<double> animationDouble;
  @override
  void initState() {
    controller = AnimationController(
      duration: Duration(seconds: 2),vsync: this)..addListener(() {
        setState(() {

        });
    })..repeat(reverse: true);
    animationDouble = Tween<double>(begin: 0.0 , end: 1000.0).animate(controller);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Car'),
        leading: Icon(Icons.car_rental),
      ),
      body: AnimatedBuilder(
        animation: controller ,
        builder: (_ ,mchild){
          return Transform.translate(
            offset: Offset(controller.value*100, 0),
            child: mchild,
          );
        },
      child: Center(
        child: Stack(
          children: [
            SizedBox(
                height: 500,
                width: 500,
                child: Image.asset('Assets/images/car.png')),
            Positioned(
              bottom: 178,
             right: 103,
              child: AnimatedBuilder(
                animation: controller ,
                builder: (_ ,mchild){
                  return Transform.rotate(
                    angle: animationDouble.value ,
                    child: mchild,
                  )..transform.translate(controller.value);
                },
                child: SizedBox(
                    height: 65,
                    width: 65,
                    child: Image.asset('Assets/images/wheel.png')),
              ),
            ),
            Positioned(
              bottom: 178,
              left: 75,
              child: AnimatedBuilder(
                animation: controller ,
                builder: (_ ,mchild){
                  return Transform.rotate(
                    angle: animationDouble.value ,
                    child: mchild,
                  )..transform.translate(controller.value);
                },
                child: SizedBox(
                    height: 65,
                    width: 65,
                    child: Image.asset('Assets/images/wheel.png')),
              ),
            ),
          ],
        ),
      ),
      ) );
  }
}
