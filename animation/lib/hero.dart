import 'package:animation/2ndpage.dart';
import 'package:flutter/material.dart';

void main(){
runApp(MaterialApp(home: heros()));
}
class heros extends StatelessWidget{
  @override
 Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Hero Animation'),
      ),
      body: Center(
        child: GridView.builder(
          itemCount: Colors.primaries.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              childAspectRatio: 3/2,
                crossAxisSpacing: 5,
              mainAxisSpacing: 5,
            ),
            itemBuilder: (_,index){
              return InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (ctx){
                    return second(tag: "$index");
                  }));
                },
                child: Hero(
                  tag:  "$index",
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.primaries[index]
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }
  }
