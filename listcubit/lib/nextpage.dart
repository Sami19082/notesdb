import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:listcubit/list_cubit.dart';

class NextPage extends StatelessWidget {
int mIndex;
String mtitle;
String mdesc;
  bool isupdate;
  NextPage({this.isupdate = false, this.mIndex = 0,this.mtitle= "",this.mdesc=""});
  var title = TextEditingController();
  var desc = TextEditingController();

  @override
  Widget build(BuildContext context) {
    title.text = mtitle;
    desc.text = mdesc;
    return Scaffold(
      appBar: AppBar(
        title: Text("Operation Page"),
      ),
      body: Column(
        children: [
          Text(isupdate ? "Update" : "Add notes"),
          TextField(
            controller:  title,
          ),
          TextField(
            controller:  desc,
          ),
          ElevatedButton(onPressed: (){
            if(title.text.isNotEmpty&&desc.text.isNotEmpty){

              var mNote = {
                "title" : title.text.toString(),
                "desc": desc.text.toString()
              };

             if(isupdate){
               BlocProvider.of<ListCubit>(context).updateNote(mNote, mIndex);
             }else
               BlocProvider.of<ListCubit>(context).addnote(mNote);
            }
            Navigator.pop(context);
          }, child: Text(isupdate ? "Update" : "Add"))
        ],
      ),
    );
  }
}
