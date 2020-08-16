import 'package:covid/providers/data.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:provider/provider.dart';

class StatsChart extends StatefulWidget {
  @override
  _StatsChartState createState() => _StatsChartState();
}

class _StatsChartState extends State<StatsChart> {
  bool _graphDataFetched = false;

  @override
  void didChangeDependencies() {
    if (!_graphDataFetched) {
      _graphDataFetched = true;
      COVIDData _dataProvider = Provider.of<COVIDData>(context);
      _dataProvider.fetchGraphData();
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    COVIDData _dataProvider = Provider.of<COVIDData>(context);
    List<charts.Series<Cases, int>> _graphData = _dataProvider.getGraphData;

    return Container(
      margin: const EdgeInsets.only(
        top: 20.0,
      ),
      child: Container(
        width: double.infinity,
        height: 100,
        child: StackedAreaLineChart(
          _graphData,
          animate: true,
        ),
      ),
    );
  }
}

class StackedAreaLineChart extends StatelessWidget {
  final List<charts.Series> seriesList;
  final bool animate;

  StackedAreaLineChart(this.seriesList, {this.animate});

  @override
  Widget build(BuildContext context) {
    return new charts.LineChart(
      seriesList,
      defaultRenderer: new charts.LineRendererConfig(
        includeArea: true,
        stacked: true,
        dashPattern: [1, 1, 1],
        roundEndCaps: true,
        strokeWidthPx: 2.0,
      ),
      animate: animate,
    );
  }
}
