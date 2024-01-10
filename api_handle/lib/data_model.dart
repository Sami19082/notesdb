import 'dart:convert';

class DataModel {
  int limit;
  int skip;
  int total;
  List<QuoteModel> quotes;

  DataModel({required this.limit,
    required this.skip,
    required this.total,
    required this.quotes});

  factory DataModel.fromJson(Map<String, dynamic>json){
    List<QuoteModel>listQuote = [];
    for(Map<String,dynamic> eachMap in json["quotes"]){
      var eachQuote = QuoteModel.fromJson(eachMap);
      listQuote.add(eachQuote);
    }


    return DataModel(
        limit: json["limit"],
        skip: json["skip"],
        total: json["total"],
        quotes: listQuote);
  }
}

class QuoteModel {
  String author;
  String quote;
  int id;

  QuoteModel({required this.author, required this.quote, required this.id});

  factory QuoteModel.fromJson(Map<String, dynamic> Json) {
    return QuoteModel(
        author: Json["author"],
        quote: Json["quote"],
        id: Json["id"]);
  }
}
