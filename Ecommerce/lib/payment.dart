import 'package:ecommerce/orderpage.dart';
import 'package:flutter/material.dart';

class paymentpage extends StatefulWidget {
  const paymentpage({super.key});

  @override
  State<paymentpage> createState() => _paymentpageState();
}

class _paymentpageState extends State<paymentpage> {
  var a1 = TextEditingController();
  var a2 = TextEditingController();
  var a3 = TextEditingController();
  var a4 = TextEditingController();
  var a5 = TextEditingController();
  var a6 = TextEditingController();
  var a7 = TextEditingController();
  var a8 = TextEditingController();
  var a9 = TextEditingController();
  var a10 = TextEditingController();
  var a11 = TextEditingController();
  var a12 = TextEditingController();
 bool ischecked = false;
 String selected = "Debit Card";
 var Listradio = [
   'Debit Card', "Credit Card", "Cash On Delivery"
 ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Payment Page'),
        leading: Icon(Icons.payment_outlined),
      ),
      backgroundColor: Colors.grey.shade200,
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: SingleChildScrollView(
          child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Column(
          
                    children: [
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("BILLING INFORMATION",style: TextStyle(color: Colors.grey.shade500),),
                        ],
                      ),
                      Container(width: 500,height: 1,color: Colors.grey,),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("First Name"),
                              SizedBox(
                                height: 50,
                                width: 170,
                                child: TextField(
                                  controller: a1,
                                  decoration: InputDecoration(
                                    hintText: "Ex: Rahul",
                                    hintStyle: TextStyle(color: Colors.grey.shade500),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(
                                      color: Colors.grey.shade500,
                                    ),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Last Name"),
                              SizedBox(
                                height: 50,
                                width: 170,
                                child: TextField(
                                  controller: a2,
                                  decoration: InputDecoration(
                                    hintText: "Ex: Sharma",
                                    hintStyle: TextStyle(color: Colors.grey.shade500),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                      ),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Company Name"),
                              SizedBox(
                                height: 50,
                                width: 170,
                                child: TextField(
                                  controller: a3,
                                  decoration: InputDecoration(
                                    hintText: "Ex: TCS",
                                    hintStyle: TextStyle(color: Colors.grey.shade500),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                      ),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Phone"),
                              SizedBox(
                                height: 50,
                                width: 170,
                                child: TextField(
                                  controller: a4,
                                  decoration: InputDecoration(
                                    hintText: "Ex: +99 9589569582",
                                    hintStyle: TextStyle(color: Colors.grey.shade500),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                      ),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Address"),
                          SizedBox(
                            height: 50,
                            width: 500,
                            child: TextField(
                              controller: a5,
                              decoration: InputDecoration(
                                hintText: "Ex: 12 Avenue lorem",
                                hintStyle: TextStyle(color: Colors.grey.shade500),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),),
                              ),
                            ),
                          ),
          
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("City"),
                              SizedBox(
                                height: 50,
                                width: 170,
                                child: TextField(
                                  controller: a6,
                                  decoration: InputDecoration(
                                    hintText: "Ex: Delhi",
                                    hintStyle: TextStyle(color: Colors.grey.shade500),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                      ),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Zip code"),
                              SizedBox(
                                height: 50,
                                width: 170,
                                child: TextField(
                                  controller: a7,
                                  decoration: InputDecoration(
                                    hintText: "Ex: 700152",
                                    hintStyle: TextStyle(color: Colors.grey.shade500),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                      ),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Country"),
                              SizedBox(
                                height: 50,
                                width: 170,
                                child: TextField(
                                  controller: a8,
                                  decoration: InputDecoration(
                                    hintText: "Ex: India",
                                    hintStyle: TextStyle(color: Colors.grey.shade500),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                      ),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Spacer(),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("VAT Number"),
                              SizedBox(
                                height: 50,
                                width: 170,
                                child: TextField(
                                  controller: a9,
                                  decoration: InputDecoration(
                                    hintText: "Ex: 94501",
                                    hintStyle: TextStyle(color: Colors.grey.shade500),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.grey.shade500,
                                      ),),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(
                                        color: Colors.black,
                                      ),),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("PAYMENT DETAILS",style: TextStyle(color: Colors.grey.shade500),),
                        ],
                      ),
                      Container(width: 500,height: 1,color: Colors.grey,),
                      Row(
                        children: [
                          Row(
                            children: [
                              Radio(value: Listradio[0],
                                  groupValue: selected,
                                  onChanged: (value){
                                setState(() {
                                  selected = value!;
                                });
                                  }),
                              Text("Debit Card")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(value: Listradio[1],
                                  groupValue: selected,
                                  onChanged: (value){
                                    setState(() {
                                      selected = value!;
                                    });
                                  }),
                              Text("Credit Card")
                            ],
                          ),
                          Row(
                            children: [
                              Radio(value: Listradio[2],
                                  groupValue: selected,
                                  onChanged: (value){
                                    setState(() {
                                      selected = value!;
                                    });
                                  }),
                              Text("COD")
                            ],
                          ),
                        ],
                      )



                      ,SizedBox(height: 10,),
                      SizedBox(
                        height: 50,
                        child: TextField(
                          controller: a10,
                          decoration: InputDecoration(
                            labelText: 'Card number',
                            prefixIcon: Icon(Icons.payment_outlined),
                            enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.grey.shade500,
                              ),),
                            focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(
                                color: Colors.black,
                              ),),
                          ),
                        ),
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("CVC")
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 70,
                            child: TextField(
                              controller: a11,
                              decoration: InputDecoration(
                                hintText: "xxx",
                                hintStyle: TextStyle(color: Colors.grey.shade500),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("MM/YY")
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 50,
                            width: 110,
                            child: TextField(
                              controller: a12,
                              decoration: InputDecoration(
                                hintText: "xx/xx",
                                hintStyle: TextStyle(color: Colors.grey.shade500),
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.grey.shade500,
                                  ),),
                                focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(
                                    color: Colors.black,
                                  ),),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Checkbox(
                            splashRadius: 30,
                              activeColor: Colors.blue,
                              value: ischecked, onChanged: (value){
                            ischecked = value!;
                            setState(() {
                              ischecked = value;

                            });
                          }),
                          Text("Remember me",style: TextStyle( color : ischecked == true ? Colors.grey.shade600 :  Colors.grey),)
                        ],
                      ),
                      SizedBox(height: 10,),
                      ElevatedButton(
                        style: ButtonStyle(backgroundColor: MaterialStatePropertyAll(Colors.blue),
                        fixedSize: MaterialStatePropertyAll(Size(320, 20)),
                        foregroundColor: MaterialStatePropertyAll(Colors.white),
                        shape: MaterialStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadiusDirectional.circular(5)
                        )
                        )
                        ),onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return orders();
                          }));
                       }, child: Text("Purchase now"))
                    ],
                  ),
                )
              ),
              Center(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Need help?"),
                    TextButton(
                      style: ButtonStyle(foregroundColor: MaterialStatePropertyAll(Colors.blue)),
                        onPressed: (){
                      
                    }, child: Text("Contact Us"))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
