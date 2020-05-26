import 'package:flutter/material.dart';

class GlobalScreen extends StatefulWidget {
  final bool loading;
  final Map map;

  const GlobalScreen({Key key, this.loading, this.map}) : super(key: key);

  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Color.fromRGBO(3000, 3000, 3000, 0.5),
            borderRadius: BorderRadius.circular(30)),
        child: widget.loading
            ? CircularProgressIndicator()
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsets.only(bottom: 10),
                    child: Text(
                      'GLOBAL',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 23,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  widget.loading
                      ? Padding(
                          padding: EdgeInsets.all(5),
                          child: CircularProgressIndicator())
                      : Container(
                          padding: EdgeInsets.symmetric(vertical: 10),
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Colors.white70,
                              borderRadius: BorderRadius.circular(30)),
                          child: Text(
                            'Total ${widget.map['confirmed'].toString()}',
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
                              widget.loading
                                  ? Padding(
                                      padding: EdgeInsets.all(5),
                                      child: CircularProgressIndicator())
                                  : Text(
                                      '${widget.map['active'].toString()}',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 27,
                                          color: Colors.orange),
                                    ),
                              SizedBox(
                                height: 10,
                              ),
                              Text(
                                'Active',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 15,
                                    color: Colors.white),
                              ),
                              SizedBox(
                                height: 10,
                              ),
                              widget.loading
                                  ? Padding(
                                      padding: EdgeInsets.all(5),
                                      child: CircularProgressIndicator())
                                  : Text(
                                      widget.map['new_confirmed'].toString(),
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 25,
                                          color: Colors.white),
                                    ),
                              SizedBox(
                                height: 10,
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
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: <Widget>[
                            widget.loading
                                ? Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircularProgressIndicator())
                                : Text(
                                    widget.map['recovered'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.greenAccent),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Recovered',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            widget.loading
                                ? Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircularProgressIndicator())
                                : Text(
                                    widget.map['new_recovered'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.greenAccent),
                                  ),
                            SizedBox(
                              height: 10,
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
                        SizedBox(
                          width: 15,
                        ),
                        Column(
                          children: <Widget>[
                            widget.loading
                                ? Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircularProgressIndicator())
                                : Text(
                                    widget.map['deaths'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.redAccent),
                                  ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Deaths',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15,
                                  color: Colors.white),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            widget.loading
                                ? Padding(
                                    padding: EdgeInsets.all(5),
                                    child: CircularProgressIndicator())
                                : Text(
                                    widget.map['new_deaths'].toString(),
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 25,
                                        color: Colors.redAccent),
                                  ),
                            SizedBox(
                              height: 10,
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
