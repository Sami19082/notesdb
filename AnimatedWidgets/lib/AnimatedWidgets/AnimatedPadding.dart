import 'package:flutter/material.dart';

class Padd extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Padd> {
  EdgeInsetsGeometry _padding = EdgeInsets.all(16.0);

  void _changePadding() {
    setState(() {
      _padding = _padding == EdgeInsets.all(16.0)
          ? EdgeInsets.all(32.0)
          : EdgeInsets.all(16.0);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AnimatedPadding Example'),
      ),
      backgroundColor: Colors.yellow,
      body: Center(
        child: AnimatedPadding(
          padding: _padding,
          duration: Duration(seconds: 1),
          curve: Curves.easeInOut,
          child: Container(
            color: Colors.blue,
            width: 200,
            height: 200,
            child: Center(
              child: Text(
                'Hello Flutter!',
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _changePadding,
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
