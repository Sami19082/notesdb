import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/counter_provider.dart';

class second extends StatelessWidget {
var hel = TextEditingController();
var title = TextEditingController();
var desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Event Page"),
      ),
      body: Container(),
      floatingActionButton: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Increment & decrement'),
            SizedBox(height: 25,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(onPressed: (){
                  context.read<Counterprovider>().increment();
                  },
                  tooltip: "Increment",
                  child: Icon(Icons.add),),
                FloatingActionButton(onPressed: (){
                  context.read<Counterprovider>().decrement();
                },
                  tooltip: "Decrement",
                child: Icon(Icons.remove),),
              ],
            ),
            SizedBox(height: 25,),
         SizedBox(
          height: 150,
          width: 200,
          child: Column(
            children: [
              TextField(
                keyboardType: TextInputType.number,
                controller: hel,
                decoration: InputDecoration(
                  hintText: "getter & setter"
                ),
              ),
              SizedBox(height: 25,),
              ElevatedButton(onPressed: (){
                context.read<Counterprovider>().countvalue = int.parse(hel.text.toString());
              }, child: Icon(Icons.add)),
            ],
          ),),
            SizedBox(height: 25,),
            Text("manage of List<map>"),
            SizedBox(
              height: 150,
              width: 200,
              child: TextField(
                controller: title,
                decoration: InputDecoration(
                    hintText: "TITLE"
                ),
              ),
            ),
            SizedBox(
              height: 150,
              width: 200,
              child: TextField(
                controller: desc,
                decoration: InputDecoration(
                    hintText: "DESCRIPTION"
                ),
              ),
            ),
            ElevatedButton(onPressed: (){
                if(title.text.isNotEmpty&&desc.text.isNotEmpty){
               context.read<Counterprovider>().adddata({
              "title" : title.text.toString(),
              "desc" : desc.text.toString()
              });}
            }, child: Icon(Icons.add)),

          ],
        ),
      ),
    );
  }
}
