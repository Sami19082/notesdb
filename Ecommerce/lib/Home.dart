import 'package:ecommerce/Routes.dart';
import 'package:ecommerce/Secondpahge.dart';
import 'package:ecommerce/cartpage.dart';
import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  @override
  State<Homepage> createState() => HomepageState();
}

class HomepageState extends State<Homepage> {
  List<Map<String,dynamic>> page = [ {"image": 'Assets/images/Screenshot 2023-11-18 165746.png'},
    {"image":'Assets/images/Screenshot 2023-11-18 170014.png'},
    {"image": 'Assets/images/Screenshot 2023-11-18 165935.png'},
    {"image": 'Assets/images/Screenshot 2023-11-18 165746.png'},
  ];
  List<Map<String,dynamic>> circle = [{"image": "Assets/circle/pngwing.com.png","text": "Shoes"},
    {"image": "Assets/circle/Screenshot 2023-11-18 180933.png","text": "Beauty"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181002.png","text": "Women's\nFashion"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181042.png","text": "Jewelery"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181109.png","text": "Men's\nFashion"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181248.png","text": "Electronics"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181303.png","text": "Bags"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181229.png","text": "Home"},
  ];
  List<Map<String,dynamic>> grid = [{"image": "Assets/circle/pngwing.com.png","text": "Shoes",'rate':"102"},
    {"image": "Assets/circle/Screenshot 2023-11-18 180933.png","text": "Beauty",'rate':"105"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181002.png","text": "Women's\nFashion",'rate':"115"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181042.png","text": "Jewelery",'rate':"102"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181109.png","text": "Men's\nFashion",'rate':"55"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181248.png","text": "Electronics",'rate':"999"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181303.png","text": "Bags",'rate':"215"},
    {"image": "Assets/circle/Screenshot 2023-11-18 181229.png","text": "Home",'rate':"200"},
  ];
int currentSlide = 0;
int currenttab = 2;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ekart'),
        leading: Icon(Icons.shopify,size: 35,),
        actions: [Padding(
          padding: const EdgeInsets.only(right: 11),
          child: Icon(Icons.notification_add),
        ),

        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
          setState(() {
            currenttab == 2;
          });
        },
        child: Icon(Icons.home),
        shape: CircleBorder(),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal:10),
              child: SizedBox(
                height: 70,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: "Search",
                     suffix: Container(width: 1,height: 10,color: Colors.grey,),
                      suffixStyle: TextStyle(fontSize: 25),
                      suffixIcon: Icon(Icons.filter_alt),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(22),
                    )
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Stack(
                children: [
                  SizedBox(
                    height: 300,
                    child: PageView.builder(
                        onPageChanged: (value){
                          setState(() {
                            currentSlide = value;
                          });
                        },
                        scrollDirection: Axis.horizontal,
                        itemCount: page.length,
                        itemBuilder: (context,index){
                      return
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                        width: 250,
                        height: 300,
                        decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(21),
                        image: DecorationImage(
                        image: AssetImage(page[index]["image"]),
                        fit: BoxFit.cover
                        )
                        )),
                      );
                    }),
                  ),
                  Positioned.fill(
                    bottom: 10,
                      child: Align(
                        alignment: Alignment.bottomCenter,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(4, (index) => AnimatedContainer(
                              duration: Duration(microseconds: 300),
                          width: currentSlide == index ? 10: 8,
                            height: 8,
                            margin: EdgeInsets.only(right: 3),
                            decoration: BoxDecoration(
                              color:  currentSlide == index ? Colors.black : Colors.transparent,
                              shape: BoxShape.circle,
                              border: Border.all(color: Colors.black)
                            ),
                          )),
                        ),
                      ))
                ],
              ),
            ),
            SizedBox(height: 10,),
            SizedBox(
              height: 130,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                  itemCount: circle.length,
                  itemBuilder: (context,index){
                    return Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal:10),
                            child: CircleAvatar(
                              maxRadius: 35,
                              backgroundImage: AssetImage(circle[index]["image"]),
                            ),
                          ),
                          Text(circle[index]["text"])
                        ],
                      ),
                    );
                  }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Special for you",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25),),
                  Text("See all",style: TextStyle(color: Colors.grey),)
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SizedBox(
                height: 370,
                child: GridView.builder(
                    itemCount: grid.length ,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10
                    ),
                    itemBuilder: (context,index){
                      return Stack(
                          children: [
                          InkWell(onTap: (){
                            Navigator.push(context,MaterialPageRoute(builder: (context){
                              return Secondpage(tag: '$index',index: index,);
                            }));
                          },
                            child: Align(
                              alignment: Alignment.center,
                              child: Container(
                                width: 300,
                                height: 300,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade200,
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Hero( tag: '$index',child: Image.asset(grid[index]["image"],width: 100,height: 95,fit: BoxFit.fill,)),
                                    Text(grid[index]['text'],style: TextStyle(fontWeight: FontWeight.bold,fontSize: 20),),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Text("\$${grid[index]["rate"]}",style: TextStyle(fontWeight: FontWeight.bold),),
                                        SizedBox(width: 10,),
                            
                                        Row(
                                          children:List.generate(grid[index].length, (index) => Container(
                                            margin: EdgeInsets.only(right: 3,left: 3),
                                            height: 10,
                                            width: 10,
                                            decoration: BoxDecoration(
                                              color: Colors.primaries[index],
                                              shape: BoxShape.circle
                                            ),
                                          )),
                                        ),
                            
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                            Positioned.fill(
                              right: 2,
                                top: 2,
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    height: 30,
                                    width: 32,
                                    decoration: BoxDecoration(
                                      color: Colors.deepOrangeAccent,
                                      borderRadius: BorderRadius.only(
                                        topRight:Radius.circular(25),
                                        bottomLeft: Radius.circular(10),
                                      ),
                                    ),
                                    child: Center(child: Icon(Icons.favorite_border,size: 25,)),
                                  ),
                                ))
                          ],
                        );
                    }),
              ),
            )
          ],
        ),
      ),


      bottomNavigationBar: Container(
        height: 50,
        color: Colors.grey.shade300,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(onPressed: (){
              setState(() {
                currenttab ==0;
              });
            }, icon: Icon(Icons.widgets_outlined,size: 30,color: currenttab == 0 ? Colors.deepOrangeAccent : Colors.grey,)),
            IconButton(onPressed: (){
              setState(() {
                currenttab ==1;
              });
            }, icon: Icon(Icons.favorite_border,size: 30,color: currenttab == 1 ? Colors.deepOrangeAccent : Colors.grey,)),
            SizedBox(width: 20,),
            IconButton(onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context){
                return cartpage();
              }));
              setState(() {

                currenttab ==3;
              });
            }, icon: Icon(Icons.shopping_bag,size: 30),color: currenttab == 3 ? Colors.deepOrangeAccent : Colors.grey,),
            IconButton(onPressed: (){

              setState(() {
                currenttab ==4;
              });
            }, icon: Icon(Icons.person,size: 30),color: currenttab == 4 ? Colors.deepOrangeAccent : Colors.grey,),
          ],
        ),
      ),
    );
  }
}
