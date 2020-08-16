import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';
import 'package:charts_flutter/flutter.dart' as charts;

class COVIDData with ChangeNotifier {
  Map<String, dynamic> _data = {};
  List<Map<String, String>> _headlines = [];
  List<dynamic> _helplineNos = [];
  List<charts.Series<Cases, int>> _graphData = [];

  // https://api.covid19api.com/countries
  // https://api.covid19api.com/country/india?from=2020-08-12&to=2020-08-13 ->
  // https://api.covid19api.com/total/country/india -> data for graph
  // https://covid-19india-api.herokuapp.com/headlines
  // https://covid-19india-api.herokuapp.com/helpline_numbers

  Map get getData {
    return _data;
  }

  List get getHeadlines {
    return _headlines;
  }

  List get getHelplineNos {
    return _helplineNos;
  }

  List get getGraphData {
    return _graphData;
  }

  Future<void> fetchCountryData(String countrySlug) async {
    final String _apiURL =
        "https://api.covid19api.com/country/:country?from=:startDateT00:00:00Z&to=:endDateT00:00:00Z";

    String endDate = new DateFormat('yyyy-MM-d').format(DateTime.now());
    String startDate = new DateFormat('yyyy-MM-d')
        .format(DateTime.now().subtract(Duration(days: 1)));

    var response = await http.get(_apiURL
        .replaceAll(':country', countrySlug)
        .replaceAll(':startDate', startDate)
        .replaceAll(':endDate', endDate));

    var parsedData = json.decode(response.body);
    if (parsedData.length > 0) {
      _data = parsedData[0];
    } else {
      startDate = new DateFormat('yyyy-MM-d')
          .format(DateTime.now().subtract(Duration(days: 2)));
      endDate = new DateFormat('yyyy-MM-d')
          .format(DateTime.now().subtract(Duration(days: 1)));

      response = await http.get(_apiURL
          .replaceAll(':country', countrySlug)
          .replaceAll(':startDate', startDate)
          .replaceAll(':endDate', endDate));

      parsedData = json.decode(response.body);
      _data = parsedData[0];
    }

    notifyListeners();
  }

  Future<void> fetchHeadlines() async {
    final response =
        await http.get('https://covid-19india-api.herokuapp.com/headlines');

    final parsedData = json.decode(response.body);
    _headlines = [];
    for (int ix = 0; ix < parsedData['headlines'].length; ix++) {
      _headlines.add({
        'id': '$ix',
        'headline': parsedData['headlines'][ix],
        'summary': parsedData['headlines_summary'][ix],
        'image': parsedData['image_link'][ix],
      });
    }
    notifyListeners();
  }

  Future<void> fetchHelplineNumbers() async {
    final response = await http
        .get('https://covid-19india-api.herokuapp.com/helpline_numbers');
    final parsedData = json.decode(response.body);
    _helplineNos = parsedData['contact_details'];
    notifyListeners();
  }

  Future<void> fetchGraphData() async {
    final response =
        await http.get('https://api.covid19api.com/total/country/india');
    final parsedData = json.decode(response.body);
    _graphData = createGraphData(parsedData);
    notifyListeners();
  }
}

class Cases {
  final int day;
  final int total;

  Cases(this.day, this.total);
}

List<charts.Series<Cases, int>> createGraphData(graphData) {
  List<Cases> covidCases = [];

  for (int ix = 0; ix < graphData.length; ix++) {
    covidCases.add(new Cases(ix + 1, graphData[ix]['Confirmed']));
  }

  return [
    new charts.Series<Cases, int>(
      id: 'COVIDCASES',
      colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
      domainFn: (Cases cases, _) => cases.day,
      measureFn: (Cases cases, _) => cases.total,
      data: covidCases,
    ),
  ];
}

// class COVID {
//   final int year;
//   final int sales;

//   LinearSales(this.year, this.sales);
// }

// List<charts.Series<LinearSales, int>> _createSampleData() {
//   final myFakeDesktopData = [
//     new LinearSales(0, 5),
//     new LinearSales(1, 25),
//     new LinearSales(2, 100),
//     new LinearSales(3, 75),
//   ];

//   return [
//     new charts.Series<LinearSales, int>(
//       id: 'Desktop',
//       colorFn: (_, __) => charts.MaterialPalette.deepOrange.shadeDefault,
//       domainFn: (LinearSales sales, _) => sales.year,
//       measureFn: (LinearSales sales, _) => sales.sales,
//       data: myFakeDesktopData,
//     ),
//   ];
// }
