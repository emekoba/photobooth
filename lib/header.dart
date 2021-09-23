import 'package:flutter/material.dart';

class Header extends StatefulWidget {
  const Header({Key key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  Color _color = Colors.black;

  void changeHeaderColor() {
    setState(
        () => _color = _color == Colors.black ? Colors.white : Colors.black);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 150,
        color: _color,
        child: ButtonBar(children: [
          ElevatedButton(
              child: Text('Feed'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, onPrimary: Colors.black),
              onPressed: () => Navigator.pushNamed(context, "/feed")),
          ElevatedButton(
              child: Text('Library'),
              style: ElevatedButton.styleFrom(
                  primary: Colors.white, onPrimary: Colors.black),
              onPressed: () => Navigator.pushNamed(context, "/library"))
        ]));
  }
}
