import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ButtonWidget extends StatelessWidget {
  final Function onPressButton;
  // final Widget child;
  double height, width;
  // MaterialColor color;
  String? label;
  double radius;
  String buttonText;
  MaterialColor buttonColor;

  ButtonWidget(
      {required this.height,
      required this.width,
      required this.onPressButton,
      this.radius = 10,
      this.buttonColor = Colors.purple,
      // required this.color,
      required this.buttonText,
      this.label});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressButton(),
      child: Container(
        alignment: Alignment.center,
        // margin: const EdgeInsets.only(top: 30.0),
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(radius),
        ),
        width: width,
        height: height,
        child: Text(
          buttonText,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontFamily: GoogleFonts.lato().fontFamily),
        ),
      ),
    );
  }
}
