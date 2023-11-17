import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class texts extends StatefulWidget {
  const texts({super.key});

  @override
  State<texts> createState() => _textsState();
}

class _textsState extends State<texts> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text("Animated Text Kit"),
        leading: Icon(Icons.text_decrease_rounded),
      ),
      body: ListView(padding: EdgeInsets.all(10),
        children:[
        Container(
          width: double.infinity,
          height: 100,
          decoration: BoxDecoration(
            color: Color(0xECE9F3FF),
            borderRadius: BorderRadius.circular(21),
          ),
          child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            const SizedBox(width: 20.0, height: 100.0),
            const Text(
              'Be',
              style: TextStyle(fontSize: 43.0),
            ),
            const SizedBox(width: 20.0, height: 100.0),
            DefaultTextStyle(
              style: const TextStyle(
                fontSize: 40.0,
                fontFamily: 'Horizon',
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  RotateAnimatedText('AWESOME'),
                  RotateAnimatedText('OPTIMISTIC'),
                  RotateAnimatedText('DIFFERENT'),
                ],
                onTap: () {
                  print("Tap Event");
                },
              ),
            ),
          ],
                ),
        ),
       SizedBox(height: 20,),
       Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xECE9F3FF),
          borderRadius: BorderRadius.circular(21),
        ),
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 32.0,
            ), child: AnimatedTextKit(
            animatedTexts: [
              FadeAnimatedText('do IT!'),
              FadeAnimatedText('do it RIGHT!!'),
              FadeAnimatedText('do it RIGHT NOW!!!'),
            ],
          ),
          ),
        )),
       SizedBox(height: 20,),
       Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xECE9F3FF),
          borderRadius: BorderRadius.circular(21),
        ),
        child: Center(
          child: DefaultTextStyle(
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
              fontStyle: FontStyle.italic
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                TyperAnimatedText('Typer....!'),
                TypewriterAnimatedText('Design first, then code'),
                TypewriterAnimatedText('Do not patch bugs out, rewrite them'),
                TypewriterAnimatedText('Do not test bugs out, design them out'),
              ],
            ),
          ),
        )),
       SizedBox(height: 20,),
       Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
          color: Color(0xECE9F3FF),
          borderRadius: BorderRadius.circular(21),
        ),
        child : Center(
          child: DefaultTextStyle(
            style: TextStyle(
                fontSize: 25,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic
            ),
            child: AnimatedTextKit(
              animatedTexts: [
                ScaleAnimatedText("SCALE"),
                ScaleAnimatedText('Think'),
                ScaleAnimatedText('Build'),
                ScaleAnimatedText('Ship'),
              ],
            ),
          ),
        )),
          SizedBox(height: 20,),
        Container(
        width: double.infinity,
          height: 100,
           decoration: BoxDecoration(
          color:Color(0xECE9F3FF),
          borderRadius: BorderRadius.circular(21),
         ),
          child : Center(
            child: DefaultTextStyle(
             style: TextStyle(
            fontSize: 25,
             fontWeight: FontWeight.bold,
            fontStyle: FontStyle.italic
            ),
              child: AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                      speed: Duration(seconds: 2),
                  "Colorized", textStyle: TextStyle(fontStyle: FontStyle.italic,fontWeight: FontWeight.bold,fontSize: 25), colors: Colors.primaries)
    ],

              )
    ))),
          SizedBox(height: 20,),
    Container(
    width: double.infinity,
    height: 120,
    decoration: BoxDecoration(
    color: Color(0xECE9F3FF),
    borderRadius: BorderRadius.circular(21),
    ),
    child: Center(
    child: TextLiquidFill(
      text: 'LIQUIDY',
      waveColor: Colors.blueAccent,
      boxBackgroundColor: Colors.redAccent,
      textStyle: TextStyle(
        fontSize: 80.0,
        fontWeight: FontWeight.bold,
      ),
      boxHeight: 120.0,
    ),

    )),
          SizedBox(height: 20,),
     Container(
        width: double.infinity,
        height: 100,
        decoration: BoxDecoration(
        color: Color(0xECE9F3FF),
        borderRadius: BorderRadius.circular(21),
    ),
        child: Center(
        child: DefaultTextStyle(
         style: TextStyle(
        fontSize: 25,
        fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic
    ),
    child: AnimatedTextKit(
         animatedTexts: [
           WavyAnimatedText("Wavy"),
    WavyAnimatedText("Hello World"),

    ],
    )

    ))),
          SizedBox(height: 20,),
    Container(
    width: double.infinity,
    height: 100,
    decoration: BoxDecoration(
    color: Color(0xECE9F3FF),
    borderRadius: BorderRadius.circular(21),
    ),
    child: Center(
    child: DefaultTextStyle(
    style: TextStyle(
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontStyle: FontStyle.italic
    ),
    child:AnimatedTextKit(
    animatedTexts: [
      FlickerAnimatedText('Flicker Animated Text')
    ],
    )
    )))
    ],
      ),
    );
  }
}
