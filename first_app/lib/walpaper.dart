

import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: mygrid(),));
}
class mygrid extends StatelessWidget{
  var text = TextEditingController();
  List<Map<String, dynamic>> pics = [{'imgs': 'assets/nature/2021-rolls-royce-black-badge-ghost-10k-ne.jpg', 'color': Colors.pinkAccent,'sub':'CARS'},{'imgs': 'assets/nature/andrzej-suwara-j4glkaOX-ds-unsplash.jpg', 'color': Colors.blue,'sub':'NATURE'},{'imgs': 'assets/nature/dan-rogers-CbWtrk58OEk-unsplash.jpg', 'color': Colors.greenAccent,'sub':'NATURE'},{'imgs': 'assets/nature/dan-rogers-lMIvz5b1vRo-unsplash.jpg', 'color': Colors.purpleAccent.shade200,'sub':'NATURE'},{'imgs': 'assets/nature/jorge-fernandez-wH3YxJwMC5o-unsplash.jpg', 'color': Colors.orange.shade900,'sub':'NATURE'}
    ,{'imgs': 'assets/nature/andrzej-suwara-j4glkaOX-ds-unsplash.jpg', 'color': Colors.purple,'sub':'NATURE'},{'imgs': 'assets/nature/laia-nunez-AThSwV0LsCQ-unsplash.jpg', 'color': Colors.redAccent,'sub':'NATURE'},{'imgs': 'assets/nature/mg-cthu--1h_NN3nqzI-unsplash.jpg', 'color': Colors.orange,'sub':'NATURE'},{'imgs': 'assets/nature/michael-d-rnKqWvO80Y4-unsplash.jpg', 'color': Colors.yellowAccent,'sub':'NATURE'},{'imgs': 'assets/nature/nicolette-meade-RL3F99l0XYE-unsplash.jpg', 'color': Colors.white,'sub':'NATURE'},{'imgs': 'assets/nature/oliver-sjostrom-epRVcpr6yf8-unsplash.jpg', 'color': Colors.deepOrange,'sub':'NATURE'},{'imgs': 'assets/nature/roberto-h-qToVxSYXPYU-unsplash.jpg', 'color': Colors.lime,'sub':'NATURE'},{'imgs': 'assets/nature/wolfgang-hasselmann-pVr6wvUneMk-unsplash.jpg', 'color': Colors.brown,'sub':'NATURE'},

  ];
  @override
  Widget build (BuildContext Context){
    return Scaffold(
      appBar: AppBar(
        title: Text('WALLPAPER'),
      ),
      backgroundColor: Colors.lightBlue.shade50,
      body: SingleChildScrollView(
        child: SizedBox(
          height: 1000,
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10)
                  ),
                  child: TextField(
                    controller: text ,
                    decoration: InputDecoration(
                        suffixIcon: Icon(Icons.search),
                        suffixIconColor: Colors.grey,
                        hintText: 'Find Wallpaper',
                        hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(
                            color: Colors.white54,
                            width: 2,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide(color: Colors.blue.shade100,
                              width: 2),
                        )
                    ),
                  ),
                ),
                SizedBox(height: 30,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Best Of The Month',style:TextStyle(fontStyle: FontStyle.normal,color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(height: 25,),
                SizedBox(
                  height: 200,
                  width: double.infinity,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: pics.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(5.0),
                        child: Container(
                          width: 100,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(pics[index]['imgs']),
                                  fit: BoxFit.fitHeight
                              ),
                              border: Border.all(color: Colors.black54),
                              borderRadius: BorderRadius.circular(12)),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 25,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('The Color Tones',style:TextStyle(fontStyle: FontStyle.normal,color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                SizedBox(
                  height: 100,
                  width: double.infinity,
                  child: ListView.builder(
                      itemCount: pics.length,
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context,index){
                        return Container(
                          margin: EdgeInsets.all(5),
                          height: 100,
                          width: 100,
                          decoration: BoxDecoration(
                            color: pics[index]['color'],
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(color: Colors.black54),
                          ),
                        );

                      }),
                ),
                SizedBox(height: 25,),
                Row(
                  children: [
                    Text('Categories',style:TextStyle(fontStyle: FontStyle.normal,color: Colors.black,fontSize: 25,fontWeight: FontWeight.bold),),
                  ],
                ),
                Expanded(
                  child: GridView.builder(
                      itemCount: pics.length,

                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          mainAxisSpacing: 10,
                          crossAxisCount:2,
                          crossAxisSpacing: 10

                      ),
                      itemBuilder: (_,index) {
                        return Padding(
                          padding: EdgeInsets.all(5),
                          child: Stack(
                            children: [
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(12),
                                  border: Border.all(color: Colors.black),
                                  image: DecorationImage(
                                      image: AssetImage(pics[index]['imgs']),
                                      fit: BoxFit.fill
                                  ),

                                ),
                              ),
                              Container(
                                color: Color(0x4cffffff),
                              )

                            ],

                          ),

                        );
                      }
                  ),
                )





              ],
            ),
          ),
        ),
      ),
    );
  }
}
