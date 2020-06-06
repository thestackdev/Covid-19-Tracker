import 'package:covid19tracker/widgets/textBox.dart';
import 'package:flutter/material.dart';
import '../widgets/insertCommas.dart';

class CountryScreen extends StatefulWidget {
  final Map map;

  const CountryScreen({Key key, this.map}) : super(key: key);

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.black, borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  'INDIA',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
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
                        '${InsertCommas().insertCommas(widget.map['timeline'][0]['confirmed'].toString())}',
                    style: TextStyle(
                        color: Colors.deepOrangeAccent,
                        fontSize: 25,
                        fontWeight: FontWeight.bold),
                  )
                ])),
              ],
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  textBox(
                      widget.map['timeline'][0]['active'],
                      widget.map['timeline'][0]['new_confirmed'],
                      'Active',
                      Colors.orange),
                  textBox(
                      widget.map['timeline'][0]['recovered'],
                      widget.map['timeline'][0]['new_recovered'],
                      'Recovered',
                      Colors.greenAccent),
                  textBox(
                      widget.map['timeline'][0]['deaths'],
                      widget.map['timeline'][0]['new_deaths'],
                      'Deaths',
                      Colors.redAccent),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          widget.map['latest_data']['calculated']
                                  ['recovery_rate']
                              .toStringAsExponential(2),
                          style: TextStyle(
                              color: Colors.limeAccent,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Recovery Rate',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                          widget.map['latest_data']['calculated']['death_rate']
                              .toStringAsFixed(2),
                          style: TextStyle(
                              color: Colors.limeAccent,
                              fontSize: 19,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Death Rate',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                )),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
