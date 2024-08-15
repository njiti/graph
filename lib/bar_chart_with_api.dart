import 'package:flutter/material.dart';

import 'package:charts_flutter/flutter.dart' as charts;
import 'package:graph/network_helper.dart';

import 'bar_model.dart';
import 'gender_model.dart';

class Bar extends StatefulWidget {
  const Bar({super.key});

  @override
  State<Bar> createState() => _BarState();
}

class _BarState extends State<Bar> {
  List<GenderModel> genders = [];
  bool loading = true;
  NetworkHelper _networkHelper = NetworkHelper();

  @override
  void initState(){
    super.initState();
    getData();
  }
  
  Future<void> getData() async {
    var response = await _networkHelper.get('https://api.genderize.io/?name[]=balram&name[]=sake&name[]=bhanu&name[]=aquib');
    List<GenderModel> tempdata = genderModelFromJson(response.body);
    setState(() {
      genders = tempdata;
      loading = false;
    });
  }

  List<charts.Series<GenderModel, String>> _createSampleData() {
    return [
      charts.Series<GenderModel, String>(
        data: genders,
        id: 'sales',
        colorFn: (_, __) => charts.MaterialPalette.teal.shadeDefault,
        domainFn: (GenderModel genderModel, _) => genderModel.name,
        measureFn: (GenderModel genderModel, _) => genderModel.count,
      )
    ];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Bar Chart API'),
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
