import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sharedprefs/sharedpref.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => _showState();
}

class _showState extends State<Homepage> {


int counts = 0;
String name = "";

@override
  void initState() {
    super.initState();
   counttime();
  }

  void counttime()async{
    SharedPreferences prefs= await SharedPreferences.getInstance();

  var username = prefs.getString(Loginpagestate.USERNAME);
  name = username!;

  counts = (prefs.getInt("count") ?? 0) ;
  counts++;
  prefs.setInt("count", counts);
  setState(() {

  });
  }

  @override
  Widget build(BuildContext context) {
  var bgColor;
    if (counts % 5 == 0) {
      bgColor =Colors.red.shade200;
    }else{
      bgColor =Colors.grey.shade200;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Login Count"),
      ),
      backgroundColor: bgColor,
      body: Center(
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row( mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Welcome ,",style: TextStyle(color: Colors.blue.shade200,fontWeight: FontWeight.bold,fontSize: 25),),
                SizedBox(width: 15),
                Text( name == "" ? "" : name,
                  style: TextStyle(fontSize: 25,fontWeight: FontWeight.w500,color: Colors.grey.shade500),),
              ],
            ),
            Text("You have logged in , $counts ${ counts ==1 ? "time" : "times"}"),
            SizedBox(height: 50,),
            ElevatedButton(
              style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue.shade200),
                  foregroundColor: MaterialStatePropertyAll(Colors.white)),
                onPressed: () async{
                  var prefs = await SharedPreferences.getInstance();
                  prefs.setBool(Loginpagestate.LOGINKEY, false);
              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                return Loginpage();
              }));
             }, child: Text("Log Out"))
          ],
        ),
      ),
    );
  }
}
