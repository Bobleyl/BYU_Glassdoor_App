import 'package:flutter/material.dart';

class Reports extends StatefulWidget {
  Reports();
  @override
  ReportsState createState() => ReportsState();
}

class ReportsState extends State<Reports> {
  ReportsState();

  Widget build(BuildContext context) {
//    MediaQueryData mq;
//    mq = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Reports", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                  "Reports"
              ),
            )
          ],
        ),
      ),
    );
  }
}
