import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: Homepage()));
}
class Homepage extends StatelessWidget{
  @override
  Widget build (BuildContext context ){
    return Scaffold(
      appBar: AppBar(
          title: const Text('KHANA KHAZANA')),
      body: Container(
          height: 500,
          width: double.infinity,
          child:Row(
            children: [
              Expanded(
                flex: 3,
                child: Container(
                  color: Colors.cyanAccent,
                  padding: const EdgeInsets.all(10),
                  child: Column(
                    children: [
                      Container(
                          width:double.infinity,
                          decoration: BoxDecoration(
                              color: const Color(0xffe6f1fa),
                              border: Border.all()

                          ) ,
                          child: const Center(child:Text('STRAWBERRY CAKE', style:TextStyle(fontSize: 23,fontWeight: FontWeight.bold),),)
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 11),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xffe6f1fa),
                            border: Border.all()
                        ),
                        child: const Text('Palva is a meringue-based dessert named after the Russian ballerine Anna Pavlova.Pavlova features a crisp crust and soft, light inside,topped with fruit and whipped cream',style:TextStyle(fontSize: 20, fontWeight: FontWeight.normal),textAlign: TextAlign.center,),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 11),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xffe6f1fa),
                            border: Border.all()
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Row(
                              children: [
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                                Icon(Icons.star),
                              ],
                            ),
                            Text('170 reviews')
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 11),
                        width: double.infinity,
                        decoration: BoxDecoration(
                            color: const Color(0xffe6f1fa),
                            border: Border.all()
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                SizedBox(height: 11),
                                Icon(Icons.book,size: 30,),
                                SizedBox(
                                  height: 11,
                                ),
                                Text('PREP:',style: TextStyle(fontSize: 15)),
                                SizedBox(
                                  height: 11,
                                ),
                                Text('25 min'),
                                SizedBox(
                                  height: 11,
                                )
                              ],

                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 11,
                                ),
                                Icon(Icons.lock_clock,size: 30,),
                                SizedBox(
                                  height: 11,
                                ),
                                Text('COOK:'),
                                SizedBox(
                                  height: 11,
                                ),
                                Text('1hr'),
                                SizedBox(
                                  height: 11,
                                )
                              ],
                            ),
                            Column(
                              children: [
                                SizedBox(
                                  height: 11,
                                ),
                                Icon(Icons.food_bank),
                                SizedBox(
                                  height: 11,
                                ),
                                Text('FEEDS:'),
                                SizedBox(
                                  height: 11,
                                ),
                                Text('4-6'),
                                SizedBox(
                                  height: 11,
                                )
                              ],
                            )
                          ],
                        ),
                      )

                    ],
                  ),
                ),),
              Expanded(
                  flex: 7,
                  child:Image.asset('assets/images/img.png',fit:BoxFit.fill,)
              )],

          )


      ),);


  }
}