import 'dart:ui';

import 'package:covid19tracker/widgets/background.dart';
import 'package:covid19tracker/widgets/countryWidget.dart';
import 'package:flutter/material.dart';

class PopulateDistricts extends StatelessWidget {
  final List districtList;

  const PopulateDistricts({Key key, this.districtList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black87,
        title: Text(
          'Distirct Analysis',
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
              itemCount: districtList.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(30)),
                      child: Column(
                        children: <Widget>[
                          Container(
                            padding: EdgeInsets.only(bottom: 10, top: 5),
                            alignment: Alignment.center,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Text(
                                  districtList[index]['id'],
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 25,
                                      fontWeight: FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(top: 10),
                                  child: Container(
                                      padding: EdgeInsets.all(10),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          color: getColour(
                                              districtList[index]['zone'])),
                                      child: Text(
                                        'Zone ${districtList[index]['zone']}',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold),
                                      )),
                                )
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: <Widget>[
                              countryWidget(districtList[index]['confirmed'],
                                  'Confirmed', Colors.orangeAccent),
                              countryWidget(districtList[index]['recovered'],
                                  'Recovered', Colors.greenAccent),
                              countryWidget(districtList[index]['deaths'],
                                  'Deaths', Colors.redAccent),
                            ],
                          ),
                        ],
                      )),
                );
              })
        ],
      ),
    );
  }

  Color getColour(String zone) {
    switch (zone) {
      case 'ORANGE':
        return Colors.orangeAccent;
        break;
      case 'RED':
        return Colors.redAccent;
        break;
      case 'GREEN':
        return Colors.greenAccent;
        break;
      default:
        return null;
    }
  }
}
