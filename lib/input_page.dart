import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'reusable_card.dart';
import 'icon_content.dart';
import 'constants.dart';
import 'results_page.dart';
import 'calculator_brain.dart';

enum Gender { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height = 170;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text('BMI CALCULATOR'),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          // gender row
          Expanded(
            child: Row(
              children: <Widget>[
                // male card
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconGenderCard('MALE', FontAwesomeIcons.mars),
                  ),
                ),

                // female card
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: IconGenderCard('FEMALE', FontAwesomeIcons.venus),
                  ),
                ),
              ],
            ),
          ),

          // height row
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  // height label
                  Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),

                  // height in number
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      // number
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),

                      // centimeters
                      Text(
                        'cm',
                        style: kLabelTextStyle,
                      ),
                    ],
                  ),

                  // slider
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: Colors.white38,
                      thumbColor: kAccentColor,
                      overlayColor: kAccentColorShaded,
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape:
                          RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                      value: height.toDouble(),
                      min: 120.00,
                      max: 220.0,
                      onChanged: (double newValue) {
                        setState(() {
                          height = newValue.round();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),

          // weight & age row
          Expanded(
            child: Row(
              children: <Widget>[
                // weight card
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // weight label
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),

                        // weight number
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),

                        // + - buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // minus button
                            RoundIconButton(
                              operator: Operator.minus,
                              onPress: () {
                                setState(() {
                                  weight--;
                                });
                              },
                            ),

                            SizedBox(
                              width: 10.0,
                            ),

                            // plus button
                            RoundIconButton(
                              operator: Operator.plus,
                              onPress: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),

                // age card
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // age label
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),

                        // weight number
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),

                        // + - buttons
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            // minus button
                            RoundIconButton(
                              operator: Operator.minus,
                              onPress: () {
                                setState(() {
                                  age--;
                                });
                              },
                            ),

                            SizedBox(
                              width: 10.0,
                            ),

                            // plus button
                            RoundIconButton(
                              operator: Operator.plus,
                              onPress: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // bottom container
          BottomButton(
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => ResultsPage(
                          bmiResult: calc.getBMI(),
                          resultText: calc.getResult(),
                          interpretation: calc.getInterpretation(),
                        )),
              );
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
