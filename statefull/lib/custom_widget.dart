import 'package:flutter/material.dart';
//text//
class Texted extends StatelessWidget{

final String tex;
final TextStyle style;
TextAlign? align;
Texted({required this.style, required this.tex,this.align});

  @override
  Widget build(BuildContext context) {
    return Text(tex,style:style,textAlign: align);
  }
  }

 //container//

class cont extends StatelessWidget{
 final Color? color;
 final Decoration ? decoration;
 final Widget child;

 cont({required this.child,this.color,this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      color: color,
      decoration: decoration,
        child: child,
    );
  }
}

//textfield//

class UIhelper{

  static  InputDecoration mDecor({
  required String mLable,
  required String hint,
    bRadious=15,
    bcolor ,
    mwith
  }){
    return InputDecoration(
    label:  Text(mLable),
      hintText: hint,
      border:  OutlineInputBorder(
          borderRadius: BorderRadius.circular(bRadious),
          borderSide: BorderSide(
            color: bcolor,
            width: mwith,
          )
      ),
      enabledBorder:  OutlineInputBorder(
        borderRadius: BorderRadius.circular(bRadious),
        borderSide: BorderSide(
          color: bcolor,
          width: mwith,
        )
      )

    );
  }



}