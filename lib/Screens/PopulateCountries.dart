import 'dart:convert';
import 'dart:ui';

import 'package:covid19tracker/widgets/background.dart';
import 'package:covid19tracker/widgets/countryWidget.dart';
import 'package:covid19tracker/widgets/insertCommas.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopulateCountries extends StatefulWidget {
  @override
  _PopulateCountriesState createState() => _PopulateCountriesState();
}

class _PopulateCountriesState extends State<PopulateCountries> {
  Map<String, dynamic> countriesMap;
  List<dynamic> countriesList;
  bool loading = true;

  fetchCountriesData() async {
    while (true) {
      final response = await http.get('http://corona-api.com/countries');

      if (response.statusCode == 200) {
        countriesMap = json.decode(response.body);
        countriesList = countriesMap['data'];

        setState(() {
          loading = false;
        });
        break;
      }
    }
  }

  @override
  void initState() {
    fetchCountriesData();
    super.initState();
  }

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
                'Country Alanysis',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
          ),
          loading
              ? Center(child: CircularProgressIndicator())
              : Positioned(
                  top: 50,
                  bottom: 0,
                  right: 0,
                  left: 0,
                  child: ListView.builder(
                      itemCount: countriesList.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: EdgeInsets.all(10),
                          child: Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.only(bottom: 10, top: 5),
                                    alignment: Alignment.center,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          countriesList[index]['name'],
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 27,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        RichText(
                                            text: TextSpan(children: <TextSpan>[
                                          TextSpan(
                                              text: 'Total  ',
                                              style: TextStyle(
                                                  color: Colors.limeAccent,
                                                  fontSize: 21,
                                                  fontWeight: FontWeight.bold)),
                                          TextSpan(
                                            text:
                                                '${InsertCommas().insertCommas(countriesList[index]['latest_data']['confirmed'].toString())}',
                                            style: TextStyle(
                                                color: Colors.deepOrangeAccent,
                                                fontSize: 25,
                                                fontWeight: FontWeight.bold),
                                          )
                                        ])),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      countryWidget(
                                          countriesList[index]['latest_data']
                                              ['recovered'],
                                          'Recovered',
                                          Colors.greenAccent),
                                      countryWidget(
                                          countriesList[index]['latest_data']
                                              ['critical'],
                                          'Critical',
                                          Colors.redAccent),
                                      countryWidget(
                                          countriesList[index]['latest_data']
                                              ['deaths'],
                                          'Deaths',
                                          Colors.red),
                                    ],
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 20),
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text(
                                          'Today',
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 30,
                                              fontWeight: FontWeight.bold),
                                        ),
                                        countryWidget(
                                            countriesList[index]['today']
                                                ['confirmed'],
                                            'Confirmed',
                                            Colors.red),
                                        countryWidget(
                                            countriesList[index]['today']
                                                ['deaths'],
                                            'Deaths',
                                            Colors.red),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(top: 20),
                                    alignment: Alignment.topLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        rateAnalysis(
                                            countriesList[index]['latest_data']
                                                ['calculated']['recovery_rate'],
                                            'Recovery Rate',
                                            Colors.limeAccent),
                                        rateAnalysis(
                                            countriesList[index]['latest_data']
                                                ['calculated']['death_rate'],
                                            'Death Rate',
                                            Colors.limeAccent),
                                      ],
                                    ),
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

  Widget rateAnalysis(dynamic rate, String dataType, Color color) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(children: <InlineSpan>[
        TextSpan(
          text: (rate != null)
              ? '${rate.toStringAsFixed(2).toString()}\n'
              : 'No Records\n',
          style: TextStyle(
              color: color, fontSize: 18, fontWeight: FontWeight.bold),
        ),
        TextSpan(
          text: '$dataType',
          style: TextStyle(
              color: Colors.white,
              fontSize: 14,
              fontWeight: FontWeight.bold,
              height: 1.2),
        ),
      ]),
    );
  }
}
