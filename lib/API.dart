import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';
import 'package:byu_glassdoor_app/DataList.dart';
import 'package:byu_glassdoor_app/Data.dart';

Future<DataList> getDataList(String url, String valueOption){
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
    DataList newData = new DataList();
    if(data == null){
      return new DataList();
    }else{
      if(valueOption == null){
        print("Base case");
        return data;
      }else if(valueOption == "Internships"){
        for(Data item in data){
          if(item.Status == "Internship"){
            newData.addShift(item);
          }
        }
        return newData;
      }else if(valueOption == "FullTime Offers"){
        for(Data item in data){
          if(item.Status == "Full-Time"){
            newData.addShift(item);
          }
        }
        return newData;
      }else{
        print("Value Option: " + valueOption);
        return data;
      }
    }
  });
}

Future<String> createData(String url, Data body) async {
  String jsonStr = jsonEncode(body.toJson());
  print(url);
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