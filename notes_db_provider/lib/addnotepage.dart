import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'note_provider.dart';
import 'notemodel.dart';

class AddNotePage extends StatelessWidget {
  String title;
  String desc;
  int uid;
  int note_ID;
  bool isUpdate = false;
 AddNotePage({ this.title = "", this.desc = "", this.isUpdate = false,this.note_ID = 0,required this.uid});

 var titleController = TextEditingController();
 var descController = TextEditingController();
 String operationTitle = "Add Note";

initControllers(){
   titleController.text = title;
   descController.text = desc;
}
  @override
  Widget build(BuildContext context) {
   if(isUpdate){
     initControllers();
     operationTitle = "Update";
   }
    return Scaffold(
      appBar: AppBar(
        title: Text(operationTitle),
      ),
      body: Container(
        height: 400,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(operationTitle,style: TextStyle(fontSize: 21),),
              SizedBox(height: 15,),
              TextField(
                controller: titleController,
                decoration: InputDecoration(
                  hintText: "enter title",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(21),
                  )
                ),
              ),
              SizedBox(height: 15,),
              TextField(
                controller: descController,
                decoration: InputDecoration(
                    hintText: "enter Description",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(21),
                    )
                ),
              ),
              SizedBox(height: 15,),
              ElevatedButton(onPressed: (){
                var title = titleController.text.toString();
                var desc = descController.text.toString();

                if(isUpdate){
                  context.read<NoteProvider>().updateNotes(NoteModel(title: title, desc: desc, note_id: note_ID, user_id:uid ));
                  Navigator.pop(context);
                }else{
                  if(titleController.text.isNotEmpty && descController.text.isNotEmpty){
                    context.read<NoteProvider>().addNotes(NoteModel(title: titleController.text.toString(), desc: descController.text.toString(), note_id: 0, user_id: 0));
                    Navigator.pop(context);
                  }
                }
               }, child: Text(operationTitle),
              )
            ],
          ),
        ),
      ),
    );
  }
}

