import 'package:flutter/material.dart';
class Reusablecode extends StatelessWidget {
  Color colour;
  Widget cardChild;
Function ontap;

  Reusablecode({this.colour, this.cardChild,this.ontap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ontap,
      child: Container(
            child: cardChild,
            margin: EdgeInsets.all(15.0),
            decoration: BoxDecoration(
              color: colour,
              borderRadius: BorderRadius.circular(10),
            ),
          ),
    );
  }
}