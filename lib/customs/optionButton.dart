import 'package:demo/constants.dart';
import 'package:demo/widget_functions.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class OptionButton extends StatelessWidget {
  final String? text;
  final IconData? icon;
  final double? width;

  OptionButton({ this.text, this.icon, this.width});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      child: TextButton(
        style: TextButton.styleFrom(
          backgroundColor: COLOR_DARK_BLUE,
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(50),
          ),
        ),
        onPressed: (){
          //add your action here
        },
        child: Row(
          children: [
            Icon(
              icon,
              color: COLOR_WHITE,
            ),
            addHorizontalSpace(10),
            Text(
              text!,
              style: TextStyle(color: COLOR_WHITE),
            ),
          ],
        ),
      ),
    );
  }
}
