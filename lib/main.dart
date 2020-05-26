import 'dart:convert';
import 'dart:ui';

import 'package:covid19tracker/Screens/CountryScreen.dart';
import 'package:covid19tracker/Screens/GlobalScreen.dart';
import 'package:covid19tracker/Screens/PopulateCountries.dart';
import 'package:covid19tracker/Screens/PopulateStates.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;

import 'Screens/StateScreen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
    theme: ThemeData(
      primaryColor: Colors.lightBlueAccent,
    ),
  ));
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool globalLoading = true;
  bool countryLoading = true;
  bool stateLoading = true;

  Map<String, dynamic> globalMap;
  Map<String, dynamic> countryMap;
  List<dynamic> stateList;
  Map<String, dynamic> stateMap;

  int indexOfTg;

  fetchAPIdata() async {
    while (true) {
      final response = await http.get('https://corona-api.com/timeline');
      if (response.statusCode == 200) {
        globalMap = json.decode(response.body);
        globalMap = globalMap['data'][0];

        setState(() {
          globalLoading = false;
        });
        break;
      }
    }
    while (true) {
      final response = await http.get('http://corona-api.com/countries/in');

      if (response.statusCode == 200) {
        countryMap = json.decode(response.body);
        countryMap = countryMap['data'];

        setState(() {
          countryLoading = false;
        });
        break;
      }
    }

    while (true) {
      final response =
          await http.get('https://api.covidindiatracker.com/state_data.json');

      if (response.statusCode == 200) {
        stateList = json.decode(response.body);

        indexOfTg = stateList.indexWhere((element) {
          if (element['id'] == 'IN-TG') {
            return true;
          }
          return false;
        });

        setState(() {
          stateLoading = false;
        });
        break;
      }
    }
  }

  @override
  void initState() {
    fetchAPIdata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AnnotatedRegion<SystemUiOverlayStyle>(
        value: SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        ),
        child: Scaffold(
            backgroundColor: Colors.amberAccent,
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
                      decoration: new BoxDecoration(
                          color: Colors.black.withOpacity(0.5)),
                    ),
                  ),
                ),
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
                            loading: globalLoading,
                            map: globalMap,
                          ),
                        ),
                        countryLoading
                            ? Padding(
                                padding: EdgeInsets.all(100),
                                child: Center(
                                  child: CircularProgressIndicator(),
                                ),
                              )
                            : GestureDetector(
                                onTap: () => Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => PopulateStates(
                                          statesList: stateList)),
                                ),
                                child: CountryScreen(
                                  map: countryMap,
                                ),
                              ),
                        stateLoading
                            ? CircularProgressIndicator()
                            : StateScreen(
                                map: stateList[indexOfTg]),
                      ],
                    ),
                  ],
                )),
              ],
            )));
  }
}
