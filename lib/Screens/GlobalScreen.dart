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
            color: Color.fromRGBO(3000, 3000, 3000, 0.3),
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
                  'Total ${InsertCommas().insertCommas(widget.map['confirmed'].toString())}',
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
                  textBox(widget.map['active'], widget.map['new_confirmed'],
                      'Active', Colors.deepOrangeAccent),
                  textBox(widget.map['recovered'], widget.map['new_recovered'],
                      'Recovered', Colors.greenAccent),
                  textBox(widget.map['deaths'], widget.map['new_deaths'],
                      'Death', Colors.redAccent),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

 
}
