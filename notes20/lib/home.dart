import 'package:flutter/material.dart';
import 'package:notes20/db.dart';
import 'package:notes20/detailpage.dart';
import 'package:notes20/modelclass.dart';

class Notes20 extends StatefulWidget {
  const Notes20({super.key});

  @override
  State<Notes20> createState() => _Notes20State();
}

class _Notes20State extends State<Notes20> {
late AppDataBase appdb;
  TextEditingController mtitle =  TextEditingController();
  TextEditingController mdes = TextEditingController();

  List<NoteModel> datas = [];

  @override
  void initState() {
    super.initState();
    appdb = AppDataBase.instance;
    getnotes();
  }

  void getnotes()async{
    datas = await appdb.fetchdata();
    setState(() {

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("One Notes"),
      ),
      body: datas.isNotEmpty ? Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
            itemCount: datas.length,gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          crossAxisSpacing: 5,
          mainAxisSpacing: 5,

        ),
            itemBuilder: (context,index){
              var currdata = datas[index];
          return InkWell(onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context){
              return detailpage(title: currdata.note_title,desc: currdata.note_desc,note_id: currdata.note_id,text1: mtitle,text2: mdes,);
            }));

          },
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(18),
                color: Colors.primaries[index]
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Align(
                    alignment: Alignment.center,
                      child: Text(currdata.note_title,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 27),textAlign: TextAlign.center,)),

                  // Spacer(),
                  // Align(
                  //   alignment: Alignment.bottomLeft,
                  //     child:DateTime(DateTime.now()))
                ],
              ),
            ),
          );
            }),
      ) : Container(),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        shape: CircleBorder(side: BorderSide(style: BorderStyle.none)),
        onPressed: (){
          callmybottom();
        },
        child: Icon(Icons.add,color: Colors.white,),
      ) ,
    );
  }

  void callmybottom({bool isupdate = false,String titles = "",String descs = "",int note_ID = 0}){
    if(isupdate){
      mtitle.text = titles;
      mdes.text=descs;
    }else{
      mtitle.text="";
      mdes.text="";
    }
    showModalBottomSheet(context: context, builder: (context){
      return SizedBox(
        width: double.infinity,
        height: 450,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: (
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 550,
                    child: TextField(
                        controller: mtitle,
                        decoration:InputDecoration(
                          labelText: "Title",
                            border:  OutlineInputBorder(
                                borderRadius: BorderRadius.circular(20)
                            )
                        )
                    ),
                  ),
                  SizedBox(height: 20,),
                  SizedBox(
                    width: 550,
                    child: TextField(
                      maxLines: 2,
                      controller: mdes,
                      decoration:InputDecoration(
                        labelText: "Description",
                        border:  OutlineInputBorder(
                            borderRadius: BorderRadius.circular(20),
                            borderSide: BorderSide(width: 2)
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),

                  Row(
                    children: [
                      ElevatedButton(onPressed: (){

                      }, child: Text("ADD")),
                      ElevatedButton(onPressed: (){

                      }, child: Text("Cancel"))
                    ],
                  )

                ],
              )
          ),
        ),
      );
    });
  }
}
