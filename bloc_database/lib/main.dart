import 'package:bloc_database/note_bloc.dart';
import 'package:bloc_database/note_database.dart';
import 'package:bloc_database/note_event.dart';
import 'package:bloc_database/note_state.dart';
import 'package:bloc_database/onboarding/login.dart';
import 'package:bloc_database/onboarding/signup.dart';
import 'package:bloc_database/onboarding/splash.dart';
import 'package:bloc_database/operation_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';


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
      home: SplashPage(),
    );
  }
}

class Homepage extends StatefulWidget {

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
String name = "";
  @override
  void initState() {
    super.initState();
  }

  void getUserName()async{
    var prefs =await SharedPreferences.getInstance();
   var useer = prefs.getString(AppDataBase.USER_NAME);
   name = useer!;
  }

  @override
  Widget build(BuildContext context) {

    BlocProvider.of<NoteBloc>(context).add(FetchAllNote());

    return Scaffold(
      appBar: AppBar(
        title: Text("Bloc With DataBase\nHello $name"),
        actions: [
          IconButton(onPressed: ()async{
            var prefs = await SharedPreferences.getInstance();
            prefs.setBool(AppDataBase.LOGIN_PREFS_KEY, false);
            Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
              return Login();
            }));
          }, icon: Icon(Icons.logout))
        ],
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
                                  descs: "${currData.noteDesc}", user_id: currData.user_ID,
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
            return OperationPage(user_id: 0);
          }));
        },
        child: Icon(Icons.navigate_next),
      ),

    );
  }
}
