import 'package:flutter/material.dart';

class PreventionCircleCard extends StatelessWidget {
  final String _label;
  final String _image;

  PreventionCircleCard(this._label, this._image);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 120,
      child: Column(
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100.0),
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Color.fromRGBO(119, 119, 255, 0.4),
                    blurRadius: 6.0,
                    offset: Offset(0, 1),
                  )
                ]),
            child: Image.asset(
              _image,
              fit: BoxFit.contain,
            ),
          ),
          SizedBox(
            height: 15,
          ),
          Text(
            _label,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
