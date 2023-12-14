import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_sm/counter_provider.dart';
import 'package:provider_sm/secondpage.dart';

class HomePage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("You have pushed the button this many times"),
            Consumer<Counterprovider>(
                builder: (context,provider,child){
              return Text(
                "${provider.countvalue}"
                  // "${context.watch<Counterprovider>().getcount()}"
              );
            }),
                // "${Provider.of<Counterprovider>(context).getcount()}")
            Padding(
              padding: const EdgeInsets.only(top: 25.0),
              child: ElevatedButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return second();
                }));
              }, child: Text("Next Page")),
            ),
            SizedBox(height: 25,),
            Text("List of Data"),
            SizedBox(
              height: 250,
              child: Consumer<Counterprovider>(builder:
                  ( context, provider, child) {
                   return ListView.builder(
                     itemCount: provider.mdata.length,
                       itemBuilder: (context,index){
                       var listdata = provider.mdata;
                       return ListTile(
                         title: Text("${listdata[index]["title"]}"),
                         subtitle: Text("${listdata[index]["desc"]}"),
                       );
                       });
               },
              ),
            )
          ],
        ),
      ) ,
    );
  }
}
