import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: homepage()));
}

class homepage extends StatelessWidget {
  List<Map<String, dynamic>> listdat = [
    {'name': 'Mitika', 'subtitle': 'typing...', 'color': Colors.blue,'img':'assets/icons/img.png','time':'12:09 pm','count':'5'},
    {'name': 'raj', 'subtitle': 'bhai maal leke aa', 'color': Colors.orange,'img':'assets/icons/gamer.png','time':'08:09 pm','count':'4'},
    {'name': 'sami', 'subtitle': 'Hello', 'color': Colors.blue,'img':'assets/icons/man.png','time':'07:09 am','count':'2'},
    {'name': 'haley', 'subtitle': 'bro do workout', 'color': Colors.red,'img':'assets/icons/man.png','time':'12:19 am','count':'9'},
    {'name': 'kausar', 'subtitle': 'be kaha hain', 'color': Colors.green,'img':'assets/icons/gamer.png','time':'08:15 pm','count':0},
    {'name': 'neeraj', 'subtitle': 'chup bc', 'color': Colors.yellow,'img':'assets/icons/man.png','time':'06:09 pm','count':'8'},
    {
      'name': 'subham',
      'subtitle': 'dada bhalo to',
      'color': Colors.amberAccent,
      'img':'assets/icons/gamer.png'
      ,'time':'05:09 pm','count':0
    },
    {
      'name': 'anumpum',
      'subtitle': 'jai hind',
      'color': const Color.fromARGB(255, 131, 33, 243),
      'img':'assets/icons/man.png','time':'03:29 pm','count':8
    },
    {'name': 'raja', 'subtitle': 'typing...', 'color': Colors.pink,'img':'assets/icons/gamer.png','time':'04:39 am','count':9},
    {'name': 'rajeev', 'subtitle': 'Hello bro', 'color': Colors.purpleAccent,'img':'assets/icons/man.png','time':'02:09 pm','count':3},
    {'name': 'suraj', 'subtitle': 'bro ', 'color': Colors.red,'img':'assets/icons/gamer.png','time':'08:09 am','count':7},
    {'name': 'raju', 'subtitle': 'call kr', 'color': Colors.yellow,'img':'assets/icons/man.png','time':'06:09 am','count':1},
    {'name': 'dheraj', 'subtitle': 'kaha hain', 'color': Colors.grey,'img':'assets/icons/gamer.png','time':'09:09 am','count':3},
    {'name': 'druv', 'subtitle': 'aa jldi', 'color': Colors.deepOrange,'img':'assets/icons/man.png','time':'12:09 am','count':6},
    {'name': 'lallu', 'subtitle': 'yoyo', 'color': Colors.teal,'img':'assets/icons/gamer.png','time':'03:09 am','count':8},
    {'name': 'mamu', 'subtitle': 'raja kaha hain', 'color': Colors.deepPurpleAccent,'img':'assets/icons/man.png','time':'01:09 am','count':2},
    {'name': 'sourav', 'subtitle': 'sagar ka number bhej', 'color': Colors.lightBlueAccent,'img':'assets/icons/gamer.png','time':'02:09 am','count':7},
    {'name': 'nehal', 'subtitle': 'kal kab tak ayega', 'color': Colors.indigo,'img':'assets/icons/man.png','time':'03:09 am','count':3},
    {'name': 'error', 'subtitle': 'chalega mere saath', 'color': Colors.pinkAccent,'img':'assets/icons/gamer.png','time':'09:09 am','count':2},
  ];
//CHAT PAGE///
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            flex: 2,
            child: Container(
              padding: const EdgeInsets.all(15),
              color: Colors.green.shade300,
              child: const Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Expanded(
                        flex: 4,
                        child: Row(

                          children: [
                            Text('Whatsapp', style: TextStyle(fontSize: 20,fontFamily: 'bold'),),
                          ],
                        ),
                      ),
                      Expanded(
                        flex: 1,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Icon(Icons.camera_alt_outlined),
                            Icon(Icons.search),
                            Icon(Icons.more_horiz),
                          ],
                        ),
                      )
                    ],

                  ),
                  SizedBox(height: 30,),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:[
                      Icon(Icons.group),
                      Text('Chats',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      Text('Status',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                      Text('Calls',style: TextStyle(fontSize: 20,fontWeight: FontWeight.w400),),
                    ],

                  ),




                ],
              ),
            ),
          ),
          Expanded(
            flex: 12,
            child: ListView.builder(
                itemCount: listdat.length,
                itemBuilder: (context,index){
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundColor: listdat[index]['color'],
                      maxRadius: 26,
                      backgroundImage: AssetImage(
                          listdat[index]['img']
                      ),
                    ),
                    title: Text('${listdat[index]['name']}'),
                    subtitle: listdat[index]['subtitle']=='typing...'? Text('${listdat[index]['subtitle']}',style: TextStyle(color: Colors.green),):Text('${listdat[index]['subtitle']}'),
                    trailing: Column(
                      children: [
                        Text('${listdat[index]['time']}'),
                        listdat[index]['count']==0 ? Container(width: 0,):
                        Container(
                          width: 20,
                          height: 20,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.green,
                          ),
                          child: Center(child: Text('${listdat[index]['count']}',style: TextStyle(fontSize: 10,fontWeight: FontWeight.normal,color: Colors.white),)),
                        ),

                      ],
                    ),
                  );



                }),
          )




        ],
      ),



    );





  }
}





