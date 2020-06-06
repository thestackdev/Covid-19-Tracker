import 'package:flutter/material.dart';

import 'insertCommas.dart';

Widget countryWidget(dynamic data, String dataType, Color color) {
  return Column(
    children: <Widget>[
      Text(data != null ? InsertCommas().insertCommas(data.toString()) : '-',
          style: TextStyle(
              color: color, fontSize: 25, fontWeight: FontWeight.bold)),
      Text(dataType,
          style: TextStyle(
              color: Colors.white, fontSize: 12, fontWeight: FontWeight.bold)),
    ],
  );
}
