import 'package:flutter/material.dart';

class MyContainer extends StatelessWidget {
  final Color? color;
  final Widget childWidget;
  final onPress;

  MyContainer({this.color, required this.childWidget, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: color ?? const Color(0xFF1D1E33)),
        child: childWidget,
      ),
    );
  }
}
