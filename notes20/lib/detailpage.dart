import 'package:flutter/material.dart';

class detailpage extends StatefulWidget {
  String title;
  String desc;
  int note_id;
  TextEditingController text1;
  TextEditingController text2;
  detailpage({required this.title,required this.desc,required this.note_id,required this.text1,required this.text2});

  @override
  State<detailpage> createState() => _detailpageState();
}

class _detailpageState extends State<detailpage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.grey.shade300
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.desc,style: TextStyle(fontWeight: FontWeight.w500,fontSize: 20),),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(onPressed: (){

                    callmybottom(
                      isupdate:  true,
                      titles: widget.title,
                      descs: widget.desc,
                      note_ID: widget.note_id
                    );

                    }, icon: Icon(Icons.edit,color: Colors.blue.shade200,)),
                  IconButton(onPressed: (){

                    showDialog(context: context, builder: (context){
                      return AlertDialog(
                        title: Text("Delete ?"),
                        content: Text("Are You Sure"),
                        actions: [
                          TextButton(onPressed: (){

                           }, child: Text("Yes")),
                          TextButton(onPressed: (){
                            Navigator.pop(context);
                           }, child: Text("No"))
                        ],
                      );
                    });
                   
                    }, icon: Icon(Icons.delete,color: Colors.red.shade200,))
                ],
              )
            ],
          ),
        ),
      ) ,
    );
  }

  void callmybottom({bool isupdate = false,String titles = "",String descs = "",int note_ID = 0}){
    if(isupdate){
      widget.text1.text = titles;
      widget.text2.text=descs;
    }else{
      widget.text1.text="";
      widget.text2.text="";
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
                        controller: widget.text1,
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
                      controller: widget.text2,
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

                ],
              )
          ),
        ),
      );
    });
  }
}
