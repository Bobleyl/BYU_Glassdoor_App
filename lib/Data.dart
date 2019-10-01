import 'package:flutter/material.dart';

class Data extends StatefulWidget {
  Data();
  @override
  DataState createState() => DataState();
}

class DataState extends State<Data> {
  DataState();

  Widget build(BuildContext context) {
//    MediaQueryData mq;
//    mq = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Data", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                  "Data"
              ),
            )
          ],
        ),
      ),
    );
  }
}
