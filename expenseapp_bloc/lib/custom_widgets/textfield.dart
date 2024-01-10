import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CstmTextField extends StatelessWidget{
  final String lable;
  final IconData iconData;
  final TextInputType keyboardType;
  final TextEditingController controller;

  CstmTextField({required this.lable,required this.iconData,required this.keyboardType,required this.controller});

  @override
  Widget build(BuildContext context) {
   return Padding(padding: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
     child: TextFormField(
       controller: controller,
       keyboardType:  keyboardType,
       decoration: InputDecoration(
         filled:  true,
         fillColor:  Colors.white,
         border: OutlineInputBorder(
           borderRadius: BorderRadius.circular(25),
           borderSide: BorderSide(color: Colors.black),
         ),
         focusedBorder: OutlineInputBorder(
           borderRadius: BorderRadius.circular(25),
           borderSide:  BorderSide(color: Colors.black),
         ),
         label: Text(
           lable,
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.w500,
             color: Colors.blue,
           ),
         ),
         suffixIcon: Icon(
           iconData,
           size: 30,
         )
       ),
     ),

   );

  }

}