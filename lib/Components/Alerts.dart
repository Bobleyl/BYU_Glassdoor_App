import 'package:flutter/material.dart';


void showAlert(context, title, body) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: new Text(title),
        content: new Text(body),
        actions: <Widget>[
          new MaterialButton(
            color: Colors.black,
            child: new Text("Close"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}