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
      body: Stack(
        children: <Widget>[
          backGround(),
          Padding(
            padding: EdgeInsets.only(top: 30, bottom: 20),
            child: Container(
              alignment: Alignment.topCenter,
              child: Text(
                'District Alanysis',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Positioned(
            top: 50,
            bottom: 0,
            right: 0,
            left: 0,
            child: ListView.builder(
                itemCount: districtList.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: EdgeInsets.all(10),
                    child: Container(
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
                }),
          )
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
