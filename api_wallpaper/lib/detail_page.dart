import 'package:flutter/material.dart';

class WallpaperDetails extends StatelessWidget {
  String wallUri;
  // String tag;
   WallpaperDetails({required this.wallUri});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Set Wallpaper"),
      ),
      body:  SizedBox(
        width: double.infinity,
          height: double.infinity,
          child: Hero(
            tag: "tag",
              child: Image.network(wallUri,fit: BoxFit.cover,))),
    );
  }
}
