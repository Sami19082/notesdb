import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/api_model/popular_api_model.dart';
import 'package:news_app/blocs/newsbloc_bloc.dart';
import 'package:news_app/tabs/popular.dart';
import 'package:news_app/tabs/tech.dart';
import 'package:http/http.dart'as http;
import '../tabs/headlines.dart';
import '../tabs/recent.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.menu,
              color: Colors.white,
            ),
          ),
          title: Text(
            'News.on',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          bottom:TabBar(
              tabs:[
                Tab(
                  child: Center(
                    child: Text("Popular",style: TextStyle(color: Colors.white),),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text( "HeadLine",style: TextStyle(color: Colors.white)),
                  ),
                ),
                Tab(
                  child: Center(
                    child: Text("Recent",style: TextStyle(color: Colors.white)),
                  ),
                ),
                Tab(height: 50,
                  child: Center(
                    child: Text("Tech",style: TextStyle(color: Colors.white)),
                  ),
                ),
              ]),
        ),
        body: TabBarView(
          children: [
            Popular(),
            HeadLines(),
            Recent(),
            Tech(),
          ],
        ),
      ),
    );
  }
}

