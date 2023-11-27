
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefs/showopen.dart';

class Loginpage extends StatefulWidget {

  @override
  State<Loginpage> createState(){
    return Loginpagestate();
  }
}
class Loginpagestate extends State<Loginpage>{
static const String LOGINKEY = "islogin";
static const String USERNAME = "uname";
  var  iname = TextEditingController();
  String? nameprefs ;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferrence"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Welcome ,",style: TextStyle(color: Colors.blue.shade200,fontWeight: FontWeight.bold,fontSize: 25),),
            SizedBox(height: 10),
            SizedBox(
              width: 300,
              height: 300,
              child: TextField(
                controller: iname,
              ),
            ),
            SizedBox(height: 15),
            ElevatedButton(onPressed: () async{
              var prefs = await SharedPreferences.getInstance();
              prefs.setBool(LOGINKEY, true);

              var mname = iname.text.toString();
              prefs.setString(USERNAME, mname);

              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return Homepage();
              }));

             }, child: Text("Save"))
          ],
        ),
      ),
    );
  }
}


