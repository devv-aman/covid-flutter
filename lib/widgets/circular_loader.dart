import 'package:flutter/material.dart';

class CircularLoader extends StatelessWidget {
  final Color _color;
  final Color _backgroundColor;

  CircularLoader(this._color, this._backgroundColor);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      width: 20,
      child: CircularProgressIndicator(
        backgroundColor: _color,
        strokeWidth: 2.0,
        valueColor: new AlwaysStoppedAnimation<Color>(_backgroundColor),
      ),
    );
  }
}
