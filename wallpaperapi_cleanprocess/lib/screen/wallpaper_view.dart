
import 'package:flutter/material.dart';
import 'package:gallery_saver/gallery_saver.dart';
import 'package:wallpaper/wallpaper.dart';

class WallpaperView extends StatelessWidget {
  WallpaperView({super.key,  this.imageUrl});

  String? imageUrl;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Image.network(
              imageUrl!,
              fit: BoxFit.cover,
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height: 120,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  stackedButton(btName: 'Info', onTap: () {

                  }, icon: Icons.info),
                  stackedButton(
                      btName: 'Save',
                      onTap: () {
                        saveWall(context);
                      },
                      icon: Icons.save_alt_rounded),
                  stackedButton(
                      btName: 'Apply', onTap: () {
                    applyWall(context);
                  }, icon: Icons.edit),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  void applyWall(BuildContext context) {
    var stream = Wallpaper.imageDownloadProgress(imageUrl!);
    stream.listen((event) {
      print(event);
    }, onDone: () async{
     var check = await Wallpaper.homeScreen(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          options: RequestSizeOptions.RESIZE_FIT);
     ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(check)));
     print(check);
    }, onError: (e) {
      print("Error : $e");
    });
  }

  void saveWall(BuildContext context) {
    GallerySaver.saveImage(imageUrl!).then((value) => print("Wallpaper saved : $value"));
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Wallpaper Saved")));
  }

  Column stackedButton(
      {required String btName,
      required VoidCallback onTap,
      required IconData icon}) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          style: IconButton.styleFrom(
              highlightColor: const Color(0xff3f64f5),
              padding: const EdgeInsets.all(14),
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)),
              backgroundColor: const Color(0xffc3bdb8).withOpacity(0.3)),
          icon: Icon(
            icon,
            color: Colors.white,
            size: 28,
          ),
          onPressed: onTap,
        ),
        const SizedBox(height: 4),
        Text(
          btName,
          style:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10)
      ],
    );
  }
}
