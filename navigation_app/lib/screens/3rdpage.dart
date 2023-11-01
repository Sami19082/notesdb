import 'package:flutter/material.dart';

import 'lastpage.dart';

class page extends StatefulWidget {

  int index;
  page({required this.index});
  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {

  List<Map<String,dynamic>> pagelist=[
    {'text': 'Jumping jack','time':'00:20'},
    {'text': 'Abdominal Crunches','time':'x16'},
    {'text': 'Russian Twist','time':'x20'},
    {'text': 'Mountain Climber','time':'x16'},
    {'text': 'Leg Raises','time':'x16'},
  ];
  List<Map<String,dynamic>> abs=[
    {'text': 'acv','time':'00:20'},
    {'text': 'gfh','time':'x16'},
    {'text': 'rdg','time':'x20'},
    {'text': 'jk','time':'x16'},
    {'text': 'th','time':'x16'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            bottom: AppBar(
              title: Text('Abs Workouts',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
            ),
            pinned: true,
            snap: false,
            floating: true,
            flexibleSpace: FlexibleSpaceBar(
              background: Image.asset('Asset/image/img_8.png',fit: BoxFit.fill,),
            ),
           elevation: 10,
            expandedHeight: 200,
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            childCount: pagelist.length,
                  (context, index) => Padding(
                   padding: const EdgeInsets.all(1),
                    child: InkWell(
                      onTap: (){
                        Navigator.push(context,
                            MaterialPageRoute(
                                builder: (context){
                                  return lastpage(index: index);
                                }));
                      },
                      child: Container(
                      height: 200,
                      color: Colors.pinkAccent.shade100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: 700,
                                width: 100,
                                child: Icon(Icons.line_weight_sharp)),
                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(pagelist[index]['text'],style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  Text(abs[index]['text'],style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                                  Text(pagelist[index]['time'],style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w400),),
                                  Text(abs[index]['time'],style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w400),),

                                ],
                              ),
                            ),

                          ],
                        ),
                                  ),
                    ),
          ))),
        ],
      ),
    );
  }
}
