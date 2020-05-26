import 'package:flutter/material.dart';

class GlobalScreen extends StatefulWidget {
  final bool loading;
  final Map map;

  const GlobalScreen({Key key, this.loading, this.map}) : super(key: key);

  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  String insertCommas(String number) {
    return number.replaceAllMapped(reg, mathFunc).toString();
  }

  @override
  Widget build(BuildContext context) {
    return widget.loading
        ? CircularProgressIndicator()
        : Padding(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Container(
              padding: EdgeInsets.all(5),
              decoration: BoxDecoration(
                  color: Color.fromRGBO(3000, 3000, 3000, 0.5),
                  borderRadius: BorderRadius.circular(30)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'GLOBAL',
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
                        'Total ${insertCommas(widget.map['confirmed'].toString())}',
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
                                '${insertCommas(widget.map['active'].toString())}',
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
                                insertCommas(
                                    widget.map['new_confirmed'].toString()),
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
                          children: <Widget>[
                            Text(
                              insertCommas(widget.map['recovered'].toString()),
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
                              insertCommas(
                                  widget.map['new_recovered'].toString()),
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
                          children: <Widget>[
                            Text(
                              insertCommas(widget.map['deaths'].toString()),
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
                              insertCommas(widget.map['new_deaths'].toString()),
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
                ],
              ),
            ),
          );
  }
}
