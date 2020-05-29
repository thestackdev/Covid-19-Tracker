import 'package:covid19tracker/widgets/textBox.dart';
import 'package:flutter/material.dart';

class CountryScreen extends StatefulWidget {
  final Map map;

  const CountryScreen({Key key, this.map}) : super(key: key);

  @override
  _CountryScreenState createState() => _CountryScreenState();
}

class _CountryScreenState extends State<CountryScreen> {
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  String insertCommas(String number) {
    return number.replaceAllMapped(reg, mathFunc).toString();
  }

  String toInt(double number) {
    return number.toStringAsFixed(3);
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(3000, 3000, 3000, 0.5),
            borderRadius: BorderRadius.circular(30)),
        child: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Text(
                'INDIA',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              ),
            ),
            Container(
                padding: EdgeInsets.symmetric(vertical: 10),
                alignment: Alignment.center,
                decoration: BoxDecoration(
                    color: Colors.white70,
                    borderRadius: BorderRadius.circular(30)),
                child: Text(
                  'Total ${insertCommas(widget.map['timeline'][0]['confirmed'].toString())}',
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 27,
                      color: Colors.orange[900]),
                )),
            SizedBox(
              height: 10,
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
              height: 15,
            ),
            Container(
                alignment: Alignment.topLeft,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                          toInt(widget.map['latest_data']['calculated']
                              ['recovery_rate']),
                          style: TextStyle(
                              color: Colors.limeAccent,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
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
                      children: <Widget>[
                        Text(
                          toInt(widget.map['latest_data']['calculated']
                              ['death_rate']),
                          style: TextStyle(
                              color: Colors.limeAccent,
                              fontSize: 23,
                              fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Death Rate',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    )
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
