import 'package:flutter/material.dart';

class SymptomsCard extends StatelessWidget {
  final String _label;
  final String _image;

  SymptomsCard(this._label, this._image);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).primaryColor,
        borderRadius: BorderRadius.circular(6.0),
      ),
      width: 120,
      height: 135,
      margin: const EdgeInsets.only(right: 24.0),
      // padding: const EdgeInsets.only(left: 12.0, right: 12.0),
      child: Stack(
        fit: StackFit.expand,
        overflow: Overflow.visible,
        children: [
          Container(
            child: Text(
              _label,
              style: TextStyle(color: Colors.white),
              textAlign: TextAlign.center,
            ),
            padding: const EdgeInsets.only(top: 100.0),
          ),
          Positioned(
            top: -50,
            left: 0,
            child: Container(
              child: Image.asset(_image),
              padding: const EdgeInsets.only(
                bottom: 30.0,
                left: 8.0,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
