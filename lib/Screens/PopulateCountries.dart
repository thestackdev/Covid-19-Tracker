import 'dart:convert';
import 'dart:ui';

import 'package:covid19tracker/widgets/background.dart';
import 'package:covid19tracker/widgets/countryWidget.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopulateCountries extends StatefulWidget {
  @override
  _PopulateCountriesState createState() => _PopulateCountriesState();
}

class _PopulateCountriesState extends State<PopulateCountries> {
  String toInt(dynamic number) {
    if (number != null) {
      return number.toStringAsFixed(3);
    } else {
      return 'No Analysis';
    }
  }

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
                                  color: Color.fromRGBO(3000, 3000, 3000, 0.5),
                                  borderRadius: BorderRadius.circular(30)),
                              child: Column(
                                children: <Widget>[
                                  Container(
                                    padding:
                                        EdgeInsets.only(bottom: 10, top: 5),
                                    alignment: Alignment.center,
                                    child: Text(
                                      countriesList[index]['name'],
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 27,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: <Widget>[
                                      countryWidget(
                                          countriesList[index]['latest_data']
                                              ['confirmed'],
                                          'Confirmed',
                                          Colors.orangeAccent),
                                      countryWidget(
                                          countriesList[index]['latest_data']
                                              ['recovered'],
                                          'Recovered',
                                          Colors.greenAccent),
                                      countryWidget(
                                          countriesList[index]['latest_data']
                                              ['critical'],
                                          'Criticl',
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
                                            'Confirmed',
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
          text: '${toInt(rate)}\n',
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
