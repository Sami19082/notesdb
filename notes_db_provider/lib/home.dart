import 'package:flutter/material.dart';
import 'package:notes_db_provider/appdata.dart';
import 'package:provider/provider.dart';

import 'addnotepage.dart';
import 'note_provider.dart';
import 'notemodel.dart';

class HomePage extends StatefulWidget {
  String title;
  HomePage({required this.title});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<NoteModel> arrNote = [];

  var titlecontroler = TextEditingController();

  var desccontroler = TextEditingController();

  var appDB;

  @override
  void initState() {
    super.initState();
    getInitialNotes();
    appDB = AppDataBase.instance;
  }

  void getInitialNotes()async{
    await context.read<NoteProvider>().fetchNotes();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes With DB & Provider"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          width: double.infinity,
          height: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.grey.shade200
          ),
          child: Consumer<NoteProvider>(
              builder: (context,provider,child){
                return ListView.builder(
                  itemCount: provider.getNotes().length,
                    itemBuilder: (context,index){
                      var currData = provider.getNotes()[index];
                      return ListTile(
                        title: Text(currData.title),
                        subtitle: Text(currData.desc),
                        trailing: SizedBox(
                          width: 100,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context){
                                    return AddNotePage(
                                      isUpdate: true,
                                      note_ID: 0,
                                      title: currData.title,
                                      desc: currData.desc,
                                    );
                                  },),);
                                },
                                  child: Icon(Icons.edit)),
                              SizedBox(width: 15,),
                              InkWell(
                                onTap: (){
                                  AppDataBase.instance.deleteNote(index);

                                },
                                  child: Icon(Icons.delete)),
                            ],
                          ),
                        ),
                      );
                    });
              },
          ),

        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddNotePage(isUpdate: false,);
          },),);
        },child: Icon(Icons.add),
      ),
    );
  }

}
