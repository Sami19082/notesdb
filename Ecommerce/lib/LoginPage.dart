import 'dart:async';

import 'package:ecommerce/Home.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:rive/rive.dart';

class loginpage extends StatefulWidget {
  const loginpage({super.key});

  @override
  State<loginpage> createState() => _loginpageState();
}

class _loginpageState extends State<loginpage> {
  StateMachineController ? controller;
  Artboard ? mainArtBoard;
  SMIInput<bool>?inputCheck;
  SMIInput<double>?inputLook;
  SMIInput<bool>?inputsuccess;
  SMIInput<bool>?inputfail;
  SMIInput<bool>?inputhands_up;
  var text1 = TextEditingController();
  var text2 = TextEditingController();
  String? Password;
  @override
  void initState() {
    super.initState();
    
    rootBundle.load("Assets/Rive/5204-10423-bear.riv").then((riveByteData) {
      var riveFile = RiveFile.import(riveByteData);
      var artboard = riveFile.mainArtboard;
      controller = StateMachineController.fromArtboard(
          artboard, "State Machine 1");
      if(controller!=null){
        artboard.addController(controller!);
        mainArtBoard = artboard;

        inputCheck = controller!.findSMI("Check");
        inputfail = controller!.findSMI('fail') as SMITrigger;
        inputsuccess = controller!.findSMI('success') as SMITrigger;
        inputhands_up = controller!.findSMI('hands_up')as SMIBool;
        inputLook = controller!.findSMI("Look") as SMINumber;

        setState(() {
          
        });
      }

    } );

  }
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xD3DFE9FF),
      body:Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Expanded(
            flex: 2,
            child: SizedBox(
              height: 480,
              child: mainArtBoard!= null ? Center(
                child: Rive(
                  artboard: mainArtBoard!,
                  fit: BoxFit.fill,
                ),
              ): Container(
                child: Text('Loading...'),
              ),
            ),
          ),
          Expanded(
            flex: 1,
            child: Align(
              alignment: AlignmentDirectional.bottomStart,
              child: Container(
                height: 300,
                width: double.infinity,
                decoration: BoxDecoration(
                 color: Colors.white
                ),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 10,left: 10,right: 10),
                        child: SizedBox(
                          height: 100,
                          width: 350,
                          child: TextField(
                            controller: text1,
                            onSubmitted: (value){
                              inputCheck?.value=false;
                            },
                            onChanged: (value){
                              int stringcount = value.length ;
                              if(inputLook!= null){
                                inputLook!.change((stringcount*100)/35);
                            if(inputCheck!.value==false) {
                            inputCheck!.value = true;}}},

                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                              labelText: "Email",
                              hintText:" What's your email address?",
                              suffixText:" @gmail.com,",
                              suffixStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey),
                              hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.grey),
                              labelStyle: TextStyle(color: Colors.grey.shade600,fontSize: 20,fontStyle: FontStyle.italic ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding:  const EdgeInsets.only(top: 10,left: 10,right: 10),
                        child: SizedBox(
                          height: 100,
                          width: 350,
                          child: TextField(
                            obscureText: true,
                            obscuringCharacter: "*",
                            onSubmitted: (value){
                              inputhands_up?.value =false;
                              inputCheck?.value=false;
                            },
                            onChanged: (value){
                              if(inputCheck!.value==false) {
                                inputCheck!.value = true;
                              }
                              if(inputhands_up != null){
                                inputhands_up!.change(true);
                              }
                              Password =value;
                            },
                            controller: text2,
                            decoration: InputDecoration(
                              labelText: "Password",
                              suffixIcon: Icon(Icons.remove_red_eye_outlined),
                              labelStyle: TextStyle(color: Colors.grey.shade600,fontSize: 20,fontStyle: FontStyle.italic ),
                              focusedBorder: UnderlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue)
                              ),
                            ),
                          ),
                        ),
                      ),
                      ElevatedButton(
                        style: ButtonStyle(fixedSize: MaterialStatePropertyAll(Size(200, 30)),
                            foregroundColor: MaterialStatePropertyAll(Colors.white),
                        backgroundColor: MaterialStatePropertyAll(Colors.purple.shade300)),
                          onPressed: (){
                          inputCheck?.value=false;
                          inputhands_up?.value=false;
                          if(Password == "password"){
                            inputsuccess!.value=true;
                          }
                          Timer(Duration(seconds: 2), () {
                            if(Password == "password"){
                              SnackBar(
                                margin: EdgeInsets.all(11),
                                  backgroundColor: Colors.blue.shade200,
                                  behavior: SnackBarBehavior.floating,

                                  content: Row(children: [
                                   Icon(Icons.login),
                                   SizedBox(
                                    width: 11,
                                   ),
                                   Text("Successfully Logged In")
                                ],
                              ));
                              inputsuccess!.value=true;
                              Navigator.pushReplacement(context, MaterialPageRoute(builder: (context){
                                return Homepage();
                              }));
                            }else{
                              ScaffoldMessenger.of(context).showSnackBar(SnackBar(margin: EdgeInsets.all(11),
                                  action: SnackBarAction(backgroundColor: Colors.red.shade200,label: "Retry", onPressed: (){}),
                                  backgroundColor: Colors.redAccent.shade200,
                                  behavior: SnackBarBehavior.floating,content: Row(
                                    children: [
                                      Icon(Icons.sms_failed),
                                      SizedBox(
                                        width: 11,
                                      ),
                                      Text("Logged In Failed")
                                    ],
                                  )));
                              inputfail!.value=true;
                            }
                          });

                      }, child: Text("Log In",style: TextStyle(fontSize: 18),) ),
                      Text("New User?"),
                      TextButton(
                          onPressed: (){

                       }, child: Text('Sign Up'))
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
