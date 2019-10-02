import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class PlotData {
  final String Year;
  final int Salary;
  final charts.Color color;

  PlotData(this.Year, this.Salary, Color color)
      : this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}