import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;

import 'bar_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static List<charts.Series<BarMmodel, String>> _createSampleData() {
    final data = [
      BarMmodel("2016", 20),
      BarMmodel("2017", 23),
      BarMmodel("2018", 29),
      BarMmodel("2019", 30),
      BarMmodel("2020", 29),
      BarMmodel("2021", 23),
      BarMmodel("2022", 20),
    ];
    return [
      charts.Series<BarMmodel, String>(
        data: data,
        id: 'sales',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (BarMmodel barModeel, _) => barModeel.year,
        measureFn: (BarMmodel barModeel, _) => barModeel.value,
      )
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bar Chart'),
      ),
      body: Center(
        child: Container(
          height: 300,
          child: charts.BarChart(
            _createSampleData(),
            animate: true,
          ),
        ),
      )
    );
  }
}
