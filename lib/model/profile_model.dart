import 'package:flutter/material.dart';

class ProfileModel extends StatelessWidget {
  final Icon icon;
  final String text;
  final String value;
  const ProfileModel({
    Key key,
    this.icon,
    this.text,
    this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: ListTile(
        leading: icon,
        title: Text(
          text,
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        trailing: Text(
          '$value',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
