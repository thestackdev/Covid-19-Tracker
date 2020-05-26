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
    print(number);
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
                  Container(
                    child: Column(
                      children: <Widget>[
                        Text(
                          insertCommas(widget.map['timeline'][0]['active'].toString()),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 27,
                              color: Colors.orange),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'Active',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          insertCommas(widget.map['timeline'][0]['new_confirmed'].toString()),
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: Colors.orange),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          'New',
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 15,
                              color: Colors.white),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        insertCommas(widget.map['timeline'][0]['recovered'].toString()),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.greenAccent),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Recovered',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        insertCommas(widget.map['timeline'][0]['new_recovered'].toString()),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.greenAccent),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'New',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text(
                        insertCommas(widget.map['timeline'][0]['deaths'].toString()),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.redAccent),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'Deaths',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                      SizedBox(
                        height: 15,
                      ),
                      Text(
                        insertCommas(widget.map['timeline'][0]['new_deaths'].toString()),
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 25,
                            color: Colors.redAccent),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        'New',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 15,
                            color: Colors.white),
                      ),
                    ],
                  ),
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
