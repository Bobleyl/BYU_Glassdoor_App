import 'package:flutter/material.dart';
import 'package:byu_glassdoor_app/Data.dart';
import 'package:byu_glassdoor_app/OfferDetails.dart';

class DataView extends StatefulWidget {
  DataView(this.data) : super();
  Data data;
  @override
  DataViewState createState() => DataViewState(data);
}

class DataViewState extends State<DataView> {
  DataViewState(this.data);
  Data data;
  var bg;

  @override
  initState(){
    if(data.Status == "Internship"){
      bg = Colors.white;
    }else{
      bg = Colors.red;
    }
  }

  Widget build(BuildContext context) {
    MediaQueryData mq;
    mq = MediaQuery.of(context);
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OfferDetails(data)),
        );
      },
      child: Center(
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 10,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.white),
                color: bg,
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
                      SizedBox(width: mq.size.height/30),
                      Flexible(
                        flex: 20,
                        child: RichText(
                          text: TextSpan(
                            text: data.Company,
                            style: TextStyle(fontSize: 20.0, color: Colors.black),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      SizedBox(width: mq.size.height/60),
                      Flexible(
                        flex: 20,
                        child: Column(
                          children: <Widget>[
                              RichText(
                                text: TextSpan(
                                  text: "Salary: \$" + data.Salary,
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                              SizedBox(width: mq.size.height/60),
                              RichText(
                                text: TextSpan(
                                  text: "Bonus: \$" + data.Bonus,
                                  style: TextStyle(fontSize: 15.0, color: Colors.black),
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                          ],
                        ),
                      ),
                      SizedBox(width: mq.size.height/60),
                      Flexible(
                        flex: 10,
                        child: RichText(
                          text: TextSpan(
                            text: data.Year,
                            style: TextStyle(fontSize: 15.0, color: Colors.black),
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      )
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