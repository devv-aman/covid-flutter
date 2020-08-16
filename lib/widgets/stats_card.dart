import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../widgets/stats_chart.dart';
import '../widgets/circular_loader.dart';

class StatsCard extends StatelessWidget {
  final String label;
  final int statNumber;

  StatsCard(this.label, this.statNumber);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.85,
      margin: const EdgeInsets.all(10.0),
      padding: const EdgeInsets.only(
        top: 17,
        bottom: 17,
        left: 0,
        right: 0,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(6.0),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(119, 119, 255, 0.14),
            blurRadius: 10,
            offset: Offset(0, 1),
          ),
        ],
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                  top: 8.0,
                  bottom: 8.0,
                  left: 32.0,
                ),
                child: Text(
                  label,
                  style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
              Spacer(),
              statNumber != null && statNumber > 0
                  ? Padding(
                      padding: const EdgeInsets.only(right: 32.0),
                      child: Text(
                        NumberFormat("#,##,###", "en_US").format(statNumber),
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : CircularLoader(
                      Theme.of(context).primaryColor,
                      Colors.white,
                    )
            ],
          ),
          StatsChart(),
        ],
      ),
    );
  }
}
