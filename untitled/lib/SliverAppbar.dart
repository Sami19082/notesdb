import 'package:flutter/material.dart';
import 'package:untitled/main.dart';

void main(){
  runApp(MaterialApp(home: clips()));
}
class clips extends StatefulWidget {
  @override
  State<clips> createState() => _clipsState();
}

class _clipsState extends State<clips> {
  List<Map<String,dynamic>> Popitem = [
    {'icon': Icons.settings,'Text': 'Setting'},
    {'icon': Icons.contact_mail,'Text': 'Contact'},
    {'icon': Icons.info,'Text': 'About Us'},
    {'icon': Icons.logout,'Text': 'Sign Out'},

  ];

  late String minitialvalue ;
@override
  void initState() {

    super.initState();
    minitialvalue = '';
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.cyan,
        foregroundColor: Colors.white,
        title:Text('home'),
        leading: Icon(Icons.home),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(bottom: Radius.circular(22),
          ),
          side: BorderSide(
            color: Colors.cyan.withOpacity(0.5),
                width: 2,
            strokeAlign: BorderSide.strokeAlignCenter
          )
        ),
        shadowColor: Colors.cyan,
        elevation: 10,
        flexibleSpace: Container(
          height: 100,
          color: Colors.blueAccent,
        ),
        bottom: PreferredSize(preferredSize: Size(double.infinity,100), child: Container(
          child: FlutterLogo(),
        )),
        actions: [
          IconButton(onPressed: (){}, icon: Icon(Icons.image)),
          IconButton(onPressed: (){}, icon: Icon(Icons.cut)),
          PopupMenuButton(
            initialValue: minitialvalue,
              onSelected:(value){
                minitialvalue=value.toString();
              setState(() {});
              } ,
              tooltip: 'More',
              color: Colors.blueAccent.shade100,
              elevation: 11,
              shadowColor: Colors.blueAccent,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20),
              ),
              itemBuilder: (_){
            return Popitem.map((eachData) => PopupMenuItem(
              value: eachData['Text'],
                onTap: (){
                  if(eachData['Text']== 'Setting'){
                    Navigator.push(context,MaterialPageRoute(
                        builder: (context){
                          return notes();
                        }));
                  }
                },
                child: Row(
              children: [
                  Icon(eachData['icon'],color: Colors.black,),
                  SizedBox(width: 5,),
                  Text(eachData['Text'])
              ],
               ))).toList();
          })
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 25),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.vertical(bottom:  Radius.circular(20))
              ),
              //has same feature in App bar//
              pinned: true,
              snap: true,
              floating: true,
              flexibleSpace: Container(
                color: Colors.cyan,
              ),
              expandedHeight: 100,
            ),
            SliverList(
                delegate: SliverChildBuilderDelegate(
                        (context, index) => ListTile(
                          title: Text("${index+1}"),
                        )))
          ],
        ),
      ),
    );
  }
}

//
// PopupMenuItem(child: Row(
// children: [
// Icon(Icons.settings,color: Colors.black,),
// SizedBox(
// width: 5,
// ),
// Text('Settings')
// ],
// )),
// PopupMenuItem(child: Row(
// children: [
// Icon(Icons.contact_mail,color: Colors.black,),
// SizedBox(
// width: 5,
// ),
// Text('contact')
// ],
// )),
// PopupMenuItem(child: Row(
// children: [
// Icon(Icons.logout,color: Colors.black,),
// SizedBox(
// width: 5,
// ),
// Text('log out',)
// ],
// )),