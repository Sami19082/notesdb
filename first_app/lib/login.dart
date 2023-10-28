import 'package:first_app/task1.dart';
import 'package:flutter/material.dart';

void main(){
  runApp(MaterialApp(home: myhomepage(),));
}
class myhomepage extends StatefulWidget{
  @override
  State<myhomepage> createState() => _myhomepageState();
}

class _myhomepageState extends State<myhomepage> {
  var namecontrol = TextEditingController();

  var namecontrolL = TextEditingController();

  var name = TextEditingController();

  var sam = TextEditingController();
  bool isObscure = true;
  TextEditingController pass= TextEditingController();

  @override
  Widget build (BuildContext context){
    return Scaffold(
      appBar: AppBar(
          title: const Text('Home',style: TextStyle(fontWeight: FontWeight.bold,fontStyle: FontStyle.italic,color: Colors.black54),)),
      backgroundColor: Colors.purple.shade100,
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: SingleChildScrollView(
          child: Column(

            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('START FROM FREE',style: TextStyle(fontFamily: 'bold',color: Colors.black,fontSize: 15,),textAlign: TextAlign.center,),
                      Text('Create new account',style: TextStyle(fontFamily: 'mainF',color: Colors.white,fontSize: 30),),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  const Text('Already A Member?',style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,color: Colors.black),),
                  const SizedBox(
                    width: 15,
                  ),
                  OutlinedButton(onPressed: (){},child: Text('Log in',style: TextStyle(fontSize: 15,fontStyle: FontStyle.italic,color: Colors.blue),),
                    style: OutlinedButton.styleFrom(
                      shadowColor: Colors.white,
                      backgroundColor: Colors.white,
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                width: 500,
                height: 100,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: namecontrol,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          suffixIconColor: Colors.black,
                          label: Text('First Name'),
                          labelStyle: TextStyle(color: Colors.black,fontStyle: FontStyle.italic),
                          hintText: 'Enter Your First Name',
                          hintStyle: TextStyle(fontStyle: FontStyle.italic, color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              )

                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                  color: Colors.blue
                              )
                          ),
                        ),),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: TextField(
                        controller: namecontrolL,
                        decoration: InputDecoration(
                          suffixIcon: Icon(Icons.person),
                          suffixIconColor: Colors.black,
                          label:Text('Last Name'),
                          labelStyle: TextStyle(color: Colors.black,fontStyle: FontStyle.italic),
                          hintText: 'Enter Your Last Name',
                          hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.black,
                                width: 2,
                              )

                          ),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: const BorderSide(
                                color: Colors.blue,
                              )
                          ),
                        ),),
                    ),

                  ],
                ),
              ),
              SizedBox(
                width: 500,
                child: TextField(
                  keyboardType: TextInputType.emailAddress,
                  controller: name,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Email',
                      hintStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.white),
                      suffix: Text('@gmail.com'),
                      suffixIcon: Icon(Icons.email_sharp),
                      suffixIconColor: Colors.black,
                      label: Text('Email'),
                      labelStyle: TextStyle(fontStyle: FontStyle.italic,color: Colors.black),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.blue,
                            width: 2,
                          )
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 500,
                child: TextField(
                  obscureText: isObscure ,
                  obscuringCharacter: '*',
                  controller: sam,
                  decoration: InputDecoration(
                      hintText: 'Enter Your Password',
                      hintStyle: const TextStyle(color: Colors.white,fontStyle: FontStyle.italic),
                      label: const Text('Password'),
                      labelStyle: const TextStyle(color: Colors.black,fontStyle: FontStyle.italic),
                      suffixIcon: IconButton(
                       icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                        onPressed: (){
                         setState(() {
                           isObscure= ! isObscure ;
                         });
                        },
                      ),
                      suffixIconColor: Colors.black,
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.black,
                            width: 2,
                          )
                      ),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                              color: Colors.blue
                          )
                      )
                  ),
                ),
              ),
              const SizedBox(height: 20),
              SizedBox(
                width: 500,
                child: Row(
                  children: [
                    Expanded(
                      child: ElevatedButton(onPressed: (){
                      }, child: Text(
                        'Change Method',style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                        style: ElevatedButton.styleFrom(
                          elevation: 2,
                          shadowColor: Colors.blue.shade100,
                          backgroundColor: Colors.blue,
                          foregroundColor: Colors.white,
                          fixedSize: Size(50, 10),
                        ),),

                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Expanded(
                      child: ElevatedButton(onPressed: (){}, child:
                      Text('Create Account',style: TextStyle(fontStyle: FontStyle.italic),
                      ),
                        style: ElevatedButton.styleFrom(
                            elevation: 3,
                            shadowColor: Colors.white,
                            backgroundColor: Colors.white
                        ),

                      ),
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Employing robust encryption and authentication protocols, it ensures data privacy and security. Users can reset passwords via email, offering a seamless experiencee',style: TextStyle(fontStyle: FontStyle.italic,),textAlign: TextAlign.start,),
                ],
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(' For More Information Click Here',style: TextStyle(fontStyle: FontStyle.italic,),textAlign: TextAlign.start,),
                  IconButton(
                    style:IconButton.styleFrom(
                        elevation: 0.5,
                        shadowColor: Colors.grey
                    )
                    ,onPressed: (){}, icon:Icon(Icons.info),color: Colors.grey,)

                ],
              ),


            ],
          ),
        ),

      ),
    );
  }
}