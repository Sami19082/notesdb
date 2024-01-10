class MainModel {
  String next_page;
  int page;
  int per_page;
  int total_results;
  List<PhotoModel>? photos;

  MainModel({required this.next_page,
    required this.page,
    required this.per_page,
    required this.total_results,
    required this.photos});

  factory MainModel.fromjson(Map<String, dynamic>json){
    List<PhotoModel> listPhoto = [];
    for(Map<String,dynamic> each in json["photos"]){
      listPhoto.add(PhotoModel.fromjson(each));
    }


    return MainModel(
        next_page: json["next_page"],
        page: json["page"],
        per_page: json["per_page"],
        total_results: json["total_results"],
        photos: listPhoto);
  }
}

class PhotoModel {
  String alt;
  String avg_color;
  String photographer;
  String photographer_url;
  String url;
  int id;
  int height;
  bool liked;
  int photographer_id;
  int width;
  SrcModel? src;

  PhotoModel({required this.alt,
    required this.avg_color,
    required this.photographer,
    required this.photographer_url,
    required this.url,
    required this.id,
    required this.height,
    required this.liked,
    required this.photographer_id,
    required this.width,
    required this.src});

  factory PhotoModel.fromjson(Map<String, dynamic> json) {
    return PhotoModel(
        alt: json["alt"],
        avg_color: json["avg_color"],
        photographer: json["photographer"],
        photographer_url: json["photographer_url"],
        url: json["url"],
        id: json["id"],
        height: json["height"],
        liked: json["liked"],
        photographer_id: json["photographer_id"],
        width: json["width"],
        src: SrcModel.fromjson(json["src"]));
  }
}

class SrcModel {
  String landscape;
  String large;
  String large2x;
  String medium;
  String original;
  String portrait;
  String small;
  String tiny;

  SrcModel({required this.landscape,
    required this.large,
    required this.large2x,
    required this.medium,
    required this.original,
    required this.portrait,
    required this.small,
    required this.tiny});

  factory SrcModel.fromjson(Map<String, dynamic> json) {
    return SrcModel(
        landscape: json["landscape"],
        large: json["large"],
        large2x: json["large2x"],
        medium: json["medium"],
        original: json["original"],
        portrait: json["portrait"],
        small: json["small"],
        tiny: json["tiny"]);
  }
}
