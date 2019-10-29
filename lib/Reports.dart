import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'API.dart';
import 'DataList.dart';
import 'Data.dart';
import 'PlotData.dart';

class Reports extends StatefulWidget {
  Reports();
  @override
  ReportsState createState() => ReportsState();
}

class ReportsState extends State<Reports> {
  ReportsState();

  int _counter = 0;
  var data = [
    new PlotData("Internship", 50000, Colors.red),
  ];

  @override
  initState(){
    method() async {
      DataList a = await getDataList("https://d23kwuyo38.execute-api.us-east-1.amazonaws.com/production/", null);
      if(a != null){
        for(Data value in a.dataItem){
          PlotData temp;
          if(value.Status == "Internship"){
            temp = new PlotData(value.Status, value.Salary, Colors.red);
          }else{
            temp = new PlotData(value.Status, value.Salary, Colors.yellow);
          }
          data.add(temp);
          print("Added Value");
          setState(() {});
        }
      }
    }
    method();
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget build(BuildContext context) {
//    MediaQueryData mq;
//    mq = MediaQuery.of(context);

    var series = [
      new charts.Series(
        domainFn: (PlotData clickData, _) => clickData.Year,
        measureFn: (PlotData clickData, _) => clickData.Salary,
        colorFn: (PlotData clickData, _) => clickData.color,
        data: data,
      ),
    ];

    var chart = new charts.BarChart(
      series,
      animate: true,
    );
    var chartWidget = new Padding(
      padding: new EdgeInsets.all(32.0),
      child: new SizedBox(
        height: 200.0,
        child: chart,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Graphs", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
      ),
      body: new Container(
        color: Theme.of(context).accentColor,
        child: Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RichText(
                text: TextSpan(
                  text: "Average pay",
                  style: TextStyle(fontSize: 20.0, color: Colors.black),
                ),
                overflow: TextOverflow.ellipsis,
              ),
              chartWidget,
            ],
          ),
        ),
      ),
    );
  }
}
