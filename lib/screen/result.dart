import 'package:bmi_app/app_widget/reusable_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
static const routName='/resultScreen';
ResultScreen(
{@required this.interpretation,
@required this.bmiResult,
@required this.resultText});

final String bmiResult;
final String resultText;
final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text('BMI Calculator'),
    ),
    body:
      Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
        Expanded(
        child: Container(
        padding: EdgeInsets.all(15.0),
        alignment: Alignment.bottomLeft,
        child: Text(
          'Your Result',
          style: TextStyle(fontSize: 50,fontWeight:FontWeight.w900),),

    ),),
          Expanded(
            flex: 5,
            child: Reusablecode(
              colour: Color(0xFF1D1E33),
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: TextStyle(
                      color: Color(0xFF24D876),
                      fontSize: 22.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                      fontSize: 100.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 22.0,
                    ),
                  ),
                ],
              ),
            ),
          ),


          FlatButton(onPressed:(){

            Navigator.of(context).pop();
          } ,
            child: Text('Re-Calculate',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
            color:  Color(0xffeb1553),
            padding: EdgeInsets.only(top: 10,bottom: 0),
            minWidth: double.infinity,
            height:60,
          ),
    ]
      ),
    );
  }
}
