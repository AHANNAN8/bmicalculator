import 'package:flutter/material.dart';

class NewCard extends StatelessWidget {
  // const newcard({
  //   super.key,        METHOD 1
  // });
  // METHOD 2
  const NewCard({super.key,  required this.colour,  this.cardChild, this.onPress});
  final Color colour;
  final Widget? cardChild ;
  final VoidCallback? onPress ;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,

      child: Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: colour,
      ),
      child: cardChild,)
    );
  }
}