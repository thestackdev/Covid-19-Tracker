import 'dart:convert';

import 'package:covid19tracker/Screens/CountryScreen.dart';
import 'package:covid19tracker/Screens/GlobalScreen.dart';
import 'package:covid19tracker/Screens/PopulateCountries.dart';
import 'package:covid19tracker/Screens/PopulateStates.dart';
import 'package:covid19tracker/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'Screens/StateScreen.dart';

void main() {
  runApp(MaterialApp(
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;

  var globalMap;
  var countryMap;
  var telanganaMap;
  var stateList;
  Map hyderabadMap;

  fetchAPIData() async {
    while (loading) {
      final globalResponse = await http.get('https://corona-api.com/timeline');
      final countryResponse =
          await http.get('http://corona-api.com/countries/in');
      final stateResponse =
          await http.get('https://api.covidindiatracker.com/state_data.json');

      if (globalResponse.statusCode == 200 &&
          countryResponse.statusCode == 200 &&
          stateResponse.statusCode == 200) {
        globalMap = json.decode(globalResponse.body);
        globalMap = globalMap['data'][0];

        countryMap = json.decode(countryResponse.body);
        countryMap = countryMap['data'];

        stateList = json.decode(stateResponse.body);

        stateList.forEach((element) {
          if ((element['id'] == 'IN-TG')) {
            telanganaMap = element;
          }
        });

        setState(() {
          loading = false;
        });
      }
    }
  }

  @override
  void initState() {
    fetchAPIData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                body: Stack(
                children: <Widget>[
                  backGround(),
                  SingleChildScrollView(
                      child: Column(
                    children: <Widget>[
                      SizedBox(
                        height: 30,
                      ),
                      Column(
                        children: <Widget>[
                          GestureDetector(
                            onTap: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PopulateCountries())),
                            child: GlobalScreen(
                              map: globalMap,
                            ),
                          ),
                          GestureDetector(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      PopulateStates(statesList: stateList)),
                            ),
                            child: CountryScreen(
                              map: countryMap,
                            ),
                          ),
                          StateScreen(map: telanganaMap),
                        ],
                      ),
                    ],
                  )),
                ],
              )));
  }
}
