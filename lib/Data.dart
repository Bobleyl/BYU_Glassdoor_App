class Data {
  int ItemID;
  String Company = "No Company";
  int Salary = 0;
  int Bonus = 0;
  String Status = "Internship";
  String State = "No Location";
  String Year = "No Year";
  String Major = "No Major";

  Data({
    this.ItemID,
    this.Company,
    this.Salary,
    this.Bonus,
    this.Status,
    this.State,
    this.Year,
    this.Major,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      ItemID: json['ItemID'] as int,
      Company: json['Company'] as String,
      Salary: json['Salary'] as int,
      Bonus: json['Bonus'] as int,
      Status: json['Status'] as String,
      State: json['State'] as String,
      Year: json['Year'] as String,
      Major: json['Major'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'ItemID': this.ItemID,
      'Company': this.Company,
      'Salary': this.Salary,
      'Bonus': this.Bonus,
      'Status': this.Status,
      'State': this.State,
      'Year': this.Year,
      'Major': this.Major,
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