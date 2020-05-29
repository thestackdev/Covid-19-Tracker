import 'package:flutter/material.dart';

import 'insertCommas.dart';

Widget countryWidget(dynamic data, String dataType, Color color) {
  return Column(
    children: <Widget>[
      Text(InsertCommas().insertCommas(data.toString()),
          style: TextStyle(
              color: color, fontSize: 30, fontWeight: FontWeight.bold)),
      Text(dataType,
          style: TextStyle(
              color: Colors.white, fontSize: 14, fontWeight: FontWeight.bold)),
    ],
  );
}
