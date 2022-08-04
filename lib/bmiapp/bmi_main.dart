import 'package:flutter/material.dart';
import 'package:udemyp/bmiapp/pages/input.dart';


class BmiMain extends StatelessWidget {
  const BmiMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        primaryColor: Color(0xff0A0E21),
        scaffoldBackgroundColor: Color(0xff0A0E21),
      ),
      home: Input(),
    );
  }
}
