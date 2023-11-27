import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: notes()));
}

class notes extends StatefulWidget{

  @override
  State<notes> createState(){
    return noteState();
  }
}
class noteState extends State<notes>{
  var title = TextEditingController();
  var des = TextEditingController();
  List<Map<String,dynamic>> entry = [];
void addData(){

  setState(() {
    entry.add({"title":title.text.toString(),"des":des.text.toString()});
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
        child: Container(
          height:double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: Colors.blueAccent.shade100
          ),
          child: ListView.builder(
            itemCount: entry.length,
              itemBuilder: (context,index){
              return ListTile(
                title: Text(entry[index]["title"]),
                subtitle: Text(entry[index]["des"]),
                leading: Text('${index+1}'),
              );

              })
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          //Show model bottom sheet here
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

                      addData();
                        Navigator.pop(context);
                      }, child: Text('ADD')),
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
        },
        child: Icon(Icons.add),
      ),
    );
  }
}