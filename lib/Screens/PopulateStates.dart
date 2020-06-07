import 'dart:ui';

import 'package:covid19tracker/Screens/PopulateDistricts.dart';
import 'package:covid19tracker/widgets/background.dart';
import 'package:covid19tracker/widgets/countryWidget.dart';
import 'package:flutter/material.dart';

class PopulateStates extends StatefulWidget {
  const PopulateStates({Key key, this.statesList}) : super(key: key);

  final List<dynamic> statesList;

  @override
  _PopulateStatesState createState() => _PopulateStatesState();
}

class _PopulateStatesState extends State<PopulateStates> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'State Analysis',
          style: TextStyle(
              color: Colors.deepOrangeAccent,
              fontSize: 25,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.0),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: <Widget>[
          backGround(),
          ListView.builder(
              itemCount: widget.statesList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(5),
                  child: GestureDetector(
                    onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PopulateDistricts(
                                districtList: widget.statesList[index]
                                    ['districtData']))),
                    child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 10, top: 5),
                              alignment: Alignment.center,
                              child: Text(
                                widget.statesList[index]['state'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                countryWidget(
                                    widget.statesList[index]['confirmed'],
                                    'Confirmed',
                                    Colors.deepOrangeAccent),
                                countryWidget(
                                    widget.statesList[index]['active'],
                                    'Active',
                                    Colors.lime),
                                countryWidget(
                                    widget.statesList[index]['recovered'],
                                    'Recovered',
                                    Colors.greenAccent),
                                countryWidget(
                                    widget.statesList[index]['deaths'],
                                    'Deaths',
                                    Colors.red),
                              ],
                            ),
                          ],
                        )),
                  ),
                );
              })
        ],
      ),
    );
  }
}
