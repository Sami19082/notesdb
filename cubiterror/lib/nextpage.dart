import 'package:cubiterror/cubiterror.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NextPage extends StatelessWidget {
bool isUpdate;
int mindex;
String mTitle;
String mDesc;

NextPage({this.isUpdate= false,this.mindex= 0,this.mTitle = "", this.mDesc = ""});

  var titlecontroller = TextEditingController();
  var desccontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    titlecontroller.text = mTitle;
    desccontroller.text= mDesc;
    return Scaffold(
      appBar: AppBar(
        title: Text("Operation Page"),
      ),
      body: Column(
        children: [
          Text(isUpdate ? "update" : "Add Note"),
          TextField(
            controller: titlecontroller,
          ),
          TextField(
            controller: desccontroller,
          ),
          ElevatedButton(onPressed: (){
            if(titlecontroller.text.isNotEmpty&&desccontroller.text.isNotEmpty){
              var mNote= {"title" : titlecontroller.text.toString(),"desc":desccontroller.text.toString()};
              if(isUpdate){
                BlocProvider.of<ListCubit>(context).updateNote(mNote,mindex);
              }else{
                BlocProvider.of<ListCubit>(context).addNote(mNote);
              }
              Navigator.pop(context);

            }
           }, child: Text(isUpdate ? "update":"Add"))
        ],
      ),
    );
  }
}
