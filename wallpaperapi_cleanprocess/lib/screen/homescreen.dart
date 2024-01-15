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
import '../models/categorymodel.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  WallpaperDataModel? wallpaperDataModel;
  var search = TextEditingController();
  List<CategoryModel> listCat=[
    CategoryModel(title: "Winter", imgPath: "https://cdn.mos.cms.futurecdn.net/8Zw7hWD5ZaquyftsRbEmof-1200-80.jpg"),
    CategoryModel(title: "Car", imgPath: "https://cdni.autocarindia.com/utils/imageresizer.ashx?n=https://cms.haymarketindia.net/model/uploads/modelimages/Lamborghini-Revuelto-190920231426.jpg&w=872&h=578&q=75&c=1"),
    CategoryModel(title: "Space", imgPath: "https://img.freepik.com/free-photo/glowing-spaceship-orbits-planet-starry-galaxy-generated-by-ai_188544-9655.jpg"),
    CategoryModel(title: "Cartoon", imgPath: "https://staticg.sportskeeda.com/editor/2023/08/3626c-16921875120044-1920.jpg?w=840"),
    CategoryModel(title: "Sea", imgPath: "https://images.nationalgeographic.org/image/upload/v1652341068/EducationHub/photos/ocean-waves.jpg"),
    CategoryModel(title: "Burj Khalifa", imgPath: "https://www.usatoday.com/gcdn/-mm-/0f42e32787c67e840e95e667e4b8fc2d8fc90f80/c=395-0-971-768/local/-/media/2021/03/09/USATODAY/usatsports/imageForEntry25-aa1.jpg"),
    CategoryModel(title: "Nature", imgPath: "https://images.unsplash.com/photo-1618588507085-c79565432917?q=80&w=1000&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8Mnx8YmVhdXRpZnVsJTIwbmF0dXJlfGVufDB8fDB8fHww"),
  ];
  @override
  void initState() {
    BlocProvider.of<WallpaperBloc>(context).add(GetTrendingWall());
    getPhotosCategory("popular-search");
    super.initState();
  }

  getPhotosCategory(String category) async {
    var apiKey = "Rbf7qjXnYNxkIk2DRJKzeCgWpZXZbMRBLQbLDFHFlXniuOQ5k0JXDfyd";
    var uri = Uri.parse("https://api.pexels.com/v1/search?query=$category");
    var response = await http.get(uri, headers: {"Authorization": apiKey});
    if (response.statusCode == 200) {
      var rawdata = jsonDecode(response.body);
      wallpaperDataModel = WallpaperDataModel.fromJson(rawdata);
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
            bestOfMonthTitle(),
            bestOfMonthView(),
            thecolorTitle(),
            theColorTone(context),
            categoryTitle(),
            categoryView()
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

  Widget categoryView() {
    return SingleChildScrollView(
      child: SizedBox(
        height: 300,
        child: GridView.builder(
            itemCount: listCat.length,
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
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) {
                          return CategoryScreen(
                            Category: listCat[index].title,
                          );
                        }));
                  },
                  child: Container(
                    height: 120,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: NetworkImage(
                                "${listCat[index].imgPath}"),
                            fit: BoxFit.cover),
                        borderRadius: BorderRadius.circular(12),
                        color: Colors.green),
                    child: Center(
                      child: Text(
                        listCat[index].title,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              );
            }),
      )
    );
  }

  Widget bestOfMonthView() {
    return BlocBuilder<WallpaperBloc, WallpaperState>(
        builder: (context, state) {
      if (state is WallpaperLoadingState) {
        return Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is WallpaperLoadedState) {
        var wallpaperDataModel = state.mData;
        return SizedBox(
          height: 250,
          child: GridView.builder(
              scrollDirection: Axis.horizontal,
              shrinkWrap: true,
              itemCount: wallpaperDataModel.photos.length,
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
                          imageUrl: wallpaperDataModel
                              .photos[index].src!.portrait
                              .toString(),
                        );
                      }),
                    );
                  },
                  child: SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child: Image.network(
                        '${wallpaperDataModel.photos[index].src!.portrait}',
                        fit: BoxFit.cover,
                      )),
                );
              }),
        );
      }

      return Container();
    });
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
                                  : "",
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
