import 'package:flutter/material.dart';

void main(){
runApp(MaterialApp(home: BankApp()));
}
class BankApp extends StatelessWidget {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_back),
            Text('ABOUT US',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400)
            ),
            Icon(Icons.search),
          ],),),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        color: Colors.grey.shade300,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
              child: Column(
                children: [
                  Container(
                    padding: const EdgeInsets.all(20),
                    // width: double.infinity,
                    // height: double.infinity,
                    color: Colors.white70,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [

                        Text('Home',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily:'bold'),),

                        Text('About',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily:'bold'),),

                      ],
                    ),
                  ),
                  Column(
                    children: [
                      Container(
                  padding: const EdgeInsets.all(20),
        child: const Row(
          children: [
            Text('About The Bank App',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,fontFamily:'bold'),),
          ],
        ),
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Image.asset('assets/images/img_2.png',fit: BoxFit.fill,),
        ),
      ),
      Container(
        width: double.infinity,
        padding: const EdgeInsets.all(20),
        child: Container(
          color: Colors.white70,
          child:Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recieved Money By Aron Fince',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily:'bold'),),
                SizedBox(height: 20,),
                Text('You have received a payment from Aron Fince.',style: TextStyle(fontFamily:'mainF',fontSize: 20)),
                SizedBox(height: 20,),
                Text('Banking in its modern sense evolved in the fourteenth century in the prosperous cities of Renaissance Italy but in many ways functioned as a continuation of ideas and concepts of credit and lending that had their roots in the ancient world. In the history of banking, a number of banking dynasties – notably, the Medicis, the Fuggers, the Welsers, the Berenbergs, and the Rothschilds – have played a central role over many centuries. The oldest existing retail bank is Banca Monte dei Paschi di Siena (founded in 1472), while the oldest existing merchant bank is Berenberg Bank (founded in 1590).',style: TextStyle(fontFamily:'mainF',fontSize: 15),),

              ],
            ),
          ),
        ),
      ),
       Container(
        padding: const EdgeInsets.all(20),
        child: Container(
          color: Colors.white70,
          child: Container(
            padding: const EdgeInsets.all(20),
            child: const Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Recieved Money By Aron Fince',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,fontFamily:'bold'),),
                SizedBox(height: 20,),
                Text('Depending on their business structures, U.S. banks may be regulated at the state or national level, or both. State banks are regulated by each states department of banking or department of financial institutions',style: TextStyle(fontFamily:'mainF',fontSize: 15),),
                SizedBox(height: 20,),
                Text('Retail banks offer their services to the general public and usually have branch offices as well as main offices for the convenience of their customers',style: TextStyle(fontFamily:'mainF',fontSize: 15),),
              ],
            ),
          ),

        ),
      ),


                    ],
                  )
                ],
              ),

            ),
          ),
    )

    ;}}

