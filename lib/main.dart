import 'dart:convert';

import 'package:covid19tracker/Screens/CountryScreen.dart';
import 'package:covid19tracker/Screens/GlobalScreen.dart';
import 'package:covid19tracker/Screens/PopulateCountries.dart';
import 'package:covid19tracker/Screens/PopulateStates.dart';
import 'package:covid19tracker/widgets/background.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:connectivity/connectivity.dart';

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
  var connectivityResult;
  var result;

  fetchAPIData() async {
    connectivityResult = await (Connectivity().checkConnectivity());

    setState(() {
      result = connectivityResult.toString();
    });

    if (connectivityResult != ConnectivityResult.none) {
      while (loading) {
        final globalResponse =
            await http.get('https://corona-api.com/timeline');
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
  }

  @override
  void initState() {
    fetchAPIData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black45,
      body: AnnotatedRegion<SystemUiOverlayStyle>(
          value: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
          ),
          child: loading
              ? Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      height: 300,
                    ),
                    CircularProgressIndicator(
                      backgroundColor: Colors.deepOrangeAccent,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      alignment: Alignment.center,
                      child: Text(
                        'Refreshing Data',
                        style: TextStyle(
                            color: Colors.deepOrangeAccent,
                            fontWeight: FontWeight.bold,
                            fontSize: 21,
                            letterSpacing: 1.5),
                      ),
                    ),
                    (result == ConnectivityResult.none)
                        ? Center(
                            child: Text(
                            'No Internet Connection',
                            style: TextStyle(
                                color: Colors.deepOrangeAccent, fontSize: 21),
                          ))
                        : Text('')
                  ],
                )
              : Scaffold(
                  appBar: AppBar(
                    backgroundColor: Colors.black87,
                    title: Text(
                      'Corona Analysis',
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
                      SingleChildScrollView(
                          child: Column(
                        children: <Widget>[
                          SizedBox(
                            height: 10,
                          ),
                          Column(
                            children: <Widget>[
                              GestureDetector(
                                onTap: () => Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            PopulateCountries())),
                                child: GlobalScreen(
                                  map: globalMap,
                                ),
                              ),
                              GestureDetector(
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
                              StateScreen(map: telanganaMap),
                            ],
                          ),
                        ],
                      )),
                    ],
                  ))),
    );
  }
}
