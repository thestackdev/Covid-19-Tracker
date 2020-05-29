import 'dart:ui';

import 'package:covid19tracker/Screens/PopulateDistricts.dart';
import 'package:covid19tracker/widgets/countryWidget.dart';
import 'package:flutter/material.dart';

class PopulateStates extends StatefulWidget {
  const PopulateStates({Key key, this.statesList}) : super(key: key);

  final List<dynamic> statesList;

  @override
  _PopulateStatesState createState() => _PopulateStatesState();
}

class _PopulateStatesState extends State<PopulateStates> {
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');

  Function mathFunc = (Match match) => '${match[1]},';

  String insertCommas(String number) {
    return number.replaceAllMapped(reg, mathFunc).toString();
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
                'State Alanysis',
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
                              color: Color.fromRGBO(3000, 3000, 3000, 0.5),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
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
                }),
          )
        ],
      ),
    );
  }
}
