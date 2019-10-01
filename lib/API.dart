import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:byu_glassdoor_app/DataList.dart';
import 'package:byu_glassdoor_app/Data.dart';

Future<DataList> getDataList(String url){
  print(url);
  return http.get(url, headers: { "Content-Type" : "application/json", "charset": "utf-8" }).then((http.Response response) {
    final int statusCode = response.statusCode;
    print(statusCode);
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    var temp = json.decode(response.body);
    var data;
    try{
      data = DataList.fromJson(temp);
    } catch(e){
      print(e);
    }
    if(data == null){
      return new DataList();
    }else{
      return data;
    }
  });
}

Future<String> createData(String url, Data body) async {
  String jsonStr = jsonEncode(body.toJson());
  print("String to send: ");
  print(jsonStr);
  return http.post(url, body: jsonStr, headers: { "Content-Type" : "application/json", "charset": "utf-8" }).then((http.Response response) {
    final int statusCode = response.statusCode;
    print(response);
    print(statusCode);
    if(statusCode == 200){
      return "Success";
    }
    if(statusCode == 400){
      return null;
    }
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return "Success";
  });
}

Future<String> deleteData(String url){
  return http.delete(url, headers: { "Content-Type" : "application/json", "charset": "utf-8" }).then((http.Response response) {
    final int statusCode = response.statusCode;
    print(statusCode);
    if (statusCode < 200 || statusCode > 400 || json == null) {
      throw new Exception("Error while fetching data");
    }
    return "Success";
  });
}