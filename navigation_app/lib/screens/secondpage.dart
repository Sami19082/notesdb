import 'package:flutter/material.dart';
import 'package:navigation_app/screens/3rdpage.dart';
import 'info.dart';
class second extends StatelessWidget {

  List<Map<String, dynamic>> datalist=[
    {'img': 'Asset/image/img_2.png'},
    {'img': 'Asset/image/img_3.png'},
    {'img': 'Asset/image/img_4.png'},
    {'img': 'Asset/image/img_5.png'},
    {'img': 'Asset/image/img_6.png'},
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
                    return page(index: index,);
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
                              fit: BoxFit.fill
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                IconButton(
                                    onPressed: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context){
                                        return info(index: index,);
                                      }));
                                    },
                                    icon: Icon(Icons.info,color: Colors.white,))
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),

                  ],

                ),
              ),
            );
          })
    );
  }
}
