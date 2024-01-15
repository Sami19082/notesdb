import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart'as http;
import 'package:wallpaperapi_cleanprocess/data_source/urls.dart';
import 'app_exception.dart';

class ApiHelper{
  Future<dynamic> getAPI(String url,{Map<String,String>? headers})async{
    var uri = Uri.parse(url);
    try{
      var response = await http.get(uri,headers: headers ?? {"Authorization":Urls.API_KEY});
      return returnDataResponse(response);
    }on SocketException{
      throw FetchDataException(body: "Internet Error");
    }
  }
  dynamic returnDataResponse(http.Response resp){
    switch(resp.statusCode){
      case 200:
        var actRes = resp.body;
        var mData = jsonDecode(actRes);
        return mData;
      case 400:
        throw BadRequestException(body: resp.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(body: resp.body.toString());
      case 500:
      default:
        throw FetchDataException(
            body: 'Error occurred while Communication with Server with StatusCode : ${resp.statusCode}');

    }
  }
}
