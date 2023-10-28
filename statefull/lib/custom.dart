import 'package:flutter/material.dart';
import 'package:statefull/custom_widget.dart';

void main(){
runApp(MaterialApp(home: myapp(),));

}
class myapp extends StatelessWidget{
  var con = TextEditingController();
@override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(title: Text('custom Widget'),
    ),
    body: Padding(
      padding: const EdgeInsets.all(50),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          mytext(tex: 'hello'),
          Texted(tex: 'love',style: TextStyle(fontWeight: FontWeight.normal,),),

          SizedBox(height: 10),
          Container(
            width: 100,
            height: 100,
            color: Colors.blueAccent,
          ),
          SizedBox(height: 10),
          cont(child: CircleAvatar(
            backgroundColor: Colors.green,
            maxRadius: 30,
          )),
          SizedBox(height: 10),
          cont(decoration:BoxDecoration(
            color: Colors.yellow,
          ),child: Row(children: [],)),
          SizedBox(height: 10),
          SizedBox(
            height: 100,
            width: 200,
            child: TextField(
              decoration: UIhelper.mDecor(mLable: 'yoyo', hint: 'love',bcolor: Colors.red,bRadious: 20,mwith: 5),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 100,
            width: 200,
            child: TextField(
              decoration: UIhelper.mDecor(mLable: 'yoyo', hint: 'love',bcolor: Colors.blue,bRadious: 10,mwith: 10),
            ),
          ),

        ],
      ),
    ),
  );
}
 Widget mytext({required String tex}){
  return Text(tex,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),);
}
}
