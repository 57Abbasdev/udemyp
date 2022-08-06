import 'package:flutter/material.dart';
import 'package:udemyp/clima/screens/loading_screen.dart';



class ClimaMain extends StatelessWidget {
  const ClimaMain({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: LoadingScreen(),
    );
  }
}
