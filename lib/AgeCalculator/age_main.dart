import 'package:flutter/material.dart';


class AgeMain extends StatelessWidget {
  const AgeMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(body: Column(
        children: [
          Text("Age Calculator")
        ],
      ),),
    );
  }
}
