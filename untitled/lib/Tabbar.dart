import 'package:flutter/material.dart';
import 'package:untitled/SliverAppbar.dart';

void main(){
  runApp(MaterialApp(home: tabbar()));
}

class tabbar extends StatefulWidget {


  @override
  State<tabbar> createState() => _tabbarState();
}

class _tabbarState extends State<tabbar> with SingleTickerProviderStateMixin{
  late TabController mtabcontrol;
  String mtitle = 'Chats';
  @override
  void initState() {
    super.initState();
    mtabcontrol = TabController(length: 8, vsync: this );
    mtabcontrol.addListener(() {
      print(mtabcontrol.index);
      if (mtabcontrol.index==0){
        mtitle = 'Chats';
      }else if(mtabcontrol.index==1){
        mtitle = 'Status';
      } else if(mtabcontrol.index==2){
        mtitle = 'Calls';
      } else if(mtabcontrol.index==3){
        mtitle = 'video';
      }else if(mtabcontrol.index==4){
        mtitle = 'Add';
      }else if(mtabcontrol.index==5){
        mtitle = 'Calls';
      }else if(mtabcontrol.index==6){
        mtitle = 'Chats';
      }else if(mtabcontrol.index==7){
        mtitle = 'Calls';
      }
      setState(() {

      });
    });
  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(mtitle),
        bottom: TabBar(
          controller: mtabcontrol,
          isScrollable: true,
            tabs: [
              Tab(
                icon: Icon(Icons.chat),
                text: 'Chats',
              ),
              Tab(
                icon:  Icon(Icons.call),
                text: 'Calls',
              ),
              Tab(
                icon: Icon(
                  Icons.slow_motion_video,
                ),
                text: 'video',
              ),
              Tab(
                icon: Icon(
                  Icons.add,
                ),
                text: 'Add',
              ),
              Tab(
                icon: Icon(Icons.chat),
                text: 'Chats',
              ),
              Tab(
                icon:  Icon(Icons.call),
                text: 'Calls',
              ),
              Tab(
                icon: Icon(
                  Icons.slow_motion_video,
                ),
                text: 'video',
              ),
              Tab(
                icon: Icon(
                  Icons.add,
                ),
                text: 'Add',
              )
            ]),
      ),
      body: TabBarView(
        controller: mtabcontrol,
        children: [
          clips(),
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.grey,
          ),
          Container(
            color: Colors.green,
          ),
          Container(
            color: Colors.lightBlueAccent,
          ),
          Container(
            color: Colors.brown,
          ),
          Container(
            color: Colors.cyan,
          ),
          Container(
            color: Colors.red,
          ),
        ],
      ),
    );
  }
}
