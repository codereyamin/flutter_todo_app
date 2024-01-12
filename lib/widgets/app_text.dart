import 'dart:math';

import 'package:flutter/material.dart';

class AppText extends StatelessWidget {
  final String text;
  final double minFontSize;
  final double maxFontSize;
  final TextAlign? textAlign;
  final Color? color;

  const AppText({
    super.key,
    required this.text,
    this.minFontSize = 16,
    this.maxFontSize = 32,
    this.textAlign,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double scaleFactor = screenWidth /
        375.0; // Adjust 375.0 according to your design reference width

    double fontSize = max(minFontSize, min(maxFontSize, 16 * scaleFactor));

    return Text(
      text,
      textAlign: textAlign,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );
  }
}
