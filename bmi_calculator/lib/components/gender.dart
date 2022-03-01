import 'package:flutter/material.dart';
import '../constants.dart';

class Gender extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  const Gender({required this.genderType, required this.icon});

  final String genderType;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderType,
          style: klabelTextStyle,
        ),
      ],
    );
  }
}
