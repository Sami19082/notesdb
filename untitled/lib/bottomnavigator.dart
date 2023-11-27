import 'package:flutter/material.dart';
import 'package:untitled/Tabbar.dart';
import 'package:untitled/SliverAppbar.dart';

void main(){
runApp(MaterialApp(home: bottom()));
}
class bottom extends StatefulWidget {

  @override
  State<bottom> createState() => _bottomState();
}

class _bottomState extends State<bottom> {
  List<Map<String,dynamic>> draw = [
    {"icon": Icons.add,'Text': 'Home'},
    {"icon": Icons.h_mobiledata,'Text': 'Home'},
    {"icon": Icons.hail,'Text': 'Home'},
    {"icon": Icons.cabin_outlined,'Text': 'Home'},
    {"icon": Icons.join_full,'Text': 'Home'},
  ];

  List<Widget> Navpage = [
    tabbar(),
    clips(),
  ];
  int mselected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Navigation'),
      ),
      body: Navpage[mselected],
      bottomNavigationBar: NavigationBar(
        backgroundColor: Colors.brown,
        indicatorColor: Colors.cyan,
        labelBehavior: NavigationDestinationLabelBehavior.onlyShowSelected,
        selectedIndex: mselected,
        onDestinationSelected: (index){
          mselected = index;
          setState(() {

          });

        },
        destinations: [
          NavigationDestination(
              icon: Icon(Icons.home),
              label: 'Home'),
          NavigationDestination(
              icon: Icon(Icons.settings),
              label: 'Settings')
        ],
      ),
      drawer: Container(
        width: 250,
        color: Colors.white,
        child: ListView.builder(
          itemCount: draw.length,
            itemBuilder: (_,index){
              return  ListTile(
                leading:  Icon(draw[index]['Icon'],color: Colors.black,),
                title: Text(draw[index]['Text']),
              );
            })
        ),

    );
  }
}
