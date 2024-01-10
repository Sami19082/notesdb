import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wallpaperapi_cleanprocess/bloc/wallpaper_bloc.dart';
import 'package:wallpaperapi_cleanprocess/data_source/api_helper.dart';
import 'package:wallpaperapi_cleanprocess/models/api_model.dart';
import 'package:http/http.dart' as http;
import 'package:wallpaperapi_cleanprocess/screen/category_screen.dart';
import 'package:wallpaperapi_cleanprocess/screen/searchscreen.dart';
import 'package:wallpaperapi_cleanprocess/screen/wallpaper_view.dart';
import 'package:wallpaperapi_cleanprocess/search_bloc/search_bloc.dart';
import '../constrain/variables.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WallpaperDataModel? wallpaperDataModel;
  WallpaperDataModel? categoryDataModel;
  var search = TextEditingController();

  @override
  void initState() {
   BlocProvider.of<WallpaperBloc>(context).add(GetTrendingWall());
    getPhotosCategory("popular search");
   super.initState();
  }

  getPhotosCategory(String category) async {
    var apiKey = "Rbf7qjXnYNxkIk2DRJKzeCgWpZXZbMRBLQbLDFHFlXniuOQ5k0JXDfyd";
    var uri = Uri.parse("https://api.pexels.com/v1/search?query=$category");
    var response = await http.get(uri, headers: {"Authorization": apiKey});
    if (response.statusCode == 200) {
      var rawdata = jsonDecode(response.body);
      categoryDataModel = WallpaperDataModel.fromJson(rawdata);
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Wallpapers"),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            homeScreenSearchTextField(context),
            theColorTone(context),
            bestOfMonthTitle(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: bestOfMonthView(),
            ),
            categoryTitle(),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: categoryView(),
            ),
            bestOFMonthGridView()

          ],
        ),
      ),
    );
  }

  Padding homeScreenSearchTextField(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(12),
      child: TextField(
        controller: search,
        decoration: InputDecoration(
            suffixIcon: IconButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) {
                    return BlocProvider(
                      create: (context) => SearchBloc(apiHelper: ApiHelper()),
                      child: SearchScreen(
                        upComingsearch: search.text.toString(),
                        colorcode: null,
                      ),
                    );
                  }));
                },
                icon: Icon(Icons.search)),
            hintText: "Find Wallpaper...",
            helperStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
            filled: true,
            fillColor: Color(0xffeef3f5),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(18),
                borderSide: BorderSide.none)),
      ),
    );
  }
  Padding categoryTitle() {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: Text('Categories',
          style: TextStyle(
              fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold)),
    );
  }

  SingleChildScrollView categoryView(){
    return SingleChildScrollView(
      child: SizedBox(
        height: 400,
        child: GridView.builder(
          itemCount:categoryDataModel!.photos!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              childAspectRatio: 3 / 2,
            ),
            itemBuilder: (context, index) {
              return Padding(
                padding: EdgeInsets.all(8),
                child: InkWell(
                  onTap: () {
                    selectedIndex = index;
                    Navigator.push(context, MaterialPageRoute(builder: (context) {
                      return CategoryScreen(
                        isCategory: true,
                      );
                    }));
                  },
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${categoryDataModel!.photos![index].src!.landscape}"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green),
                    child: Center(
                      child: Text(
                        listCategory[index],
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            }),
      ),
    );
  }

  Widget bestOfMonthView() {
    return BlocBuilder<WallpaperBloc, WallpaperState>(
        builder: (context, state) {
      if (state is WallpaperLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
      else if (state is WallpaperLoadedState) {
       var wallpaperDataModel = state.mData;
        return SizedBox(
          height: 250,
          child: GridView.builder(
            scrollDirection: Axis.horizontal,
                shrinkWrap: true,
              itemCount: wallpaperDataModel.photos!.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                crossAxisCount: 1,
                childAspectRatio: 1.9 / 1.19,
              ),
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return WallpaperView(
                            image: wallpaperDataModel
                                .photos![index].src!.portrait
                                .toString());
                      }),
                    );
                  },
                  child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                      child: Image.network('${wallpaperDataModel.photos![index].src!.portrait}',fit: BoxFit.cover,)),
                );
              }),
        );
      }

        return Container();
      }
    );
  }

  Padding thecolorTitle() {
    return Padding(
      padding: EdgeInsets.all(12),
      child: Text("The Color Tone",
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
    );
  }

  Padding bestOfMonthTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Text(
        "Best of The Month",
        style: TextStyle(
            fontSize: 18, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );
  }

  SingleChildScrollView BestofTheMonth(){
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(10),
        child: GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: wallpaperDataModel!.photos!.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 1.9 / 1.19,
                crossAxisCount: 1),
            itemBuilder: (context, index) {
              return Container(
                decoration: BoxDecoration(
                    color: Colors.green.shade200,
                    image: DecorationImage(
                        image: NetworkImage(
                            '${wallpaperDataModel!.photos![index].src!.portrait}'),
                        fit: BoxFit.cover),
                    borderRadius: BorderRadius.circular(12)),
              );
            }),
      ),
    );
  }

  GridView bestOFMonthGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      scrollDirection: Axis.horizontal,
      itemCount: wallpaperDataModel!.photos!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          childAspectRatio: 1.9 / 1.19,
          crossAxisCount: 1),
      itemBuilder: (context, index) {
        return Container(
          decoration: BoxDecoration(
              color: Colors.green.shade200,
              image: DecorationImage(
                  image: NetworkImage(
                      '${wallpaperDataModel!.photos![index].src!.portrait}'),
                  fit: BoxFit.cover),
              borderRadius: BorderRadius.circular(12)),
        );
      },
    );
  }

  SizedBox theColorTone(BuildContext context) {
    return SizedBox(
        height: 65,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemCount: listColorModel.length,
                itemBuilder: (_, index) {
                  return Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BlocProvider(
                            create: (context) =>
                                SearchBloc(apiHelper: ApiHelper()),
                            child: SearchScreen(
                              upComingsearch: search.text.toString().isNotEmpty
                                  ? search.text.toString()
                                  : "nature",
                              colorcode: listColorModel[index].name,
                            ),
                          );
                        }));
                      },
                      child: Container(
                          width: 65,
                          decoration: BoxDecoration(
                              border:
                                  listColorModel[index].color == Colors.white
                                      ? Border.all(color: Colors.black)
                                      : null,
                              borderRadius: BorderRadius.circular(12),
                              color: listColorModel[index].color)),
                    ),
                  );
                },
              ),
              const SizedBox(
                width: 10,
              )
            ],
          ),
        ));
  }
}
