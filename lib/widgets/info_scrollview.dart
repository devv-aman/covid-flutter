import 'package:flutter/material.dart';

import './symptoms_card.dart';
import './prevention_circle_card.dart';

enum InfoScrollViewType {
  SYMPTOMS,
  PREVENTIONS,
}

class InfoScrollView extends StatelessWidget {
  final InfoScrollViewType _type;

  InfoScrollView(this._type);

  @override
  Widget build(BuildContext context) {
    return _type == InfoScrollViewType.SYMPTOMS
        ? SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 60.0),
              child: Row(
                children: [
                  SymptomsCard('HIGH FEVER', 'img/high_fever.png'),
                  SymptomsCard('COUGH', 'img/cough.png'),
                  SymptomsCard('SORE THROAT', 'img/sore_throat.png'),
                ],
              ),
            ),
          )
        : SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Padding(
              padding: const EdgeInsets.only(left: 24.0, top: 24.0),
              child: Row(
                children: [
                  PreventionCircleCard(
                    'Wash Your Hands Often',
                    'img/wash_hands.png',
                  ),
                  PreventionCircleCard(
                    'Wear A Face Mask',
                    'img/wear_mask.png',
                  ),
                  PreventionCircleCard(
                    'Avoid Contact with Sick People',
                    'img/avoid_contact.png',
                  ),
                  PreventionCircleCard(
                    'Always Cover Your Cough or Sneeze',
                    'img/always_cover.png',
                  ),
                ],
              ),
            ),
          );
  }
}
