import 'package:flutter/material.dart';

import 'PopulateDistricts.dart';

class StateScreen extends StatefulWidget {
  final Map map;

  const StateScreen({Key key, this.map}) : super(key: key);

  @override
  _StateScreenState createState() => _StateScreenState();
}

class _StateScreenState extends State<StateScreen> {
  RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
  Function mathFunc = (Match match) => '${match[1]},';

  String insertCommas(String number) {
    return number.replaceAllMapped(reg, mathFunc).toString();
  }

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
                color: Color.fromRGBO(3000, 3000, 3000, 0.5),
                borderRadius: BorderRadius.circular(30)),
            child: Column(
              children: <Widget>[
                Container(
                  padding: EdgeInsets.only(bottom: 10, top: 5),
                  alignment: Alignment.center,
                  child: Text(
                    widget.map['state'],
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Text(
                            insertCommas(widget.map['confirmed']
                                .toString()),
                            style: TextStyle(
                                color: Colors.deepOrangeAccent,
                                fontSize: 27,
                                fontWeight: FontWeight.bold)),
                        Text('Confirmed',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                            insertCommas(
                                widget.map['active'].toString()),
                            style: TextStyle(
                                color: Colors.orangeAccent,
                                fontSize: 27,
                                fontWeight: FontWeight.bold)),
                        Text('Active',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                            insertCommas(widget.map['recovered']
                                .toString()),
                            style: TextStyle(
                                color: Colors.greenAccent,
                                fontSize: 27,
                                fontWeight: FontWeight.bold)),
                        Text('Recovered',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Text(
                            insertCommas(
                                widget.map['deaths'].toString()),
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 27,
                                fontWeight: FontWeight.bold)),
                        Text('Deaths',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 14,
                                fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ],
                ),
              ],
            )),
      ),
    );
  }
}
