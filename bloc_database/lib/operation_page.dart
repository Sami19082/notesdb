import 'package:bloc_database/note_bloc.dart';
import 'package:bloc_database/note_event.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'notemodel.dart';

class OperationPage extends StatelessWidget {
  bool isUpdate ;
  int note_id;
  String title;
  String descs;

  OperationPage({this.isUpdate = false, this.note_id = 0 ,this.title = "", this.descs = ""});

  var titlecontroller = TextEditingController();
  var desccontroller = TextEditingController();


  @override
  Widget build(BuildContext context) {
    //controller value
    titlecontroller.text = title;
    desccontroller.text = descs;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "operation Page"
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(isUpdate ? "update" : 'Add Notes'),
            TextField(
              controller: titlecontroller,
            ),
            TextField(
              controller: desccontroller,
            ),
            ElevatedButton(onPressed: (){
              if(titlecontroller.text.isNotEmpty&&desccontroller.text.isNotEmpty){
                if(isUpdate){
                  //update
                  var updatednote = NoteModel(
                      noteID: note_id,
                      noteTitle: title,
                      noteDesc: descs);

                  BlocProvider.of<NoteBloc>(context).add(UpdateNote( mindex: note_id, updatenote: updatednote));

                }else{
                  //add
                  var addnote = NoteModel(
                      noteID: 0,
                      noteTitle: titlecontroller.text.toString(),
                      noteDesc: desccontroller.text.toString());
                  BlocProvider.of<NoteBloc>(context).add(AddNoteEvent(newNote: addnote));
                }
                Navigator.pop(context);
              }
             }, child: Text(isUpdate ? "update":"Add"))
          ],
        ),
      ),
    );
  }
}
