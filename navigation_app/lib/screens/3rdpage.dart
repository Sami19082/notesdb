import 'package:flutter/material.dart';

import 'lastpage.dart';

class page extends StatefulWidget {

  int mIndex;
  page({required this.mIndex});
  @override
  State<page> createState() => _pageState();
}

class _pageState extends State<page> {



  List<Map<String,dynamic>> abs=[
    {'text': 'Jumping jack','time':'00:20', 'appbar':'Abs workout'},
    {'text': 'Abdominal Crunches','time':'x16', 'appbar':'Abs workout'},
    {'text': 'Russian Twist','time':'x20', 'appbar':'Abs workout'},
    {'text': 'Mountain Climber','time':'x16', 'appbar':'Abs workout'},
    {'text': 'Leg Raises','time':'x16', 'appbar':'Abs workout'},
  ];
  List<Map<String,dynamic>> chest=[
    {'text': 'Incline Pushups','time':'00:20'},
    {'text': 'knee push up','time':'x16'},
    {'text': 'wide push up','time':'x12'},
    {'text': 'hindu pushup','time':'x6'},
    {'text': 'cobra stretch','time':'x16'},
  ];
  List<Map<String,dynamic>> arm=[
    {'text': 'Arms Raises','time':'00:20'},
    {'text': 'Side arm Raises','time':'x16'},
    {'text': 'Triceps Dips','time':'x20'},
    {'text': 'Diamond PushUps','time':'x8'},
    {'text': 'Punches','time':'x8'},
  ];
  List<Map<String,dynamic>> legs=[
    {'text': 'Side Hop','time':'00:20'},
    {'text': 'Squats','time':'x16'},
    {'text': 'Backward Lunge','time':'x20'},
    {'text': 'Donkey kick','time':'x8'},
    {'text': 'Knee to chest','time':'x8'},
  ];
  List<Map<String,dynamic>> Shoulder=[
    {'text': 'Arms Raises','time':'00:20'},
    {'text': 'Knee Push Up','time':'x16'},
    {'text': 'Cat Cow pose','time':'x20'},
    {'text': 'Childs Pose','time':'x8'},
    {'text': 'Side Arms Raise','time':'x8'},
  ];
  List< List<Map<String,dynamic>>> alllist = [];

  @override
  void initState() {
    super.initState();
  alllist.add(abs);
  alllist.add(chest);
  alllist.add(arm);
  alllist.add(legs);
  alllist.add(Shoulder);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(

        slivers: [
          SliverAppBar(
            bottom: AppBar(
              title: Text('Lets start',style: TextStyle(fontSize: 25,color: Colors.black,fontWeight: FontWeight.bold),),
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
            childCount:  alllist[widget.mIndex].length,
                  (context, index){
             var eachdata=alllist[widget.mIndex][index];
              return Padding(
                padding: const EdgeInsets.all(1),
                child: InkWell(
                  onTap: (){
                    Navigator.push(context,
                        MaterialPageRoute(
                            builder: (context){
                              return lastpage(nindex:index);
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
                        Text(eachdata['text'],style: TextStyle(fontSize: 20,color: Colors.black,fontWeight: FontWeight.bold),),
                      Text(eachdata['time'],style: TextStyle(fontSize: 15,color: Colors.black,fontWeight: FontWeight.w400),),

                      ],
                    ),
                  ),

                  ],
                ),
              ),
                    ),
                    );
                  })),
        ],
      ),
    );
  }
}
