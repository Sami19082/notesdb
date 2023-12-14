import 'package:cubitwithdatabase/notemodel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit.dart';

class Addnotepage extends StatelessWidget {
  var titlecontroller= TextEditingController();

  var desccontroller= TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Operation Page"),
      ),
      body: Column(
        children: [
          Text("Add Notes"),
          TextField(controller: titlecontroller,),
          TextField(controller: desccontroller,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              TextButton(onPressed: (){
                if(titlecontroller.text.isNotEmpty&&desccontroller.text.isNotEmpty){
                  context.read<NoteCubit>().addnote(NoteModel(
                    note_id: 0,
                      user_id: 0,
                      mtitle: titlecontroller.text.toString(),
                      mdesc: desccontroller.text.toString()));
                  Navigator.pop(context);
                }
              }, child: Text("Add")),
              TextButton(onPressed: (){Navigator.pop(context);}, child: Text("cancel"))
            ],
          )
        ],
      ),
    );
  }
}
