import 'package:covid/widgets/stats_hero.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/stats_card.dart';
import '../providers/data.dart';

class Stats extends StatefulWidget {
  @override
  _StatsState createState() => _StatsState();
}

class _StatsState extends State<Stats> {
  bool _dataFetched = false;

  @override
  void didChangeDependencies() {
    COVIDData _dataProvider = Provider.of<COVIDData>(context);

    if (!_dataFetched) {
      _dataFetched = true;
      _dataProvider.fetchCountryData('india');
    }

    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    COVIDData _dataProvider = Provider.of<COVIDData>(context);
    Map _covidStats = _dataProvider.getData;

    return SingleChildScrollView(
      child: Column(
        children: [
          StatsHero(_covidStats['Confirmed']),
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            width: MediaQuery.of(context).size.width * 0.9,
            margin: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Stack(
              overflow: Overflow.visible,
              children: [
                Positioned(
                  top: -50,
                  child: Column(
                    children: [
                      StatsCard('Deaths', _covidStats['Deaths']),
                      StatsCard('Active', _covidStats['Active']),
                      StatsCard('Recovered', _covidStats['Recovered']),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
