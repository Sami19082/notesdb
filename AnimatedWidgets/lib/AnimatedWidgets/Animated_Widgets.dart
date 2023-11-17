import 'package:animatedwidgets/AnimatedWidgets/AnimatedBuilder.dart';
import 'package:animatedwidgets/AnimatedWidgets/Animated_Icon.dart';
import 'package:animatedwidgets/AnimatedWidgets/Animated_Opacity.dart';
import 'package:animatedwidgets/AnimatedWidgets/Animatedcrossfade.dart';
import 'package:animatedwidgets/AnimatedWidgets/Animatedgrid.dart';
import 'package:animatedwidgets/AnimatedWidgets/Animatedposition.dart';
import 'package:animatedwidgets/AnimatedWidgets/Widget_Pages.dart';
import 'package:animatedwidgets/AnimatedWidgets/rotation.dart';
import 'package:flutter/material.dart';

import 'AnimatedList.dart';
import 'AnimatedPadding.dart';
import 'Animatedcar.dart';
import 'Animatedscale.dart';
import 'Animatedtextkit.dart';
import 'DefaultTextStyle.dart';

class Animated extends StatefulWidget {


  @override
  State<Animated> createState() => _AnimatedState();
}

class _AnimatedState extends State<Animated> {
  List<Map<String,dynamic>> datas = [{'title':'Animated Container'},
    {'title':'Animated Opacity'},{'title':'Animated Icon'},{'title':'AnimatedCrossFadeAnimatedCrossFade'},
    {'title':'Animated Builder'},{'title':'Animated DefaultTextStyle'},
    {'title':'Animated Grid'},{'title':'Animated List'},{'title':'Animated Padding'},{'title':'Animated Car'},
    {'title':'Animated Positioned'},{'title':'Animated Rotation'},
    {'title':'Animated Scale'},{'title':'Animated Animated Text Kit'},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.widgets_outlined,color: Colors.black,),
        title: Text("WIDGETS",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,),),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(11)
          ),
          actions: [
            IconButton(onPressed: (){
              TextField(onTap: () => TextField(),);
            }, icon: Icon(Icons.info_outline,color: Colors.black,))
          ],
          titleSpacing: 35,
          shadowColor: Colors.grey.shade100,
          elevation: 6,
          backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          itemCount: datas.length,
            itemBuilder: (context,index){
              return Padding(
                padding: const EdgeInsets.all(10),
                child: InkWell(
                  onTap: (){
                    if(index==0){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return SecondPage();
                      }));
                    }else if(index==1){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return opacity();
                      }));
                    }else if(index==2){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Iconpage(Icons.account_box_rounded);
                      }));
                    }else if(index==3){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Cross();
                      }));
                    }else if(index==4){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Builders();
                      }));
                    }else if(index==5){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return textstyl();
                      }));
                    }else if(index==6){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return grid();
                      }));
                    }else if(index==7){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return MyAnimatedList();
                      }));
                    }else if(index==8){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Padd();
                      }));
                    }else if(index==9){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Car();
                      }));
                    }else if(index==10){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return position();
                      }));
                    }else if(index==11){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return rotate();
                      }));
                    }else if(index==12){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return scale();
                      }));
                    }else if(index==13){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return texts();
                      }));
                    }
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5),
                    width: double.infinity,
                    height: 100,
                    decoration: BoxDecoration(
                      color: Color(0xECE9F3FF),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: CircleAvatar(
                            maxRadius: 30,
                            child: Icon(Icons.widgets,size: 30,),
                          ),
                        ),
                        SizedBox(width: 20),
                        Text( datas[index]['title'],
                          style: TextStyle(fontSize: 20,fontWeight: FontWeight.w200),),
                      ],
                    ),
                  ),
                ),
              );
            }),
      ) ,
    );
  }
}
