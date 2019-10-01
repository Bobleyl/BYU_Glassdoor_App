import 'package:flutter/material.dart';
import 'package:byu_glassdoor_app/Data.dart';

class DataView extends StatefulWidget {
  DataView(this.data) : super();
  Data data;
  @override
  DataViewState createState() => DataViewState(data);
}

class DataViewState extends State<DataView> {
  DataViewState(this.data);
  Data data;

  Widget build(BuildContext context) {
    MediaQueryData mq;
    mq = MediaQuery.of(context);
    return GestureDetector(
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
                color: Theme.of(context).accentColor,
              ),
              height: 65.0,
              width: MediaQuery.of(context).size.width/1.2,
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 18,
                  ),
                  Row(
                    children: <Widget>[
                      SizedBox(width: mq.size.height/30),
                      Flexible(
                        flex: 20,
                        child: RichText(
                          text: TextSpan(
                            text: data.Company,
                            style: TextStyle(fontSize: 25.0, color: Colors.black),
                          ),
                        ),
                      ),
                      SizedBox(width: mq.size.height/60),
                      RichText(
                        text: TextSpan(
                          text: "-",
                          style: TextStyle(fontSize: 25.0, color: Colors.black),
                        ),
                      ),
                      SizedBox(width: mq.size.height/60),
                      Flexible(
                        flex: 10,
                        child: RichText(
                          text: TextSpan(
                            text: data.Salary,
                            style: TextStyle(fontSize: 25.0, color: Colors.black),
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
  }
}