import 'package:flutter/material.dart';
import 'package:news_app/screens/detailpage.dart';

class HeadLines extends StatefulWidget {
  const HeadLines({super.key});

  @override
  State<HeadLines> createState() => _HeadLinesState();
}

class _HeadLinesState extends State<HeadLines> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
          itemCount: 100,
          itemBuilder: (context,index){
            return InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return DetailPage();
                }));
              },
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                  height: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    color: Colors.black26,
                  ),

                ),
              ),
            );
          }),
    );
  }
}
