import 'package:flutter/material.dart';
import 'package:udemyp/bmiapp/reusable.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon.dart';
import 'constants.dart';

class Input extends StatefulWidget {
  const Input({Key? key}) : super(key: key);

  @override
  State<Input> createState() => _InputState();
}

//font_awesome_flutter
class _InputState extends State<Input> {
  var age, weight;
  int height = 180;
  Gender selectedGender = Gender.male;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text("Bmi Calculator"),
        ),
        body: Column(
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                      child: MyContainer(
                    onPress: () {
                      setState(() {
                        print("1");
                        selectedGender = Gender.male;
                      });
                    },
                    color: selectedGender == Gender.male
                        ? kActiveColor
                        : kInActiveColor,
                    childWidget: const IconContent(
                      icon: FontAwesomeIcons.mars,
                      title: Text(
                        "MALE",
                        style: kLabelStyle,
                      ),
                    ),
                  )),
                  Expanded(
                      child: MyContainer(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    color: selectedGender == Gender.female
                        ? kActiveColor
                        : kInActiveColor,
                    childWidget: IconContent(
                      title: Text(
                        "FEMALE",
                        style: kLabelStyle,
                      ),
                      icon: FontAwesomeIcons.venus,
                    ),
                  )),
                ],
              ),
            ),
            Expanded(
                child: MyContainer(
              onPress: () {
                setState(() {});
              },
              color: kActiveColor,
              childWidget: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("HEIGHT"),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: kStrongStyle,
                      ),
                      Text("cm"),
                    ],
                  ),
                  SliderTheme(
                    // this .of() method will change only those attribute that you provide here
                    data: SliderTheme.of(context).copyWith(
                        inactiveTrackColor: kInActiveColor,
                        activeTrackColor: Colors.white,
                        thumbColor: kBottomContainer,
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                            const RoundSliderThumbShape(enabledThumbRadius: 15),
                        overlayShape:
                            const RoundSliderOverlayShape(overlayRadius: 30)),
                    child: Slider(
                        value: height.toDouble(),
                        min: 20.0,
                        max: 250,
                        onChanged: (newValue) {
                          print(newValue);
                          setState(() {
                            height = newValue.round();
                          });
                        }),
                  )
                ],
              ),
            )),
            Row(
              children: [
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: MyContainer(
                        onPress: () {
                          setState(() {});
                        },
                        childWidget: Column(
                          children: [
                            Text("AGE"),
                            Text(age.toString()),
                            Row(
                              children: [Icon(Icons.add), Icon(Icons.remove)],
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
                Expanded(
                  child: Row(
                    children: [
                      Expanded(
                          child: MyContainer(
                        onPress: () {
                          setState(() {});
                        },
                        childWidget: Column(
                          children: [
                            Text("AGE"),
                            Text(age.toString()),
                            Row(
                              children: [Icon(Icons.add), Icon(Icons.remove)],
                            )
                          ],
                        ),
                      )),
                    ],
                  ),
                ),
              ],
            )
          ],
        ));
  }
//0xFF8D8E98
//0xFF1D1E33
}

enum Gender { male, female }
