import 'package:flutter/material.dart';

void main (){
runApp(MaterialApp(home: myhome()));
}
 class myhome extends StatefulWidget{
  @override
   State<StatefulWidget> createState() {
    return myhomestate();
  }

 }
 class myhomestate extends State<myhome>{
  @override
   Widget build (BuildContext context){
    var cal= TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('TIP CALCULATOR'),
      ),
      backgroundColor: Color(0xFAEAEAFF),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.money,size: 100,),
                Text('Mr Tip',style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
              ],
            ),
            Text('Calculator',style: TextStyle(fontSize: 25,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
            Container(
              width: 400,
              height: 200,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.grey),
                color: Colors.white70,
              ),
              child: Padding(
                padding: const EdgeInsets.all(30),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Text('Total p/Person',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                    Text('Rs.   ',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          children: [
                            Text('Total bill'),
                            Text ('Rs.1800.0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blueAccent),)
                          ],
                        ),
                        Column(
                          children: [
                            Text('Total Tip'),
                            Text ('Rs.600.0',style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold,color: Colors.blueAccent),)
                          ],
                        )
                      ],

                    )
                  ],
                ),
              ),
            ),
              SizedBox(height: 20,),
             Row(
               crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Enter Bill',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                Icon(Icons.currency_rupee,size: 30,),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextField(
                    decoration: InputDecoration(
                      labelText: 'Rs.'
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Choose Tip',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                ElevatedButton(
                    onPressed:(){}, child:
                      Text('10%',style: TextStyle(fontSize: 20,),)),
                ElevatedButton(
                    onPressed:(){}, child: Text('15%',style: TextStyle(fontSize: 20),)),
                ElevatedButton(
                    onPressed:(){}, child: Text('20%',style: TextStyle(fontSize: 20),))
              ],
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed:(){}, child: Text('Calculate',style: TextStyle(fontSize: 20),)),
            SizedBox(height: 20,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text('Split',style: TextStyle(fontSize: 20,fontStyle: FontStyle.italic,fontWeight: FontWeight.bold),),
                ElevatedButton(
                    onPressed:(){}, child:
                Text('+',style: TextStyle(fontSize: 25,),)),
                Container(
                  height: 50,
                  width: 120,
                  color: Colors.white,
                ),
                ElevatedButton(
                    onPressed:(){}, child: Text('-',style: TextStyle(fontSize: 28),)),
              ],
            )
          ],
        ),
      ),
    );
  }
 }