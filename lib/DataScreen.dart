import 'package:flutter/material.dart';
import 'package:byu_glassdoor_app/DataList.dart';
import 'package:byu_glassdoor_app/DataView.dart';
import 'package:byu_glassdoor_app/API.dart';
import 'package:byu_glassdoor_app/Alerts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class DataScreen extends StatefulWidget {
  DataScreen();
  @override
  DataScreenState createState() => DataScreenState();
}

class DataScreenState extends State<DataScreen> {
  DataScreenState();

  var URL = "https://d23kwuyo38.execute-api.us-east-1.amazonaws.com/production/";

  String valueOption;
  List<String> valueOptions = [
    "Best Offers",
    "Internships",
    "FullTime Offers",
    "In-State Offers",
    "Tech Companies",
  ];

  Widget build(BuildContext context) {
    MediaQueryData mq;
    mq = MediaQuery.of(context);

    var topBar = new GestureDetector(
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25.0),
                border: Border.all(color: Colors.white),
                color: Colors.white,
              ),
              height: 65.0,
              width: MediaQuery.of(context).size.width/1.05,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: mq.size.height/60),
                      Flexible(
                        flex: 10,
                        child: Icon(Icons.bookmark, size: 30, color: Colors.red),
                      ),
                      Flexible(
                        flex: 20,
                        child: RichText(
                          text: TextSpan(
                            text: "FullTime",
                            style: TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: mq.size.height/30),
                      Flexible(
                        flex: 10,
                        child: Icon(Icons.bookmark, size: 30, color: Colors.black12),
                      ),
                      Flexible(
                        flex: 20,
                        child: RichText(
                          text: TextSpan(
                            text: "Internship",
                            style: TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );

    Widget popUp(){
      TextStyle style = TextStyle(fontFamily: 'Raleway-Regular', fontSize: 15.0);

      return new Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.fromLTRB(8, 0, 8 ,0),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10)
        ),
        width: mq.size.width,
        child: DropdownButton<String>(
          value: valueOption,
          onChanged: (String newValue) {
            setState(() {
              valueOption = newValue;
            });
          },
          style: style.copyWith(color: Colors.black),
          hint: Text("Filters"),
          items: valueOptions.map<DropdownMenuItem<String>>((String value) {
            return DropdownMenuItem<String>(
              value: value,
              child: Text(value),
            );
          }).toList(),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("Offers", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold)),
      ),
      body: Container(
        color: Theme.of(context).primaryColor.withOpacity(.9),
        child: Column(
          children: <Widget>[
            topBar,
            SizedBox(height: mq.size.height/100),
            Flexible(
              flex: 19,
              child: FutureBuilder<DataList>(
                future: getDataList(URL, valueOption),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data.dataItem == null) {
                      return Column(
                        children: <Widget>[
                          Padding(
                            child: Text(
                              "There are no offers to display.",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                              textAlign: TextAlign.center,
                            ),
                            padding: EdgeInsets.fromLTRB(10, 50, 10, 10),
                          ),
                          Icon(FontAwesomeIcons.solidSadTear, size: 80, color: Colors.white,),
                        ],
                      );
                    } else {
                      return ListView.builder(
                        itemCount: snapshot.data.dataItem.length,
                        itemBuilder: (BuildContext context, int i) {
                          return new DataView(snapshot.data.dataItem[i]);
                        },
                        padding: EdgeInsets.only(),
                      );
                    }
                  } else if (snapshot.hasError) {
                    showAlert(context, "Failure to get Offer Data",
                        "We are currently working to resolve the issue. Thank you for your patience.");
                    return Text("Error: Please restart application");
                  } else {
                    return Center(child: CircularProgressIndicator());
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
