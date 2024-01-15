class MainModel {
  String? status;
  int? totalResults;
  List<MapModel>? articles;

  MainModel(
      {required this.status, required this.totalResults, required this.articles});

  factory MainModel.fromjson(Map<String, dynamic>json){
    List<MapModel> listArticals = [];

    for(Map<String,dynamic> each in json["articles"]){
      listArticals.add(MapModel.fromjson(each));
    };

    return MainModel(status: json["status"],
        totalResults: json["totalResults"],
        articles: listArticals);
  }
}


class MapModel {
  String? author;
  String? content;
  String? description;
  String? publishedAt;
  String? title;
  String? url;
  String? urlToImage;
  PopularSrc? source;

  MapModel({required this.author,
    required this.content,
    required this.description,
    required this.publishedAt,
    required this.title,
    required this.url,
    required this.urlToImage,
    required this.source});

  factory MapModel.fromjson(Map<String, dynamic> json) {
    return MapModel(
        author: json["author"],
        content: json["content"],
        description: json["description"],
        publishedAt: json["publishedAt"],
        title: json["title"],
        url: json["url"],
        urlToImage: json["urlToImage"],
        source: PopularSrc.fromjson(json["source"]));
  }
}

class PopularSrc {
  String? name;
  String? id;

  PopularSrc({required this.name, this.id});

  factory PopularSrc.fromjson(Map<String, dynamic> json) {
    return PopularSrc(name: json["name"],id: json["id"]);
  }
}
