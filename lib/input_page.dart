import 'package:bmi_calculator/calculator.dart';
import 'package:bmi_calculator/result_screen.dart';
import 'package:bmi_calculator/widgets/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
enum Gender {
  female,
  male,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColor = inactiveCardColor;
  Color femaleCardColor = inactiveCardColor;
  Gender selectedGender;
  double height = 100;
  int weight = 30;
  int age = 0;
  Widget genderCard(IconData genderIcon, String gender) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        FaIcon(
          genderIcon,
          size: 80,
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          gender,
          style: TextStyle(
            fontSize: 18,
            color: Color(0xFF8D8E98),
          ),
        )
      ],
    );
  }

  void goToResult(BuildContext context) {
    Navigator.of(context).pushNamed(Result.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: maleCardColor,
                    cardChild: genderCard(FontAwesomeIcons.mars, 'MALE'),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                        maleCardColor = activeCardColor;
                        femaleCardColor = inactiveCardColor;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: femaleCardColor,
                    cardChild: genderCard(FontAwesomeIcons.venus, 'FEMALE'),
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                        femaleCardColor = activeCardColor;
                        maleCardColor = inactiveCardColor;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                    child: ReusableCard(
                  color: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: TextStyle(
                                fontSize: 50, fontWeight: FontWeight.w900),
                          ),
                          Text(
                            'cm',
                            style: Theme.of(context).textTheme.headline6,
                          ),
                        ],
                      ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          activeTrackColor: Colors.white,
                          thumbColor: Theme.of(context).colorScheme.secondary,
                          overlayColor: Color(0x29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 30),
                        ),
                        child: Slider(
                          value: height,
                          onChanged: (val) {
                            setState(() {
                              height = val.roundToDouble();
                            });
                          },
                          inactiveColor: Color(0xFF8D8E98),
                          min: 100,
                          max: 250,
                        ),
                      ),
                    ],
                  ),
                ))
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    color: activeCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'WEIGHT',
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        Text(
                          weight.toString(),
                          style: TextStyle(
                              fontSize: 50, fontWeight: FontWeight.w900),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                              child: FaIcon(Icons.add),
                            ),
                            SizedBox(width: 10),
                            FloatingActionButton(
                              backgroundColor: Color(0xFF4C4F5E),
                              onPressed: () {
                                setState(() {
                                  weight--;
                                });
                              },
                              child: FaIcon(Icons.remove),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                    child: ReusableCard(
                  color: activeCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'AGE',
                        style: Theme.of(context).textTheme.headline6,
                      ),
                      Text(
                        age.toString(),
                        style: TextStyle(
                            fontSize: 50, fontWeight: FontWeight.w900),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          FloatingActionButton(
                            backgroundColor: Color(0xFF4C4F5E),
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: FaIcon(Icons.add),
                          ),
                          SizedBox(width: 10),
                          FloatingActionButton(
                            backgroundColor: Color(0xFF4C4F5E),
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: FaIcon(Icons.remove),
                          ),
                        ],
                      )
                    ],
                  ),
                )),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Calculator calc = Calculator(height, weight);

              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => Result(
                    bmiResult: calc.calculate(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
            child: Container(
              color: Theme.of(context).colorScheme.secondary,
              margin: EdgeInsets.only(top: 10),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.1,
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.only(bottom: 10.0),
                  child: Text(
                    'CALCULATE',
                    style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
