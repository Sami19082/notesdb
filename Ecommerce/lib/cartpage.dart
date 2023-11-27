import 'package:ecommerce/orderpage.dart';
import 'package:ecommerce/payment.dart';
import 'package:flutter/material.dart';

class cartpage extends StatelessWidget {
  List<Map<String,dynamic>> cart = [{"image": "Assets/circle/pngwing.com.png","text": "Shoes",'rate':"125",'title':'Mens Fashion'},
    {"image": "Assets/circle/Screenshot 2023-11-18 180933.png","text": "Beauty",'rate':"85",'title':'Skin Collection'},
    {"image": "Assets/circle/Screenshot 2023-11-18 181002.png","text": "Women's\nFashion",'rate':"199",'title':"Women's Fashion"},
    {"image": "Assets/circle/Screenshot 2023-11-18 180933.png","text": "Beauty",'rate':"85",'title':'Skin Collection'},
    {"image": "Assets/circle/Screenshot 2023-11-18 181002.png","text": "Women's\nFashion",'rate':"199",'title':"Women's Fashion"},  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:
      Text('My Cart'),),
      backgroundColor: Colors.grey.shade200,

      bottomSheet: Container(
        height: 220,
        decoration:BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight:Radius.circular(30)),
        ) ,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: SingleChildScrollView(
            child: Column(
              children: [
                TextField(
                  decoration: InputDecoration(
                    hintText: "Enter Discount Code",
                    hintStyle: TextStyle(color: Colors.grey.shade400),
                    suffixIcon: TextButton(
                      onPressed: (){},
                      child: Text("Apply",style: TextStyle(fontWeight: FontWeight.w500,color: Colors.deepOrangeAccent,fontSize: 22),),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30)
                    )
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Subtotal",style: TextStyle(color: Colors.grey.shade500,fontSize: 18),),
                      Text("\$ ${235.00}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
                Container(
                  width: 500,
                  height: 1,
                  color: Colors.grey,
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Total",style: TextStyle(color: Colors.grey.shade500,fontSize: 18),),
                      Text("\$ ${235.00}",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
                    ],
                  ),
                ),
               ElevatedButton(
                 style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.deepOrangeAccent),
                   fixedSize: MaterialStatePropertyAll(Size(150, 30)),
                     foregroundColor: MaterialStatePropertyAll(Colors.black),),
                   onPressed: (){
                   Navigator.push(context, MaterialPageRoute(builder: (context){
                     return paymentpage();
                   }));

               }, child: Text('Buy',style: TextStyle(fontSize: 20),))
              ],
            ),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: 5,
    itemBuilder: (context,index){
      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          margin: EdgeInsets.symmetric(horizontal: 10),
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            color: Colors.white
          ),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  height: 130,
                  width: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.grey.shade100
                  ),
                  child: Image.asset(cart[index]["image"]),
                ),
              ),
              SizedBox(width: 15,),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(cart[index]['text'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                  Text("Men Fashion",style: TextStyle(fontSize: 15,color: Colors.grey.shade600),),
                  Text("\$ ${cart[index]['rate']}",style: TextStyle(fontWeight: FontWeight.bold),)
                ],
              ),
             Spacer(),
             Column(
               mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.end,
               children: [
                 Padding(
                   padding: const EdgeInsets.symmetric(horizontal: 8.0,vertical: 8),
                   child: Align(
                     alignment: Alignment.topRight,
                     child: Icon(Icons.delete,color: Colors.orangeAccent,),
                   ),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(8.0),
                   child: Container(
                     width: 100,
                     height: 45,
                     decoration: BoxDecoration(
                       borderRadius: BorderRadius.circular(30),
                       color: Colors.grey.shade100
                     ),
                     child: Padding(
                       padding: const EdgeInsets.symmetric(horizontal: 8.0),
                       child: Row(
                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                         children: [
                           Icon(Icons.remove),

                           Text("1"),

                           Icon(Icons.add)
                         ],
                       ),
                     ),
                   ),
                 )
               ],
             )
            ],
          ),
        ),
      );
    }));
  }
}
