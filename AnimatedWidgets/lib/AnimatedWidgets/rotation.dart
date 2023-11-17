import 'package:flutter/material.dart';

class rotate extends StatefulWidget {
  const rotate({super.key});

  @override
  State<rotate> createState() => _rotateState();
}

class _rotateState extends State<rotate> {
  double tuens = 0.0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Animated Rotation'),
        leading: Icon(Icons.rotate_90_degrees_ccw),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: AnimatedRotation(
                  turns: tuens,
                  duration: Duration(seconds: 2,),
              child: FlutterLogo(
                size: 100,
              ),
              ),
            ),
            SizedBox(height: 50,),
            ElevatedButton(
                onPressed: (){
                  setState(() {
                    tuens += 1/4;
                  });
                },
                child: Text("Rotate Logo",style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            style: ElevatedButton.styleFrom(
              primary: Colors.orange
            ),)
          ],
        ),
      ),
    );
  }
}
