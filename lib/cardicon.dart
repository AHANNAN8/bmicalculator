import 'package:flutter/material.dart';
import 'constvalues.dart';

class CardIcon extends StatelessWidget {

  const CardIcon({super.key,   this.icon, this.texticn });

  final IconData? icon;    // using ? in datatype (Title?) means you use without required keyword
  final String? texticn;

  @override
  Widget build(BuildContext context) { // CARD ICON FUNCTION
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon ,
            size: 80),
        const SizedBox(height: 15),
        Text(texticn!,
          style: MytextStyle
          ),
      ],
    );
  }
}