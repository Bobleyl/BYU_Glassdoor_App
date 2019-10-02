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

  var URL = "https://hwp1z9mnyk.execute-api.us-east-1.amazonaws.com/dev/glass/get";

  Widget build(BuildContext context) {
    MediaQueryData mq;
    mq = MediaQuery.of(context);

    var topBar = new GestureDetector(
      onTap: (){

      },
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
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


    return Scaffold(
      appBar: AppBar(
        title: Text("Offers", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
            topBar,
            Flexible(
              flex: 19,
              child: FutureBuilder<DataList>(
                future: getDataList(URL),
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
