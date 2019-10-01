import 'package:flutter/material.dart';
import 'package:byu_glassdoor_app/API.dart';
import 'package:byu_glassdoor_app/Data.dart';
import 'package:random_string/random_string.dart';
import 'package:byu_glassdoor_app/Alerts.dart';

class Submit extends StatefulWidget {
  Submit();
  @override
  SubmitState createState() => SubmitState();
}

class SubmitState extends State<Submit> {
  SubmitState();

  var URL = "https://hwp1z9mnyk.execute-api.us-east-1.amazonaws.com/dev/glass";

  var companyNameController = new TextEditingController();
  var salaryController = new TextEditingController();
  var bonusController = new TextEditingController();
  var stateController = new TextEditingController();
  var yearController = new TextEditingController();

  Widget build(BuildContext context) {
//    MediaQueryData mq;
//    mq = MediaQuery.of(context);

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

    var dataSalary = new Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        controller: salaryController,
        decoration: InputDecoration(
            hintText: "Base Salary",
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

    var dataYear = new Container(
      margin: EdgeInsets.symmetric(vertical: 8),
      padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10)
      ),
      child: TextField(
        controller: yearController,
        decoration: InputDecoration(
            hintText: "Year in School (Junior, Senior, Alum, etc.)",
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
          Data temp = new Data(ItemID: randomAlpha(5), Company: companyNameController.text, Salary: salaryController.text, Bonus: bonusController.text, State: stateController.text, Year: yearController.text);
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
        color: Theme.of(context).primaryColor.withOpacity(.7),
        padding: EdgeInsets.all(12),
        child: Column(
          children: <Widget>[
            dataCompany,
            dataSalary,
            dataBonus,
            dataState,
            dataYear,
            addDataButton,
          ],
        ),
      ),
    );
  }
}
