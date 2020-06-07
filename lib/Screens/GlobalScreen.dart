import 'package:covid19tracker/widgets/insertCommas.dart';
import 'package:covid19tracker/widgets/textBox.dart';
import 'package:flutter/material.dart';

class GlobalScreen extends StatefulWidget {
  final Map map;

  const GlobalScreen({Key key, this.map}) : super(key: key);

  @override
  _GlobalScreenState createState() => _GlobalScreenState();
}

class _GlobalScreenState extends State<GlobalScreen> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Colors.black87, borderRadius: BorderRadius.circular(30)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Text(
                    'Global',
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
                          '${InsertCommas().insertCommas(widget.map['confirmed'].toString())}',
                      style: TextStyle(
                          color: Colors.deepOrangeAccent,
                          fontSize: 18,
                          fontWeight: FontWeight.bold),
                    )
                  ])),
                ],
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  textBox(widget.map['active'], widget.map['new_confirmed'],
                      'Active', Colors.deepOrangeAccent),
                  textBox(widget.map['recovered'], widget.map['new_recovered'],
                      'Recovered', Colors.greenAccent),
                  textBox(widget.map['deaths'], widget.map['new_deaths'],
                      'Death', Colors.redAccent),
                ],
              ),
            ),
            Container(
              child: Text('test'),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
