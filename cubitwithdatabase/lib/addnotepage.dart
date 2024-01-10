
import 'package:cubitwithdatabase/cubit.dart';
import 'package:cubitwithdatabase/notemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class Addnotepage extends StatelessWidget {
  bool isupdate;
  String mtitle;
  String mdesc;
  int mnoteID;
  int userID;
  Addnotepage({ this. mtitle = "",this.mdesc = "", this.mnoteID = 0,this.isupdate = false,this.userID= 0});


  var titlecontroller= TextEditingController();
  var desccontroller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    titlecontroller.text =  mtitle ;
    desccontroller.text = mdesc;
    return Scaffold(
      appBar: AppBar(
        title: Text("Operation Page"),
      ),
      body: Column(
        children: [
          Text(isupdate ? "Update page":"Add Notes"),
          TextField(controller: titlecontroller,),
          TextField(controller: desccontroller,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){
                if(titlecontroller.text.isNotEmpty&&desccontroller.text.isNotEmpty){
                  if(isupdate){
                    var notetitle = titlecontroller.text.toString();
                    context.read<NoteCubit>().updateNote(
                        NoteModel(
                            mtitle: notetitle,
                            mdesc: desccontroller.text.toString(),
                            note_id: mnoteID,
                            userID: userID));
                  }else{
                    context.read<NoteCubit>().addNote(
                        NoteModel(note_id: 0,
                            mtitle: titlecontroller.text.toString(),
                            mdesc: desccontroller.text.toString(),
                            userID: 0));
                  }
                }
                Navigator.pop(context);
              }, child: Text(isupdate ? "update" : "Add")),
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text("cancel"))
            ],
          )
        ],
      ),
    );
  }
}
