import 'package:flutter/material.dart';

class Submit extends StatefulWidget {
  Submit();
  @override
  SubmitState createState() => SubmitState();
}

class SubmitState extends State<Submit> {
  SubmitState();

  Widget build(BuildContext context) {
//    MediaQueryData mq;
//    mq = MediaQuery.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("Upload Offer", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Upload"
              ),
            )
          ],
        ),
      ),
    );
  }
}
