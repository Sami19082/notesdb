import 'package:flutter/material.dart';
import 'package:navigation_app/screens/secondpage.dart';

class homepage extends StatelessWidget{
  var log = TextEditingController();
  var pas = TextEditingController();
  bool isObscure = true;
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('Online Hospital',style: TextStyle(fontWeight: FontWeight.w500 ,fontSize: 20),),
              Icon(Icons.search),
            ],
          ),
        ),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('Asset/image/img.png'),
            fit: BoxFit.cover
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 50),
              Text('All About',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 55,color: Colors.white),),
              Text('Patient Health',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 55,color: Colors.white)),
              Text('In One App',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 55,color: Colors.white)),
              SizedBox(height: 50),
              Text('Lets Get Started',style: TextStyle(fontWeight: FontWeight.w500,fontSize: 35,color: Colors.lightBlueAccent.shade400)),
              SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: log,
                  decoration: InputDecoration(
                    hintText: 'Name',
                    hintStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),
                    suffixIcon: Icon(Icons.person,color: Colors.white,),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.black,
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.cyan
                      ),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                      borderSide: BorderSide(
                        color: Colors.white
                      ),
                    )
                  ),
                ),
              ),
              SizedBox(height: 30),
              SizedBox(
                height: 50,
                width: 300,
                child: TextField(
                  controller: pas,
                  obscureText: isObscure ,
                  obscuringCharacter: '*',
                  decoration: InputDecoration(
                      hintText: 'Password',
                      hintStyle: TextStyle(fontWeight: FontWeight.w500,color: Colors.white),
                      suffixIcon: IconButton(
                        icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: (){
                         
                        },
                      ),
                      suffixIconColor: Colors.white,
                      border: OutlineInputBorder(
                        borderSide: BorderSide(
                          color: Colors.black,
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(
                            color: Colors.cyan
                        ),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide(
                            color: Colors.white
                        ),
                      )
                  ),
                ),
              ),
              SizedBox(height: 30),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 100),
                child: ElevatedButton(
                    onPressed: (){
                      var mname = log.text.toString();
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context){
                            return second(name: mname,);
                      }),);
                      },
                    child: Text('Login',style: TextStyle(color: Colors.white),),style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.lightBlueAccent
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}