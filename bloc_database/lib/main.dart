import 'package:bloc_database/note_bloc.dart';
import 'package:bloc_database/note_database.dart';
import 'package:bloc_database/note_event.dart';
import 'package:bloc_database/note_state.dart';
import 'package:bloc_database/operation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


void main() {
  runApp(BlocProvider(
    create: (context) => NoteBloc(db: AppDataBase.instance),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Homepage(),
    );
  }
}

class Homepage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    BlocProvider.of<NoteBloc>(context).add(FetchAllNote());

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc With DataBase"),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if(state is NoteLoading){
            return Center(child: CircularProgressIndicator());
          }
          if(state is NoteError){
            Center(child: Text("${state.errormsg}"),);
          }
          if(state is NoteLoaded){
          return state.allnotes.isNotEmpty ? ListView.builder(
              itemCount: state.allnotes.length,
              itemBuilder: (context, index) {

                var currData = state.allnotes[index];

                return ListTile(
                  leading: Text("${index+1}"),
                  title: Text("${currData.noteTitle}"),
                  subtitle: Text("${currData.noteDesc}"),
                  trailing: SizedBox(
                    width: 100,
                    child: Row(
                      children: [
                        IconButton(onPressed: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) {
                                return OperationPage(
                                  isUpdate: true,
                                  note_id: currData.noteID,
                                  title: "${currData.noteTitle}",
                                  descs: "${currData.noteDesc}",
                                );
                              }));
                        }, icon: Icon(Icons.edit)),
                        IconButton(onPressed: (){
                          BlocProvider.of<NoteBloc>(context).add(DeleteEvent(mindex: currData.noteID));
                        }, icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              }) : Container();
        };
          return Container();
        }
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) {
            return OperationPage();
          }));
        },
        child: Icon(Icons.navigate_next),
      ),

    );
  }
}
