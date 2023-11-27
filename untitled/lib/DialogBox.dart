import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: Overlays()));
}
class Overlays extends StatefulWidget {
  @override
  State<Overlays> createState() => _OverlaysState();
}

class _OverlaysState extends State<Overlays> {
 bool ischecked = false;
 var listradio = ['male','female','others'];
 String selectedRadio = 'female';
 bool islight = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Overlays'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ElevatedButton(
                onPressed: (){
                  showDialog(
                      barrierDismissible: false,
                      barrierColor: Colors.blueGrey.withOpacity(0.5),
                      context: context, builder: (context){
                    return AlertDialog(
                      title: Text('Delete?'),
                      shadowColor: Colors.cyan,
                      elevation: 12,
                      icon: Icon(Icons.delete),
                      content: Text('Are you sure'),
                      actions: [
                        TextButton(onPressed: (){
                          //delete the item first
                          Navigator.pop(context);
                          }, child: Text('yes')),
                        TextButton(onPressed: (){
                          Navigator.pop(context);
                          }, child: Text('No')),
                      ],
                    );
                  });
                }, child: Text('Alert Box')
            ),
            SizedBox(height: 20,),
            ElevatedButton(
                onPressed: (){
                  showDialog(context: context,
                      builder: (context){
                    return SimpleDialog(
                      contentPadding: EdgeInsets.symmetric(horizontal: 20),
                      title: Text( 'select one'),
                      children: [
                        SimpleDialogOption(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("English"),
                        ),
                        SimpleDialogOption(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("german"),
                        ),
                        SimpleDialogOption(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("French"),
                        ),
                        SimpleDialogOption(
                          onPressed: (){
                            Navigator.pop(context);
                          },
                          child: Text("Bengali"),
                        )
                      ],
                    );
                      });
                }, child: Text('Simple Dailog')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              showDialog(context: context, builder: (context){
                return AboutDialog(
                  applicationVersion: 'v1.01',
                  applicationIcon: Icon(Icons.ice_skating_outlined),
                  applicationLegalese: 'this app is about....',
                );
              });
            }, child: Text('About Dailog')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              showGeneralDialog(
                barrierDismissible: true,
                  barrierLabel: 'true',
                  context: context,
                  pageBuilder: (_,__,___){
                return Center(
                   child: Container(
                     margin: EdgeInsets.symmetric(horizontal: 21),
                     height: 200,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(21),
                       color: Colors.cyan,
                     ),
                     child: Material(
                       color: Colors.transparent,
                       child: Padding(
                         padding: const EdgeInsets.all(20),
                         child: Column(
                           mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                             TextField(),
                             TextField(),
                             Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Row(
                                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                                 children: [
                                   TextButton(onPressed: (){
                                     Navigator.pop(context);
                                   }, child: Text('Add')),
                                   TextButton(onPressed: (){
                                     Navigator.pop(context);
                                   }, child: Text('Cancel'))
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                   ),
                );
                  });
             }, child: Text('Custom Dailog')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async {
              var selectdate = await showDatePicker(context: context,
                  initialDate: DateTime.now(),
                  firstDate: DateTime(2000,9,29),
                  lastDate: DateTime.now()
              ); if(selectdate !=null){
              print('selected date: ${selectdate.day}/ ${selectdate.month}/ ${selectdate.year}');
              }
            }, child: Text('Date Picker')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async {
              var selecttime = await showTimePicker(context: context,
                  initialTime: TimeOfDay.fromDateTime(DateTime.now())
                     );
              if(selecttime !=null){
                print('selected date: ${selecttime.hour}/ ${selecttime.minute}/ ');
              }
            }, child: Text('Time Picker')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async {
              var selectedrange= await showDateRangePicker(context: context,
                  firstDate: DateTime(2000,1,30),
                  lastDate: DateTime.now()
              );
              if(selectedrange != null){
                print('selecteddate: ${selectedrange.start.day}/${selectedrange.end.month}/${selectedrange.end.year}');
              }

             }, child: Text('Date Range picker')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: () async{
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    backgroundColor: Colors.cyanAccent,
                      behavior: SnackBarBehavior.floating,
                      margin: EdgeInsets.all(20),
                      showCloseIcon: true,
                      action: SnackBarAction(
                          label: 'label',
                          backgroundColor: Colors.blueGrey,
                          textColor: Colors.red,
                          onPressed: (){

                          }),
                      content: Row(
                        children: [
                          Icon(Icons.ice_skating_outlined,color: Colors.white,),
                          Text('Welcome'),
                        ],
                      )));
            }, child: Text('snackbar')),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              showModalBottomSheet(context: context,
                  builder: (_){
                return Container(
                  height: 200,
                  width: 200,
                );
                  });
            }, child: Text('bottomsheet')),
            SizedBox(height: 20,),
            Checkbox(
                splashRadius: 20,
                activeColor: Colors.cyanAccent,
                checkColor: Colors.yellow,

                value: ischecked, onChanged: (value){
               ischecked = value!;
               setState((){});
            }),
            CheckboxListTile(
              controlAffinity: ListTileControlAffinity.leading,
              subtitle: Text('yoyoyoyoyoyy'),
              title: Text('remeber me'),
              value: ischecked, onChanged: (value){
              ischecked = value!;
              setState(() {});
            },),
            Checkbox.adaptive(value: ischecked, onChanged: (value){
              ischecked = value!;
              setState(() {

              });

            }),
            RadioListTile(
              controlAffinity: ListTileControlAffinity.leading,
              title: Text("${listradio[0]}"),

                value: listradio[0], groupValue: selectedRadio, onChanged: (value){
              selectedRadio = value!;
              setState(() {

              });

            }),
            RadioListTile(
                title: Text("${listradio[1]}"),

                value: listradio[1], groupValue: selectedRadio, onChanged: (value){
              selectedRadio = value!;
              setState(() {

              });

            }),
            RadioListTile(
                title: Text("${listradio[2]}"),

                value: listradio[2], groupValue: selectedRadio, onChanged: (value){
              selectedRadio = value!;
              setState(() {

              });

            }),
            SwitchListTile(
              activeColor: Colors.amber,
              inactiveThumbColor: Colors.blueGrey,
              thumbColor: MaterialStateProperty.resolveWith((states) {
                print(states);
                if(states.contains(MaterialState.selected)){
                  return Colors.cyan;}
                  return Colors.red;
              }),
              thumbIcon: MaterialStateProperty.resolveWith((states) {
                print(states);
                if(states.contains(MaterialState.selected)){
                return Icon(Icons.light_mode,color: Colors.white,); }
                return Icon(Icons.nightlight) ;
              }),
              title: Text('theme mode'),
                value: islight, onChanged: (value){
              islight = value;
              setState(() {

              });
            })
          ]
        ),
      )
    );
  }
}
