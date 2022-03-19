import 'package:flutter/material.dart';
class IconContent extends StatelessWidget {
  IconData iconType;
  String text;
  IconContent({this.iconType,this.text});
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          iconType,
          size: 80,
        ),
        SizedBox(
          height: 18,
        ),
        Text(
          text,
          style: TextStyle(fontSize: 15),
        ),
      ],
    );
  }
}