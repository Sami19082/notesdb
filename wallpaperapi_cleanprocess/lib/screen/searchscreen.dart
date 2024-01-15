import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  List<PhotoModel> listPhotos = [];
  var totalNo = 0;
  int pageNo = 1;
  WallpaperDataModel? searchModel;
  var searchController = TextEditingController();
  ScrollController? scrollController;

  @override
  void initState() {
    super.initState();
    scrollController = ScrollController()
      ..addListener(() {
        print(scrollController!.position.pixels);

        if (scrollController!.position.pixels ==
            scrollController!.position.maxScrollExtent) {
          print("End of Grid!!");
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text('End of Grid!!')));

          if (totalNo > pageNo) {
            pageNo++;
            ///hit api again with updated pageIndex
            BlocProvider.of<SearchBloc>(context).add(SearchWall(
                query: widget.upComingsearch!,
                colorCode: widget.colorcode ?? "",
                page: pageNo));
          }


        }
      });
    BlocProvider.of<SearchBloc>(context).add(SearchWall(
        query: widget.upComingsearch!, colorCode: widget.colorcode ?? ""));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Search Photos'),
        ),
        body: SingleChildScrollView(
          controller: scrollController,
          child: Padding(
            padding: const EdgeInsets.all(12),
            child: Column(children: [
              mySearchTextField(),
              const SizedBox(height: 20),
              BlocListener<SearchBloc, SearchState>(
                listener: (context, state) {
                  if (state is SearchLoadedState) {
                    pageNo = (state.mData.total_results! % 15 == 0
                            ? state.mData.total_results! / 15
                            : (state.mData.total_results! / 15) + 1)
                        .toInt();
                    searchModel = state.mData;
                    listPhotos.addAll(searchModel!.photos);
                    setState(() {});
                  }
                },
                child: listPhotos.isNotEmpty
                    ? searchPhotosGridView()
                    : Center(
                        child: CircularProgressIndicator(),
                      ),
              )
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
              BlocProvider.of<SearchBloc>(context).add(SearchWall(
                query: searchController.text.toString(),
                colorCode: widget.colorcode ?? "",
              ));
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
      physics: NeverScrollableScrollPhysics(),
      itemCount: listPhotos.length,
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
                  imageUrl: listPhotos[index].src!.portrait.toString(),
                );
              },
            ));
          },
          child: Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage('${listPhotos[index].src!.landscape}'),
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
