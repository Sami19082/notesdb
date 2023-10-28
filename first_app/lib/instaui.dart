import 'package:flutter/material.dart';
void main(){
  runApp(MaterialApp(home: myui()));
}
class myui extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return mystate();
  }
}
class mystate extends State<myui>{
  List<Map<String, dynamic>> listdat = [
    {'name': 'Mitika', 'subtitle': 'typing...', 'color': Colors.blue,'img':'assets/image/img_1.png','time':'12:09 pm','count':5},
    {'name': 'raj', 'subtitle': 'bhai maal leke aa', 'color': Colors.orange,'img':'assets/image/img_2.png','time':'08:09 pm','count':4},
    {'name': 'sami', 'subtitle': 'Hello', 'color': Colors.blue,'img':'assets/image/img_3.png','time':'07:09 am','count':2},
    {'name': 'haley', 'subtitle': 'bro do workout', 'color': Colors.red,'img':'assets/image/img_4.png','time':'12:19 am','count':9},
    {'name': 'kausar', 'subtitle': 'be kaha hain', 'color': Colors.green,'img':'assets/image/img_4.png','time':'08:15 pm','count':0},
    {'name': 'neeraj', 'subtitle': 'chup bc', 'color': Colors.yellow,'img':'assets/image/img_4.png','time':'06:09 pm','count':8},
    {
      'name': 'subham',
      'subtitle': 'dada bhalo to',
      'color': Colors.amberAccent,
      'img':'assets/image/img_4.png'
      ,'time':'05:09 pm','count':0
    },
    {
      'name': 'anumpum',
      'subtitle': 'jai hind',
      'color': const Color.fromARGB(255, 131, 33, 243),
      'img':'assets/image/img_4.png','time':'03:29 pm','count':8
    },
    {'name': 'raja', 'subtitle': 'typing...', 'color': Colors.pink,'img':'assets/image/img_4.png','time':'04:39 am','count':9},
    {'name': 'rajeev', 'subtitle': 'Hello bro', 'color': Colors.purpleAccent,'img':'assets/image/img_4.png','time':'02:09 pm','count':3},
    {'name': 'suraj', 'subtitle': 'bro ', 'color': Colors.red,'img':'assets/image/img_4.png','time':'08:09 am','count':7},
    {'name': 'raju', 'subtitle': 'call kr', 'color': Colors.yellow,'img':'assets/image/img_4.png','time':'06:09 am','count':1},
    {'name': 'dheraj', 'subtitle': 'kaha hain', 'color': Colors.grey,'img':'assets/image/img_4.png','time':'09:09 am','count':3},
    {'name': 'druv', 'subtitle': 'aa jldi', 'color': Colors.deepOrange,'img':'assets/image/img_4.png','time':'12:09 am','count':6},
    {'name': 'lallu', 'subtitle': 'yoyo', 'color': Colors.teal,'img':'assets/image/img_4.png','time':'03:09 am','count':8},
    {'name': 'mamu', 'subtitle': 'raja kaha hain', 'color': Colors.deepPurpleAccent,'img':'assets/image/img_4.png','time':'01:09 am','count':2},
    {'name': 'sourav', 'subtitle': 'sagar ka number bhej', 'color': Colors.lightBlueAccent,'img':'assets/image/img_4.png','time':'02:09 am','count':7},
    {'name': 'nehal', 'subtitle': 'kal kab tak ayega', 'color': Colors.indigo,'img':'assets/image/img_4.png','time':'03:09 am','count':3},
    {'name': 'error', 'subtitle': 'chalega mere saath', 'color': Colors.pinkAccent,'img':'assets/image/img_4.png','time':'09:09 am','count':2},
  ];
  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Instagram',style: TextStyle(fontWeight: FontWeight.bold ),),
              Icon(Icons.search),
            ],
          ),
        ),

      ) ,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: SizedBox(
                  height: 100,
                  child: Column(
                    children: [
                      SizedBox (
                        height: 100,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(50),
                                        border: Border.all(color: Colors.black)
                                    ),

                                    child: CircleAvatar(
                                        backgroundColor:Colors.white70,
                                        maxRadius: 30,


                                        child: Icon(Icons.add)
                                    ),
                                  ),
                                  Text('Add story'),
                                ],
                              ),
                            ),
                            SizedBox(width: 10,),

                            ListView.builder(
                              itemCount: listdat.length,
                              shrinkWrap: true,
                              physics: NeverScrollableScrollPhysics(),
                              scrollDirection:Axis.horizontal,
                              itemBuilder: (context,index){
                                return SizedBox(
                                  width: 100,
                                  height: 100,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        CircleAvatar(
                                          backgroundColor: Colors.cyan,
                                          maxRadius: 30,
                                          backgroundImage: AssetImage( listdat[index]['img']),
                                        ),
                                        Text(listdat[index]['name']),
                                      ],
                                    ),
                                  ),
                                );
                              },

                            ),
                          ],
                        ),
                      ),

                    ],
                  ),
                ),
              ),
              // SizedBox(width: 10,),
              SizedBox(
                height: 50,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Chats',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
                      Icon(Icons.more_horiz,size: 25,),
                    ],
                  ),
                ),
              ),
              // SizedBox(width: 10,),

              ListView.builder(
                  scrollDirection: Axis.vertical,
                  physics: NeverScrollableScrollPhysics(),
                  itemCount: listdat.length,
                  shrinkWrap: true,
                  itemBuilder: (_,index) {
                    return ListTile(
                        leading: CircleAvatar(
                          backgroundColor: listdat[index]['color'],
                          maxRadius: 30,
                          backgroundImage:  AssetImage( listdat[index]['img']),

                        ),
                        title: Text(listdat[index]['name'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                        subtitle: listdat[index]['count']==0 ?
                        Text(listdat[index]['subtitle'],style: TextStyle(fontWeight: FontWeight.normal),):
                        Text(listdat[index]['subtitle'],style: TextStyle(fontWeight: FontWeight.bold),),

                        trailing: Column(
                          children: [
                            Text(listdat[index]['time']),
                            SizedBox(height: 5,),
                            listdat[index]['count']==0 ?
                            Container(width: 0,):
                            Container(
                              width: 25,
                              height: 25,
                              decoration: BoxDecoration(
                                  color: Colors.orange.shade200,
                                  shape: BoxShape.circle
                              ),child: Center(child: Text(listdat[index]['count'].toString(),style: TextStyle(fontSize: 15),)),
                            )

                          ],
                        )



                    );
                  }

              ),


            ],
          ),
        ),
      ),
    );
  }
}
