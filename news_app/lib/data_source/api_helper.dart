import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:news_app/data_source/app_exceptions.dart';


class ApiHelper {
  Future<dynamic> getApi(String url)async {
    var uri = Uri.parse(url);
    try {
      var response = await http.get(uri);
      return returnDataResponse(response);
    } on SocketException {
    throw FetchDataException(body: "Internet Error");
  }
  }

  dynamic returnDataResponse(http.Response respo) {
    switch (respo.statusCode) {
      case 200 :
        var actRespo = respo.body;
        var mData = jsonDecode(actRespo);
        return mData;
      case 400:
        throw BadRequestException(body: respo.body);
      case 401:
      case 403:
        throw UnauthorisedException(body: respo.body);
      case 500:
        throw FetchDataException(body: "Error While Communication");
    }
  }
}
