import 'package:flutter/material.dart';
import 'package:byu_glassdoor_app/API.dart';
import 'package:byu_glassdoor_app/Data.dart';
import 'package:random_string/random_string.dart';
import 'package:byu_glassdoor_app/Alerts.dart';
//import 'package:flutter_masked_text/flutter_masked_text.dart';

class Submit extends StatefulWidget {
  Submit();
  @override
  SubmitState createState() => SubmitState();
}

class SubmitState extends State<Submit> {
  SubmitState();

  var URL = "https://8j06torsic.execute-api.us-east-1.amazonaws.com/dev/glass";
  final number = ['1','2','3','4','5','6','7','8','9','0'];
  String previous = "";

  var companyNameController = new TextEditingController();
  var salaryController = new TextEditingController();
  var majorController = new TextEditingController();
  var bonusController = new TextEditingController();
  var stateController = new TextEditingController();
  var yearController = new TextEditingController();

  String statusOption;
  List<String> statusOptions = [
    "Internship",
    "Full-Time",
  ];
  String salaryOption;
  List<String> salaryOptions = [
    "Salary",
    "Hourly",
  ];
  String schoolYear;
  List<String> schoolYears = [
    "Alum",
    "Grad Student",
    "Senior",
    "Junior",
    "Sophomore",
    "Freshman",
  ];

  Widget build(BuildContext context) {
    MediaQueryData mq;
    mq = MediaQuery.of(context);

    var dataCompany = new Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        controller: companyNameController,
        decoration: InputDecoration(
            hintText: "Company Name",
            border: InputBorder.none
        ),
      ),
    );

    chooseSalary(){
      if(salaryOption == "Hourly"){
        return new Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            controller: salaryController,
            decoration: InputDecoration(
                hintText: "Salary Per Hour",
                border: InputBorder.none
            ),
          ),
        );
      }else{
        return new Container(
          margin: EdgeInsets.symmetric(vertical: 8),
          padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(10)
          ),
          child: TextField(
            keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
            controller: salaryController,
            decoration: InputDecoration(
                hintText: "Base Salary",
                border: InputBorder.none
            ),
          ),
        );
      }
    }

    TextStyle style = TextStyle(fontFamily: 'Raleway-Regular', fontSize: 15.0);

    var HourlySalary = new Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      width: mq.size.width,
      child: DropdownButton<String>(
        value: salaryOption,
        onChanged: (String newValue) {
          setState(() {
            salaryOption = newValue;
          });
        },
        style: style.copyWith(color: Colors.black),
        hint: Text("Select Salary Type"),
        items: salaryOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );

    var InternFullTime = new Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      width: mq.size.width,
      child: DropdownButton<String>(
        value: statusOption,
        onChanged: (String newValue) {
          setState(() {
            statusOption = newValue;
          });
        },
        style: style.copyWith(color: Colors.black),
        hint: Text("Select Job Type"),
        items: statusOptions.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );

    var dataYear = new Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      width: mq.size.width,
      child: DropdownButton<String>(
        value: schoolYear,
        onChanged: (String newValue) {
          setState(() {
            schoolYear = newValue;
          });
        },
        style: style.copyWith(color: Colors.black),
        hint: Text("Select Year in school"),
        items: schoolYears.map<DropdownMenuItem<String>>((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
      ),
    );

    var dataMajor = new Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        controller: majorController,
        decoration: InputDecoration(
            hintText: "Major Studied",
            border: InputBorder.none
        ),
      ),
    );

    var dataBonus = new Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        keyboardType: TextInputType.numberWithOptions(decimal: true, signed: true),
        controller: bonusController,
        decoration: InputDecoration(
            hintText: "Bonus Salary + Stock Value",
            border: InputBorder.none
        ),
      ),
    );

    var dataState = new Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        controller: stateController,
        decoration: InputDecoration(
            hintText: "Location (State)",
            border: InputBorder.none
        ),
      ),
    );

    var addDataButton = new Container(
      decoration: BoxDecoration(
          color: Theme.of(context).accentColor,
          borderRadius: BorderRadius.circular(10)
      ),
      margin: EdgeInsets.symmetric(vertical: 8),
      width: double.infinity,
      child: MaterialButton(
        child: Text("Submit Offer",
          style: TextStyle(
              color: Colors.black
          ),
        ),
        onPressed: ()async{
          var salary;
          if(salaryOption == "Hourly"){
            var temp = salaryController.text;
            var value = double.parse(temp);
            value = value * 50 * 40;
            salary = value.toString();
          }else{
            salary = salaryController.text;
          }
          var status = statusOption;
          var company = companyNameController.text;
          var bonus = bonusController.text;
          var state = stateController.text;
          var year = schoolYear;
          var major = majorController.text;
          if(majorController.text == ""){
            major = "No Major Given";
          }
          if(statusOption == null){
            status = "No Status Given";
          }
          if(schoolYear == null){
            year = "No Year Given";
          }
          if(companyNameController.text == ""){
            company = "No Company";
          }
          if(salaryController.text == ""){
            salary = "No Salary";
          }
          if(bonusController.text == ""){
            bonus = "No Bonus";
          }
          if(stateController.text == ""){
            state = "No Location";
          }
          if(schoolYear == ""){
            year = "No Year";
          }
          Data temp = new Data(ItemID: randomAlpha(5), Company: company, Salary: salary, Bonus: bonus, Status: status, State: state, Year: year, Major: major);
          var a = await createData(URL, temp);
          if (a != null){
            print("Success");
            showAlert(context, "Success", "Thank you for contributing to BYU's Job Offer database");
          }
        },
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Offer", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: Theme.of(context).primaryColor.withOpacity(.9),
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: mq.size.height,
            ),
            child: Column(
              children: <Widget>[
                dataCompany,
                InternFullTime,
                HourlySalary,
                chooseSalary(),
                dataBonus,
                dataState,
                dataYear,
                dataMajor,
                addDataButton,
              ],
            ),
          ),
        ),
      ),
    );
  }
}
