import 'dart:convert';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PopulateCountries extends StatefulWidget {
  @override
  _PopulateCountriesState createState() => _PopulateCountriesState();
}

class _PopulateCountriesState extends State<PopulateCountries> {
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  String insertCommas(String number) {
    return number.replaceAllMapped(reg, mathFunc).toString();
  }

  String toInt(dynamic number) {
    print(number);
    return number.toStringAsFixed(3);
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
                                      Column(
                                        children: <Widget>[
                                          Text(
                                              countriesList[index]
                                                          ['latest_data']
                                                      ['confirmed']
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
                                              countriesList[index]
                                                          ['latest_data']
                                                      ['recovered']
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
                                              countriesList[index]
                                                          ['latest_data']
                                                      ['critical']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold)),
                                          Text('Critical',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold)),
                                        ],
                                      ),
                                      Column(
                                        children: <Widget>[
                                          Text(
                                              countriesList[index]
                                                      ['latest_data']['deaths']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.red,
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
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              countriesList[index]['today']
                                                      ['confirmed']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.orangeAccent,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Confirmed',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              countriesList[index]['today']
                                                      ['deaths']
                                                  .toString(),
                                              style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 30,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              'Deaths',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
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
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              countriesList[index][
                                                                  'latest_data']
                                                              ['calculated']
                                                          ['recovery_rate'] !=
                                                      null
                                                  ? toInt(countriesList[index]
                                                              ['latest_data']
                                                          ['calculated']
                                                      ['recovery_rate'])
                                                  : 'null',
                                              style: TextStyle(
                                                  color: Colors.orangeAccent,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Recovery Rate',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: <Widget>[
                                            Text(
                                              countriesList[index][
                                                                  'latest_data']
                                                              ['calculated']
                                                          ['recovery_rate'] !=
                                                      null
                                                  ? toInt(countriesList[index]
                                                              ['latest_data']
                                                          ['calculated']
                                                      ['death_rate'])
                                                  : 'null',
                                              style: TextStyle(
                                                  color: Colors.redAccent,
                                                  fontSize: 18,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Text(
                                              'Death Rate',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ],
                                        ),
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
}
