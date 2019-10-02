import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'PlotData.dart';

class Reports extends StatefulWidget {
  Reports();
  @override
  ReportsState createState() => ReportsState();
}

class ReportsState extends State<Reports> {
  ReportsState();

  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  Widget build(BuildContext context) {
//    MediaQueryData mq;
//    mq = MediaQuery.of(context);

    var data = [
      new PlotData('2016', 12, Colors.red),
      new PlotData('2017', 42, Colors.yellow),
      new PlotData('2018', 27, Colors.green),
    ];

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
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            chartWidget,
          ],
        ),
      ),
    );
  }
}
