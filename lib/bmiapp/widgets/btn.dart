import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CounterButton extends StatelessWidget {
   const CounterButton({Key? key,required this.icon, this.onPress}) : super(key: key);

  final IconData icon;
  final  onPress;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: onPress,
      child: Icon(icon),
      elevation: 6,
      fillColor: Color(0xFF4C4F5E),
      constraints: BoxConstraints.tightFor(
        width: 48,
        height: 48,

      ),
      shape: CircleBorder(),

    );
  }
}
