class Data {
  String ItemID;
  String Company = "No Company";
  String Salary = "0";
  String Bonus = "0";
  String State = "No Location";
  String Year = "No Year";

  Data({
    this.ItemID,
    this.Company,
    this.Salary,
    this.Bonus,
    this.State,
    this.Year,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      ItemID: json['ItemID'] as String,
      Company: json['Company'] as String,
      Salary: json['Salary'] as String,
      Bonus: json['Bonus'] as String,
      State: json['State'] as String,
      Year: json['Year'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ItemID': this.ItemID,
      'Company': this.Company,
      'Salary': this.Salary,
      'Bonus': this.Bonus,
      'State': this.State,
      'Year': this.Year,
    };
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