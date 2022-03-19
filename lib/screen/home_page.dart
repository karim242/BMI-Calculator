import 'package:bmi_app/app_widget/icon_content.dart';
import 'package:bmi_app/app_widget/reusable_card.dart';
import 'package:bmi_app/app_widget/round_icon_button.dart';
import 'package:bmi_app/screen/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../calculate.dart';
import '../constant.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Color maleCardColour = kInActiveColor;
  Color femaleCardColour = kInActiveColor;

  void updateCardColor(int gender) {
    if (gender == 1) {
      if (maleCardColour == kInActiveColor) {
        maleCardColour = kActiveColor;
        femaleCardColour = kInActiveColor;
      } else {
        maleCardColour = kInActiveColor;
      }
    }
    if (gender == 2) {
      if (femaleCardColour == kInActiveColor) {
        femaleCardColour = kActiveColor;
        maleCardColour = kInActiveColor;
      } else {
        femaleCardColour = kInActiveColor;
      }
    }
  }

  int height = 160;
  int weight = 60;
  int age = 19;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculater'),
      ),
      body: Column(children: [
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Reusablecode(
                          colour: maleCardColour,
                          cardChild: IconContent(
                            iconType: FontAwesomeIcons.mars,
                            text: 'MALE',
                          ),
                          ontap: () {
                            setState(() {
                              updateCardColor(1);
                            });
                          }),
                    ),
                    Expanded(
                      child: Reusablecode(
                        colour: femaleCardColour,
                        cardChild: IconContent(
                          iconType: FontAwesomeIcons.venus,
                          text: 'FEMALE',
                        ),
                        ontap: () {
                          setState(() {
                            updateCardColor(2);
                          });
                        },
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Reusablecode(
                  colour: kInActiveColor,
                  cardChild: Column(
                // textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(fontSize: 18),
                      ),
                      SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                       textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text('$height', style: TextStyle(fontSize: 30)),
                          Text(
                            'cm',
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 120,
                        max: 220,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.round();
                          });
                        },
                        activeColor: Color(0xffeb1553),
                        inactiveColor: Color(0xff8d8e98),
                      )
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: Row(
            children: [
              Expanded(
                child: Row(
                  children: [
                    Expanded(
                      child: Reusablecode(
                        colour: kInActiveColor,
                        cardChild: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'WEIGHT',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '$weight',
                              style: TextStyle(fontSize: 30),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: () {
                                    setState(() {
                                     weight--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpress: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Reusablecode(
                        colour: kInActiveColor,
                        cardChild: Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              'AGE',
                              style: TextStyle(fontSize: 15),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Text(
                              '$age',
                              style: TextStyle(fontSize: 30),
                            ),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                RoundIconButton(
                                  icon: FontAwesomeIcons.minus,
                                  onpress: () {
                                    setState(() {
                                      age--;
                                    });
                                  },
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                RoundIconButton(
                                  icon: FontAwesomeIcons.plus,
                                  onpress: () {
                                    setState(() {
                                      age++;
                                    });
                                  },
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
        FlatButton(onPressed:(){
          Calculator calc =
          Calculator(height: height, weight: weight);
          //pass variable to ResultScreen to Calculates
          Navigator.push(
              context,
              MaterialPageRoute(
              builder: (context) => ResultScreen(
            bmiResult: calc.calculateBMI(),
            resultText: calc.getResult(),
            interpretation: calc.getInterpretation(),
          ),
          ),);
        } ,
          child: Text('Calculate',style: TextStyle(fontSize: 25,fontWeight: FontWeight.bold),),
          color:  Color(0xffeb1553),
          padding: EdgeInsets.only(top: 10),
          minWidth: double.infinity,
          height: 56,
        ),
      ]),
    );
  }
}

