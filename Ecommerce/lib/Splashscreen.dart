import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:ecommerce/LoginPage.dart';
import 'package:ecommerce/Routes.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
void initState() {
    Timer(Duration(seconds:6),() =>
       Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
         return loginpage();
       })));
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20), // Add some space between text and animation
            Lottie.asset(
              'Assets/Lottie/Animation - 1700231757186.json', // Replace with your Lottie animation file
              width: 300,
              height: 300,
              fit: BoxFit.cover,
            ),
          Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20.0, height: 100.0),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 30.0,
                fontStyle: FontStyle.italic,
                fontWeight: FontWeight.bold,
                color: Colors.grey
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText('WELCOME TO'),
                  RotateAnimatedText('EKART'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
        )
          ],
        ),
      ),
    );
  }
}
