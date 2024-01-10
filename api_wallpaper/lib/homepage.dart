import 'dart:convert';
import 'package:api_wallpaper/data_model.dart';
import 'package:api_wallpaper/detail_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as httpclient;

import 'color_model.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var search = TextEditingController();
  Future<MainModel?>? mainModel;
  Future<MainModel?>? mTrending;
  List<ColorModel> mColorList = [
    ColorModel(colorValue: Colors.white, colorCode: "FFFFFFFF"),
    ColorModel(colorValue: Colors.red, colorCode: "F44336FF"),
    ColorModel(colorValue: Colors.green, colorCode: "4CAF50FF"),
    ColorModel(colorValue: Colors.yellowAccent, colorCode: "FFFF00FF"),
    ColorModel(colorValue: Colors.black, colorCode: "000000FF"),
    ColorModel(colorValue: Colors.pinkAccent, colorCode: "FF4081FF"),
    ColorModel(colorValue: Colors.purpleAccent, colorCode: "E040FBFF"),
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    mainModel = getSearchWall();
    mTrending = getTrending();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Wallpapers"),
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: SearchUI(),
            ),
            SizedBox(
              height: 70,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: mColorList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: InkWell(
                        onTap: () {
                          mainModel = getSearchWall(
                              query: search.text.toString(),
                              colorCode: mColorList[index].colorCode!);
                          setState(() {

                          });
                        },
                        child: Container(
                          width: 50,
                          height: 50,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(11),
                              border: Border.all(
                                color: Colors.grey,
                              ),
                              color: mColorList[index].colorValue),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 200,
              child: FutureBuilder<MainModel?>(
                future: mTrending,
                builder: (BuildContext context,snapshot){
                  if(snapshot.connectionState == ConnectionState.waiting){
                    return Center(child: CircularProgressIndicator(),);
                  }else{
                    if(snapshot.hasError){
                      return Center(
                        child: Text("Network Error : ${snapshot.error.toString()}"),
                      );
                    }else if(snapshot.hasData){
                      var data = snapshot.data!;
                      return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: data.photos!.length,
                          itemBuilder: (context,index){
                          var eachphoto = data.photos![index].src!.portrait;
                        return InkWell(
                          onTap: (){
                            navigator(eachphoto);
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(3),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(11),
                              child: Hero(
                                tag: "$index",
                                  child: Image.network(eachphoto,fit: BoxFit.fill,)),
                            ),
                          ),
                        );
                      });
                    }
                  }
                  return Container();
                },
              ),
            ),
            FutureBuilder<MainModel?>(
                future: mainModel,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  } else {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text(
                            "Network Error:${snapshot.error.toString()}"),
                      );
                    } else if (snapshot.hasData) {
                      return Expanded(
                        flex: 1,
                        child: snapshot.data != null &&
                                snapshot.data!.photos!.isNotEmpty
                            ? Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: GridView.builder(
                                  itemCount: snapshot.data!.photos!.length,
                                  itemBuilder: (context, index) {
                                    var eachPhotos =
                                        snapshot.data!.photos![index].src!.portrait;
                                    return InkWell(
                                      onTap: (){
                                        navigator(eachPhotos);
                                      },
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(11),
                                          child: Hero(
                                            tag: "$index",
                                            child: Image.network(
                                                eachPhotos,fit: BoxFit.fill,),
                                          )),
                                    );
                                  },
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                          crossAxisCount: 2,
                                          mainAxisSpacing: 11,
                                          crossAxisSpacing: 11,
                                          childAspectRatio: 10 / 15),
                                ),
                              )
                            : Container(
                                child: Center(
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: [
                                      Center(
                                          child: CircularProgressIndicator()),
                                      Text(
                                        "Loading...",
                                        style: TextStyle(
                                            fontSize: 25,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                      );
                    }
                  }
                  return Container();
                })
          ],
        ));
  }

  void navigator(String url){
   Navigator.push(context as BuildContext, MaterialPageRoute(builder: (context){
     return WallpaperDetails(wallUri: url);
   }));
  }

  Widget SearchUI() {
    return Row(
      children: [
        Expanded(
          flex: 1,
            child: TextField(
          controller: search,
          decoration: InputDecoration(
              hintText: "Search Wallpaper",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(11),
              )),
        )),
        IconButton(
            onPressed: () {
              search.text.isNotEmpty
                  ? mainModel = getSearchWall(query: search.text.toString())
                  : null;
              setState(() {});
            },
            icon: Icon(Icons.search))
      ],
    );
  }

  Future<MainModel?> getSearchWall(
      {String query = "nature", String colorCode = ""}) async {
    var mApiKey = "Rbf7qjXnYNxkIk2DRJKzeCgWpZXZbMRBLQbLDFHFlXniuOQ5k0JXDfyd";
    var uri = Uri.parse(
        'https://api.pexels.com/v1/search?query=$query&color=$colorCode');
    var response =
        await httpclient.get(uri, headers: {"Authorization": mApiKey});
    if (response.statusCode == 200) {
      var rawdata = jsonDecode(response.body);
      var Mdata = MainModel.fromjson(rawdata);
      return Mdata;
    }
    return null;
  }
}
Future<MainModel?> getTrending(
    {String query = "nature", String colorCode = ""}) async {
  var mApiKey = "Rbf7qjXnYNxkIk2DRJKzeCgWpZXZbMRBLQbLDFHFlXniuOQ5k0JXDfyd";
  var uri = Uri.parse(
      'https://api.pexels.com/v1/curated');
  var response =
  await httpclient.get(uri, headers: {"Authorization": mApiKey});
  if (response.statusCode == 200) {
    var rawdata = jsonDecode(response.body);
    var Mdata = MainModel.fromjson(rawdata);
    return Mdata;
  }
  return null;
}
