import 'dart:ui';

import 'package:flutter/material.dart';

class PopulateDistricts extends StatelessWidget {
  final List<dynamic> districtList;

  const PopulateDistricts({Key key, this.districtList}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Container(
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
                decoration:
                    new BoxDecoration(color: Colors.black.withOpacity(0.5)),
              ),
            ),
          ),
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
                            color: Color.fromRGBO(3000, 3000, 3000, 0.5),
                            borderRadius: BorderRadius.circular(30)),
                        child: Column(
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(bottom: 10, top: 5),
                              alignment: Alignment.center,
                              child: Text(
                                districtList[index]['id'],
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 27,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: <Widget>[
                                Column(
                                  children: <Widget>[
                                    Text(
                                        districtList[index]['confirmed']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.orangeAccent,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    Text('Confirmed',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                        districtList[index]['recovered']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.greenAccent,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    Text('Recovered',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                                Column(
                                  children: <Widget>[
                                    Text(
                                        districtList[index]['deaths']
                                            .toString(),
                                        style: TextStyle(
                                            color: Colors.redAccent,
                                            fontSize: 30,
                                            fontWeight: FontWeight.bold)),
                                    Text('Deaths',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14,
                                            fontWeight: FontWeight.bold)),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Container(
                                  padding: EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: getColour(
                                          districtList[index]['zone'])),
                                  child: Text(
                                    'Zone : ${districtList[index]['zone']}',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold),
                                  )),
                            )
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
