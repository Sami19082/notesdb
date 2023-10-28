import 'package:flutter/material.dart';
import 'info.dart';
class second extends StatelessWidget {

  List<Map<String, dynamic>> datalist=[
    {'title': 'ABS WORKOUT','img': 'Asset/image/img_1.png','sub': '20 MINS.6 EXCERCISES'},
    {'title': 'CHEST WORKOUT','img': 'Asset/image/img.png','sub': '20 MINS.6 EXCERCISES'},
    {'title': 'ARM WORKOUT','img': 'Asset/image/img_1.png','sub': '20 MINS.6 EXCERCISES'},
    {'title': 'LEGS WORKOUT','img': 'Asset/image/img.png','sub': '20 MINS.6 EXCERCISES'},
    {'title': 'BACK WORKOUT','img': 'Asset/image/img_1.png','sub': '20 MINS.6 EXCERCISES'},
  ];


  String name;
  second({required this.name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.purple.shade400,
        title:  Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.line_weight),
            Center(child: Text('Welcome, $name')),
          ],
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
          itemBuilder: (context,index){
            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: InkWell(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return info(index: index,);
                  }));
                },
                child: Stack(
                  children: [
                    Container(
                      width: double.infinity,
                      height: 300,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Color(0xfDEEADCFF),
                          image: DecorationImage(
                              image: AssetImage(datalist[index]['img']),
                              fit: BoxFit.cover
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return info(index: index,);
                                      }));
                                    },
                                    icon: Icon(Icons.info))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 100),
                      child: Column(
                        children: [
                          Center(
                            child: Text(datalist[index]['title'],style: TextStyle(color: Colors.red,fontWeight: FontWeight.bold,fontSize: 50),),
                          ),
                          Text(datalist[index]['sub'],style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold,color: Colors.green),),
                        ],
                      ),
                    )

                  ],

                ),
              ),
            );
          })
    );
  }
}
