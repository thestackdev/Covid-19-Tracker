import 'package:covid19tracker/widgets/countryWidget.dart';
import 'package:covid19tracker/widgets/insertCommas.dart';
import 'package:flutter/material.dart';

import 'PopulateDistricts.dart';

class StateScreen extends StatefulWidget {
  final Map map;

  const StateScreen({Key key, this.map}) : super(key: key);

  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(5),
      child: GestureDetector(
        onTap: () => Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PopulateDistricts(
                    districtList: widget.map['districtData']))),
        child: Container(
            padding: EdgeInsets.symmetric(vertical: 10),
            decoration: BoxDecoration(
                color: Colors.black, borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10, top: 5),
                  alignment: Alignment.center,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        widget.map['state'],
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
                              '${InsertCommas().insertCommas(widget.map['confirmed'].toString())}',
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
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    countryWidget(
                        widget.map['active'], 'Active', Colors.orangeAccent),
                    countryWidget(widget.map['recovered'], 'Recovered',
                        Colors.greenAccent),
                    countryWidget(widget.map['deaths'], 'Deaths', Colors.red),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
