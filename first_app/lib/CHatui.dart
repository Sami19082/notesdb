
class mychat extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade300,
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10),
                child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.arrow_back_rounded),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: CircleAvatar(
                        maxRadius: 30,
                        backgroundImage: AssetImage('assets/icons/img.png'),
                      ),
                    ),
                    SizedBox(width: 10),
                    Padding(
                      padding: const EdgeInsets.only(right: 150),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Zaire Dorwart',style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          Text('Online'),
                        ],
                      ),
                    ),
                    Icon(Icons.video_call,size: 40,),
                    SizedBox(width: 15),
                    Icon(Icons.call,size: 35,),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 2,),
          Expanded(
            flex: 10,
            child: Container(
              height: 800,
              width: double.infinity,
              color: Colors.white70,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SizedBox(height: 10,),
                    Center(child: Text('Today')),
                    SizedBox(height: 15,),
                    Padding(
                      padding: const EdgeInsets.only(right: 120),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 45,
                            width: 80,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              color: Colors.grey.shade300
                            ),
                              child: Center(child: Text("Hi, Asal",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),))),
                          SizedBox(height: 5,),
                          Container(
                              height: 45,
                              width: 250,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.shade300
                              ),
                              child: Center(child: Text("How do you but 'nice' stuff?",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),))),
                          SizedBox(height: 5,),
                          Container(
                              height: 90,
                              width: 350,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.grey.shade300
                              ),
                              child: Center(child: Text("Please help me find a good monitor for\nthe design",style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),))),

                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            height: 120,
                            width: 220,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.yellow.shade200
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 2,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 15,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Zaire Dorwart',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),textAlign: TextAlign.start,),
                                            Text('What should i call u?',textAlign: TextAlign.end,),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('Hi, Asal',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                                  )

                                ],
                              ),
                            )),



                      ],
                    ),
                    SizedBox(height: 15,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Container(
                            height: 180,
                            width: 350,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: Colors.yellow.shade200
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 45,
                                          width: 2,
                                          color: Colors.black,
                                        ),
                                        SizedBox(width: 15,),
                                        Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text('Zaire Dorwart',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),textAlign: TextAlign.start,),
                                            Text('Please help me find a good monitor for the...',textAlign: TextAlign.end,),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text('I usually buy directly to the shop to\nreduce the risk of damaged travel,\nand prevent any damage',style: TextStyle(fontWeight: FontWeight.w600,fontSize: 18),),
                                  )

                                ],
                              ),
                            )),



                      ],
                    ),
                    SizedBox(height: 130,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 30,
                            width: 70,
                            decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.grey.shade300
                            ),
                            child: Center(
                              child:Icon(Icons.more_horiz_rounded,size: 30,),
                            ),

                          ),
                        ],
                      )
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 2,),
          Expanded(
            flex: 1,
            child: Container(
              height: 100,
              width: double.infinity,
              color: Colors.white70,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(Icons.add,size: 30,),
                  SizedBox(
                    height: 50,
                    width: 400,
                    child: TextField(
                      decoration: InputDecoration(
                        hintText: 'New Chat',
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.grey,
                            width: 2
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30),
                          borderSide: BorderSide(
                            color: Colors.black,
                            width: 2
                          ),
                        )
                      ),
                    ),
                  ),
                  Icon(Icons.mic,size:30,)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}