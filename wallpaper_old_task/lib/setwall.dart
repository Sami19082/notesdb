import 'package:flutter/material.dart';

class WallPaper extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Set Wallpaper'),
        ),


        body: Stack(
          children: [
            Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/nature/andrzej-suwara-j4glkaOX-ds-unsplash.jpg'),
                    fit: BoxFit.cover
                ),
              ),
            ),


            Align(
              alignment: Alignment.bottomCenter,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Color(0x8cffffff),
                            borderRadius: BorderRadius.circular(10)
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.info_outline,color: Color(
                                0x90ffffff),size: 35,),
                          ],
                        ),
                      ),

                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Color(0x8cffffff),
                            borderRadius: BorderRadius.circular(10)

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.save_alt_outlined,color: Color(
                                0x90ffffff),size: 35,),
                          ],
                        ),
                      ),
                      Container(
                        width: 80,
                        height: 80,
                        decoration: BoxDecoration(
                            color: Colors.blue.shade300,
                            borderRadius: BorderRadius.circular(10)

                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.brush_outlined,color: Color(
                                0x90ffffff),size: 35,),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text('info',style: TextStyle(color: Color(0x98ffffff),fontStyle: FontStyle.italic,fontSize: 20),textAlign: TextAlign.left,),
                      Text('Save',style: TextStyle(color: Color(0x98ffffff),fontStyle: FontStyle.italic,fontSize: 20),),
                      Text('Apply',style: TextStyle(color: Color(0x98ffffff),fontStyle: FontStyle.italic,fontSize: 20),),
                    ],
                  ),
                ],
              ),
            ),

          ],
        )
    );
  }
}
