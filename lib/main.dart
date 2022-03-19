import 'package:bmi_app/screen/home_page.dart';
import 'package:bmi_app/screen/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(BmiCalculater());
}

class BmiCalculater extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculater',
      theme:
          ThemeData.dark().copyWith(scaffoldBackgroundColor: Color(0xFF1D1E33),),
      home: HomePage(),
      routes: {
        ResultScreen.routName:(ctx)=>ResultScreen(),
      },
    );

  }
}



