import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class second extends StatelessWidget {
  String tag;
  second({required this.tag});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second page'),),
      body: Hero(
        tag: tag,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Colors.primaries[int.parse(tag)],
          child: Column(
            children: [
              AnimatedTextKit(
                repeatForever: true,

                  animatedTexts: [
                    FadeAnimatedText('Hello',textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                    TypewriterAnimatedText('World',textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 30), ),
                    ColorizeAnimatedText(speed: Duration(seconds: 2),
                        'Welcome to Flutter', textStyle: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,),
                        colors: Colors.primaries)
                  ])
            ],
          ),
        ),
      )
    );
  }
}
