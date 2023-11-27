import 'package:ecommerce/Home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class orders extends StatefulWidget {
  const orders({super.key});

  @override
  State<orders> createState() => _ordersState();
}

class _ordersState extends State<orders> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Spacer(),
          Center(
            child: Lottie.asset('Assets/Lottie/cKXutSB7U8.json'),
          ),
          Spacer(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
                style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.deepOrangeAccent),elevation: MaterialStatePropertyAll(5),
                foregroundColor: MaterialStatePropertyAll(Colors.black),),
                onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                return Homepage();
              }));
            }, child: Text('Continue Shopping')),
          )
        ],
      )
    );
  }
}
