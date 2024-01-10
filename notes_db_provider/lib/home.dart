import 'package:flutter/material.dart';
import 'package:notes_db_provider/appdata.dart';
import 'package:notes_db_provider/user_onboard/login.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'addnotepage.dart';
import 'note_provider.dart';
import 'notemodel.dart';

class HomePage extends StatefulWidget {
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
    context.read<NoteProvider>().fetchNotes();


  }
  @override
  Widget build(BuildContext context) {
    context.read<NoteProvider>().getNotes();
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes With DB & Provider"),
        actions: [
          IconButton(onPressed: ()async{
            var prefs = await SharedPreferences.getInstance();
            prefs.setBool(AppDataBase.LOGIN_PREFS_KEY, false);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return Login();
            }));
          }, icon: Icon(Icons.logout)),
        ],
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
                                      note_ID: currData.note_id,
                                      title: currData.title,
                                      desc: currData.desc,
                                      uid: currData.user_id,
                                    );
                                  },),);
                                },
                                  child: Icon(Icons.edit)),
                              SizedBox(width: 15,),
                              InkWell(
                                onTap: (){
                                  context.read<NoteProvider>().deleteNote(currData.note_id);
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
            return AddNotePage(isUpdate: false, uid: 0,);
          },),);
        },child: Icon(Icons.add),
      ),
    );
  }

}
