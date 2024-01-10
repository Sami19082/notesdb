import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as httpClient;
import 'package:wallpaperapi_cleanprocess/screen/wallpaper_view.dart';
import '../models/api_model.dart';
import '../search_bloc/search_bloc.dart';

class SearchScreen extends StatefulWidget {
  String? colorcode;
  String? upComingsearch;

  SearchScreen(
      {super.key, required this.upComingsearch, required this.colorcode});
  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  WallpaperDataModel? searchModel;
  var searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    BlocProvider.of<SearchBloc>(context)
        .add(SearchWall(query: widget.upComingsearch!,colorcode : widget.colorcode ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Photos'),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              mySearchTextField(),
              const SizedBox(height: 20),
              BlocBuilder<SearchBloc, SearchState>(builder: (context, state) {
                if (state is SearchLoadingState) {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (state is SearchErrorState) {
                  return Center(
                    child: Text(state.errorMsg),
                  );
                } else if (state is SearchLoadedState) {
                  searchModel = state.mData;
                  return searchModel!.photos!.isNotEmpty
                      ? searchPhotosGridView()
                      : Center(
                          child: Text("Search Not Found"),
                        );
                }
                return Container(
                  height: 300,
                  color: Colors.blue
                );
              })
            ]),
          ),
        ));
  }

  TextField mySearchTextField() {
    return TextField(
      controller: searchController,
      decoration: InputDecoration(
          suffixIcon: IconButton(
            onPressed: () {
              // getAllSearchResults(search: searchController.text.toString());
              // setState(() {});
              BlocProvider.of<SearchBloc>(context)
                  .add(SearchWall(query: searchController.text.toString(), colorcode: widget.colorcode ?? ""));
            },
            icon: const Icon(
              CupertinoIcons.search,
              color: Colors.grey,
              size: 29,
            ),
          ),
          hintText: 'Find Wallpaper...',
          hintStyle: TextStyle(color: Colors.grey.withOpacity(0.4)),
          filled: true,
          fillColor: const Color(0xffeef3f5),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(18),
              borderSide: BorderSide.none)),
    );
  }

  GridView searchPhotosGridView() {
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: searchModel!.photos!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 10,
          crossAxisSpacing: 10,
          crossAxisCount: 2,
          childAspectRatio: 1.2 / 2),
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(
              builder: (context) {
                return WallpaperView(
                  image: searchModel!.photos![index].src!.portrait.toString(),
                );
              },
            ));
          },
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(
                        '${searchModel!.photos![index].src!.landscape}'),
                    fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(12),
                color: Colors.green),
            height: 120,
          ),
        );
      },
    );
  }
}
