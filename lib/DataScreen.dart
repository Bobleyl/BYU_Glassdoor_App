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
//    MediaQueryData mq;
//    mq = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Offers", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: Container(
        color: Theme.of(context).primaryColor,
        child: Column(
          children: <Widget>[
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
