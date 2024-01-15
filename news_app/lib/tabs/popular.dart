import 'dart:convert';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:news_app/blocs/business_bloc/business_bloc.dart';

import '../blocs/newsbloc_bloc.dart';
import '../data_source/api_helper.dart';

class Popular extends StatefulWidget {
  const Popular({super.key});

  @override
  State<Popular> createState() => _PopularState();
}

class _PopularState extends State<Popular> {
  late ApiHelper apiHelper;

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NewsblocBloc>(context).add(GetNewsEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: BlocBuilder<BusinessBloc, BusinessState>(builder: (context, state) {
        return ListView.builder(itemBuilder: (context, index) {
          if (state is BusinessLoadingState) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (state is BusinessErrorState) {
            return Center(
              child: Text(state.errorMsg),
            );
          } else if (state is BusinessLoadedState) {
            return ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: state.mainModel.articles!.length,
              itemBuilder: (_, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 130,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      color: Colors.white24,
                    ),
                    child: ListTile(
                      title: SizedBox(
                          width: 300,
                          height: 100,
                          child: Center(
                              child: Text(
                            state.mainModel.articles![index].title!,
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold),
                          ))),
                      leading: Container(
                        height: 200,
                        width: 100,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(12),
                            image: DecorationImage(
                                image: NetworkImage(
                                    "${state.mainModel.articles![index].urlToImage}"),
                                fit: BoxFit.cover)),
                      ),
                      subtitle: Text(
                        state.mainModel.articles![index].publishedAt!,
                        style: TextStyle(
                            fontStyle: FontStyle.italic,
                            fontSize: 12,
                            color: Colors.white),
                      ),
                    ),
                  ),
                );
              },
            );
          }
          return Center(
            child: Text(
              "NO DATA FOUND!!!",
              style: TextStyle(color: Colors.white),
            ),
          );
        });
      }),
    );
  }
}
