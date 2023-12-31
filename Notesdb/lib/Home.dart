import 'package:flutter/material.dart';
import 'package:notesdb/Appdb.dart';
import 'package:notesdb/model_class.dart';
import 'package:sqflite/sqflite.dart';

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState(){
    return noteState();
  }
}
class noteState extends State<HomePage>{
  late AppDataBase  appdb;

  var title = TextEditingController();
  var des = TextEditingController();

  List<NoteModel> entry = [];

  @override
  void initState() {
    super.initState();
    appdb = AppDataBase.instance;
    getnotes();
  }

  void getnotes()async{
   entry = await appdb.fetchdata();
   setState(() {

   });
  }


  @override
  Widget build(BuildContext){
    return Scaffold(
      appBar: AppBar(
        title: Text('Notes',style: TextStyle(color: Colors.white),),
        backgroundColor: Colors.black,
      ),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: entry.isNotEmpty ? Container(
            height:double.infinity,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: Colors.grey.shade300
            ),
            child: ListView.builder(
                itemCount: entry.length,
                itemBuilder: (context,index){
                  var currData = entry[index];

                  return ListTile(
                    title: Text("${currData.note_title}"),
                    subtitle: Text("${currData.note_desc}"),
                    leading: Text("${index+1}"),
                    trailing: SizedBox(
                      width: 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(onPressed: (){

                            callmybottom(
                                isupdate: true, itle:currData.note_title,
                                desc: currData.note_desc,
                              note_ID: currData.note_id
                            );

                          }, icon: Icon(Icons.edit,color: Colors.blue,),),
                          IconButton(onPressed: (){

                            showDialog(context: context, builder: (context){
                              return AlertDialog(
                                title:  Text("DELETE ?"),
                                content: Text("Are you sure?"),
                                actions: [
                                  TextButton(onPressed: (){
                                    appdb.delete(currData.note_id);
                                    getnotes();


                                    Navigator.pop(context);
                                  }, child: Text("Yes")),
                                  TextButton(onPressed: (){
                                    Navigator.pop(context);
                                  }, child: Text("No"))
                                ],
                              );
                            });

                          }, icon: Icon(Icons.delete,color: Colors.red,))
                        ],
                      ),
                    ),
                  );

                }),
      ):Container()),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Show model bottom sheet here
          callmybottom();
        },
        child: Icon(Icons.add),
      ),
    );
  }

  void callmybottom({bool isupdate = false,String itle = "",String desc = "",int note_ID = 0}){

    if(isupdate){
      title.text= itle;
      des.text=desc;
    }else{
      title.text="";
      des.text="";
    }
    showModalBottomSheet(context: context,
        builder: (context) {
          bool _validate = false;
          return SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: (
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Title',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 550,
                      child: TextField(
                          controller: title,
                          decoration:InputDecoration(
                              errorText: _validate ? 'value cant be empty' : null,
                              border:  OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)
                              )
                          )
                      ),
                    ),
                    SizedBox(height: 20,),
                    Text('Note',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                    SizedBox(height: 20,),
                    SizedBox(
                      width: 550,
                      child: TextField(
                        maxLines: 5,
                        controller: des,
                        decoration:InputDecoration(
                          border:  OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20),
                              borderSide: BorderSide(width: 2)
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(onPressed:(){
                          if(title.text.isNotEmpty && des.text.isNotEmpty) {
                            if(isupdate){
                              //update
                              appdb.update(NoteModel(note_id: note_ID,
                                  note_title: title.text.toString(),
                                  note_desc: des.text.toString()));

                            }else{
                              //add
                              appdb.addnotes(NoteModel(
                                  note_id: 0,
                                  note_title: title.text.toString(),
                                  note_desc: des.text.toString()));
                            }

                            getnotes();

                            Navigator.pop(context);
                          }

                        }, child: Text(isupdate ? "update":'ADD')),
                        ElevatedButton(onPressed: (){
                          Navigator.pop(context);
                        }, child: Text('Cancel'))
                      ],
                    )
                  ],
                )
            ),
          );
        } );
  }
}