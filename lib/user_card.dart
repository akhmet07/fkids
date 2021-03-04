import 'package:flutter/material.dart';

class UserCard extends StatelessWidget {
  final String name;
  final String age;

  UserCard({Key key, this.name, this.age}) : super(key: key);

  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(20),
        child: Container(
          color: Colors.green,
          padding: EdgeInsets.all(20),
          child: Row(
            children: <Widget>[Text(name), Text(age)],
          ),
        ));
  }
}