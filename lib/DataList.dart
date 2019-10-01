import 'package:byu_glassdoor_app/Data.dart';

class DataList {
  List<Data> dataItem;
  DataList({
    this.dataItem,
  });

  addShift(Data data){
    if(dataItem == null){
      dataItem = [data];
    }else{
      dataItem.add(data);
    }
  }

  factory DataList.fromJson(Map<String, dynamic> json) {
    return DataList(
      dataItem: _toObjectList(json['Data'], (e) => Data.fromJson(e)),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'Data': _fromList(dataItem, (e) => e.toJson()),
    };
  }

  String toString() {
    String toReturn = "";
    for (Data s in dataItem) {
      if (s != null) toReturn += s.toString() + "\n";
    }
    return toReturn;
  }

}

List _fromList(data, Function(dynamic) toJson) {
  if (data == null) {
    return null;
  }
  var result = [];
  for (var element in data) {
    var value;
    if (element != null) {
      value = toJson(element);
    }
    result.add(value);
  }
  return result;
}

List<T> _toObjectList<T>(data, T Function(Map<String, dynamic>) fromJson) {
  if (data == null) {
    return null;
  }
  var result = <T>[];
  for (var element in data) {
    T value;
    if (element != null) {
      value = fromJson(element as Map<String, dynamic>);
    }
    result.add(value);
  }
  return result;
}

