import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:clippy_flutter/clippy_flutter.dart';
import 'package:intl/intl.dart';

import '../widgets/circular_loader.dart';

class StatsHero extends StatelessWidget {
  final int totalCase;

  StatsHero(this.totalCase);

  @override
  Widget build(BuildContext context) {
    return Arc(
      arcType: ArcType.CONVEX,
      edge: Edge.BOTTOM,
      height: 30,
      child: Container(
        height: MediaQuery.of(context).size.height * 0.3,
        padding: const EdgeInsets.only(
          top: 92,
          left: 38,
        ),
        color: Color(0xff4C77FF),
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.35,
              child: Stack(
                overflow: Overflow.visible,
                children: [
                  Positioned(
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset('img/corona_white_small.png'),
                    ),
                    bottom: 40,
                    left: -28,
                  ),
                  Image.asset('img/mac_coughing.png'),
                  Positioned(
                    child: Opacity(
                      opacity: 0.6,
                      child: Image.asset('img/corona_white_small.png'),
                    ),
                    right: 0,
                    top: -12,
                  ),
                ],
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                        bottom: 12,
                      ),
                      child: Image.asset('img/india-flag-small.png'),
                      width: 30,
                    ),
                    Text(
                      'Total Cases',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      new DateFormat('MMM dd, y').format(new DateTime.now()),
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    totalCase != null && totalCase > 0
                        ? Text(
                            NumberFormat("#,##,###", "en_US").format(totalCase),
                            style: TextStyle(
                              fontSize: 32,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : CircularLoader(
                            Colors.white,
                            Theme.of(context).primaryColor,
                          )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
