import 'package:flutter/material.dart';
import 'package:byu_glassdoor_app/API.dart';
import 'package:byu_glassdoor_app/Data.dart';
import 'package:byu_glassdoor_app/Alerts.dart';

class OfferDetails extends StatefulWidget {
  OfferDetails(this.data);
  Data data;

  @override
  OfferDetailsState createState() => OfferDetailsState(data);
}

class OfferDetailsState extends State<OfferDetails> {
  OfferDetailsState(this.data);
  Data data;

  var URL = "https://8j06torsic.execute-api.us-east-1.amazonaws.com/dev/glass";

  Widget build(BuildContext context) {
    MediaQueryData mq;
    mq = MediaQuery.of(context);

    var companyTitle = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(.1),
      ),
      width: mq.size.width,
      padding: EdgeInsets.all(12),
      child: Text(
        'Company: ' + data.Company,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );

    var salary = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(.1),
      ),
      width: mq.size.width,
      padding: EdgeInsets.all(12),
      child: Text(
        'Salary: ' + data.Salary,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );

    var bonus = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(.1),
      ),
      width: mq.size.width,
      padding: EdgeInsets.all(12),
      child: Text(
        'Bonus: ' + data.Bonus,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );

    var state = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(.1),
      ),
      width: mq.size.width,
      padding: EdgeInsets.all(12),
      child: Text(
        'State: ' + data.State,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );

    var year = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(.1),
      ),
      width: mq.size.width,
      padding: EdgeInsets.all(12),
      child: Text(
        'Year in School: ' + data.Year,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );

    var jobType = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(.1),
      ),
      width: mq.size.width,
      padding: EdgeInsets.all(12),
      child: Text(
        'Job Type: ' + data.Status,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );

    var major = Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25),
        color: Colors.white.withOpacity(.1),
      ),
      width: mq.size.width,
      padding: EdgeInsets.all(12),
      child: Text(
        'Major: ' + data.Major,
        textScaleFactor: 1.0,
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.white,
        ),
        textAlign: TextAlign.left,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Offer Details", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        padding: EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: mq.size.height,
              minWidth: mq.size.width,
            ),
            child: Container(
              padding: EdgeInsets.all(12),
              child: Column(
                children: <Widget>[
                  companyTitle,
                  SizedBox(height: mq.size.height/60),
                  jobType,
                  SizedBox(height: mq.size.height/60),
                  salary,
                  SizedBox(height: mq.size.height/60),
                  bonus,
                  SizedBox(height: mq.size.height/60),
                  state,
                  SizedBox(height: mq.size.height/60),
                  year,
                  SizedBox(height: mq.size.height/60),
                  major,
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
