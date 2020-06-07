import 'package:flutter/material.dart';

import 'insertCommas.dart';

Widget textBox(dynamic total, dynamic newNum, String dataType, Color color) {
  return Container(
      child: Column(
    children: <Widget>[
      RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: <TextSpan>[
          TextSpan(
            text: '${InsertCommas().insertCommas(total.toString())}\n',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 21,
              color: color,
            ),
          ),
          TextSpan(
              text: '+${InsertCommas().insertCommas(newNum.toString())}\n',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                  color: color,
                  height: 1.5)),
          TextSpan(
              text: '$dataType',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.white,
                  height: 1.5)),
        ]),
      ),
    ],
  ));
}
