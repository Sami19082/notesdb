
import 'package:ecommerce/cartpage.dart';
import 'package:flutter/material.dart';

class Secondpage extends StatefulWidget {
  String tag ;
int index;
 Secondpage({required this.tag, required this.index});

  @override
  State<Secondpage> createState() => _SecondpageState();
}

class _SecondpageState extends State<Secondpage> {

  List<Map<String,dynamic>> grid = [{"image":"Assets/circle/pngwing.com.png"
  //[
  //   {'Shoes': "Assets/circle/pngwing.com.png",},
  //   { 'Shoes': "Assets/Secondpage/pngwing.com (2).png",},
  //   { 'Shoes': "Assets/Secondpage/pngwing.com (1).png"},
  //   { 'Shoes': "Assets/Secondpage/pngwing.com (3).png"},
  // ]
    ,"text": "Shoes",'rate':"105",'star':"4.5",
    'dis': "Discover a world of convenience with our curated selection of must-have items. From powerful smartphones that keep you connected to sleek wireless earbuds offering unparalleled audio freedom, we have the latest in technology. Start your mornings right with our efficient coffee maker, or embark on your fitness journey with a smart tracker that monitors your every move. Travel in style with our durable backpack, designed for both comfort and functionality. Elevate your lifestyle with these essentials, each chosen to enhance your daily experiences."},

    {"image":"Assets/circle/Screenshot 2023-11-18 180933.png","text": "Beauty",'rate':"200",'star':"4.5", 'dis': "Discover a world of convenience with our curated selection of must-have items. From powerful smartphones that keep you connected to sleek wireless earbuds offering unparalleled audio freedom"},

    {"image": "Assets/circle/Screenshot 2023-11-18 181002.png","text": "Women's\nFashion",'rate':"142",'star':"4.5", 'dis': "Discover a world of convenience with our curated selection of must-have items. From powerful smartphones that keep you connected to sleek wireless earbuds offering unparalleled audio freedom"},

    {"image": "Assets/circle/Screenshot 2023-11-18 181042.png","text": "Jewelery",'rate':"325",'star':"4.5" ,'dis': "Discover a world of convenience with our curated selection of must-have items. From powerful smartphones that keep you connected to sleek wireless earbuds offering unparalleled audio freedom"},

    {"image": "Assets/circle/Screenshot 2023-11-18 181109.png","text": "Men's\nFashion",'rate':"121",'star':"4.5", 'dis': "Discover a world of convenience with our curated selection of must-have items. From powerful smartphones that keep you connected to sleek wireless earbuds offering unparalleled audio freedom"},

    {"image": "Assets/circle/Screenshot 2023-11-18 181248.png","text": "Electronics",'rate':"999",'star':"4.5", 'dis': "Discover a world of convenience with our curated selection of must-have items. From powerful smartphones that keep you connected to sleek wireless earbuds offering unparalleled audio freedom"},

    {"image": "Assets/circle/Screenshot 2023-11-18 181303.png","text": "Bags",'rate':"185",'star':"4.5", 'dis': "Discover a world of convenience with our curated selection of must-have items. From powerful smartphones that keep you connected to sleek wireless earbuds offering unparalleled audio freedom"},

    {"image": "Assets/circle/Screenshot 2023-11-18 181229.png","text": "Home",'rate':"199",'star':"4.5", 'dis': "Discover a world of convenience with our curated selection of must-have items. From powerful smartphones that keep you connected to sleek wireless earbuds offering unparalleled audio freedom"},
  ];
  int current = 0;
  int currentColor = 0;
  int currentNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.share),
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            padding: EdgeInsets.all(15),
          ),
          SizedBox(width: 10,),
          IconButton(onPressed: (){

          }, icon: Icon(Icons.favorite_border),
            style: IconButton.styleFrom(backgroundColor: Colors.white),
            padding: EdgeInsets.all(15),
          ),
        ],
      ),
      backgroundColor: Colors.grey.shade200,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(15),
        child: Container(
          height: 65,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(35),
            color: Colors.black
          ),
          padding: EdgeInsets.symmetric(horizontal: 12),
        alignment: Alignment.center,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.black,
                border: Border.all(color: Colors.grey,
                width: 2)
              ),
              child: Row(
                children: [
                  IconButton(onPressed: (){
                    currentNumber ++;
                    setState(() {

                    });
                  },
                      icon: Icon(Icons.add,color: Colors.white,shadows: [Shadow(color: Colors.grey)],)),
                  SizedBox(width: 5,),
                  Text(currentNumber.toString()  ,style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),
                  SizedBox(width: 5,),
                  IconButton(onPressed: (){
                    currentNumber --;
                    setState(() {

                    });
                  },
                      icon: Icon(Icons.remove,color: Colors.white,)),
                ],
              ),
            ),
            Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(60),
                color: Colors.deepOrangeAccent
              ),
              alignment: Alignment.center,
              padding: EdgeInsets.symmetric(horizontal: 35),
              child: TextButton(
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return cartpage();
                  }));
                },
                child: Text(
                  "Add to Cart",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold
                  ),
                ),
              ),
            ),
          ],
        )
        ),
      ) ,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,


      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AnimatedContainer(
                  duration: Duration(seconds: 1),
                  child: Hero(
                    tag: widget.tag,
                    child: SizedBox(
                      height: 300,
                      child: PageView.builder(
                        onPageChanged: (value){
                          setState(() {
                            current = value;
                          });
                        },
                        itemCount: 4,
                          itemBuilder: (context,index){
                            return Image.asset(grid[widget.index]["image"],fit: BoxFit.contain,);
                          }),
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(4, (index) => AnimatedContainer(
                    margin: EdgeInsets.only(right: 3),
                      duration: Duration(milliseconds: 300),
                  width: current == index ? 15: 8,
                  height: 8,
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),
                    border: Border.all(color: Colors.black),
                    color: current == index ? Colors.black : Colors.transparent,)
                  ),
                  )
                ),
                SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                      color: Colors.white
                    ),
                    padding: EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(grid[widget.index]["text"],style: TextStyle(
                          fontSize: 30,
                            letterSpacing: 3,
                          fontWeight: FontWeight.bold
                        ),),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("\$ ${grid[widget.index]["rate"]}",style: TextStyle(
                                    fontSize: 20,
                                    letterSpacing: 1,
                                    fontWeight: FontWeight.w500
                                ),),
                                Row(mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 70,
                                      height: 25,
                                      decoration: BoxDecoration(
                                        color: Colors.deepOrangeAccent,
                                        borderRadius: BorderRadius.circular(15),
                                      ),
                                      padding: EdgeInsets.symmetric(horizontal: 3),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Icon(Icons.star,size: 13,color: Colors.white,),
                                          SizedBox(width: 5,),
                                          Text(grid[widget.index]["star"],style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white,fontSize: 16),)
                                        ],
                                      ),
                                    ),
                                    SizedBox(width: 10),
                                    Text("(320 Reviews)",style: TextStyle(color: Colors.grey.shade600),),
                                  ],
                                )
                              ],
                            ),
                            Spacer(),
                            Text.rich(TextSpan(
                              children: [
                                TextSpan(text: "Seller :"),
                                TextSpan(text: " Tarqul ishak",style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                )),
                              ]
                            )
                            )
                          ],
                        ),
                        SizedBox(height: 10,),
                        Text("Color",style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                        ),
                        SizedBox(height: 10,),
                        Row(
                          children: List.generate(4, (index) => InkWell(
                            onTap: (){
                              setState(() {
                                currentColor = index;
                              });
                            },
                            child: AnimatedContainer(
                              duration: Duration(milliseconds: 300),
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: currentColor == index ? Colors.white.withOpacity(0.5) : Colors.primaries[index],
                                border: currentColor == index ? Border.all(color: Colors.primaries[index]) : null,
                              ),
                              padding: currentColor == index ? EdgeInsets.all(3) :null ,
                              margin: EdgeInsets.only(right: 15),
                              child: Container(
                                width: 25,
                                height: 25,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.primaries[index]
                                ),
                              ),
                            ),
                          ),),
                        ),
                        SizedBox(height: 20,),
                        Container(
                          width: 100,
                          height: 45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(21),
                            color: Colors.orangeAccent,
                          ),
                          alignment: Alignment.center,
                          child: Text(
                            'Description',
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                        ),
                        SizedBox(height: 20,),
                        Text(grid[widget.index]['dis'])
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),)
    );
  }
}
