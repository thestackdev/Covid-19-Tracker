import 'dart:ui';

import 'package:flutter/material.dart';

Widget backGround() {
  return Container(
    height: double.infinity,
    width: double.infinity,
    decoration: BoxDecoration(
        image: DecorationImage(
      image: AssetImage('assets/corons.jpg'),
      fit: BoxFit.cover,
    )),
    child: BackdropFilter(
      filter: (ImageFilter.blur(sigmaX: 3, sigmaY: 3)),
      child: new Container(
        decoration: new BoxDecoration(color: Colors.black.withOpacity(0.81)),
      ),
    ),
  );
}
