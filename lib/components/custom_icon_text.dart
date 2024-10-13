import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';
import '../utils/size_config.dart';

class CustomIconText extends StatelessWidget {
  const CustomIconText({
    Key? key,
    required this.text,
    this.icon,
    this.svg,
    this.isPrefix = true,
    this.iconColor = kBlackColor,
    this.textColor = kBlackColor,
    this.fontSize = 15,
    this.iconSize = 15,
    this.of = 10,
    this.fontWeight,
    this.letterSpacing = 0,
    this.wordSpacing,
  }) : super(key: key);
  final String text;
  final IconData? icon;
  final String? svg;
  final bool isPrefix;
  final Color iconColor;
  final Color textColor;
  final double fontSize;
  final double iconSize;
  final double of;
  final FontWeight? fontWeight;
  final double letterSpacing;
  final double? wordSpacing;
  // final

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      // mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        if (isPrefix && icon != null)
          Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        if (isPrefix && svg != null)
          SvgPicture.asset(
            svg!,
            color: iconColor,
            height: iconSize,
          ),
        HorizontalSpacing(of: isPrefix ? of : 0),
        Text(
          text,
          style: TextStyle(
            color: textColor,
            fontSize: fontSize,
            fontWeight: fontWeight,
            letterSpacing: letterSpacing,
            wordSpacing: wordSpacing,
          ),
        ),
        HorizontalSpacing(of: !isPrefix ? of : 0),
        if (!isPrefix && icon != null)
          Icon(
            icon,
            color: iconColor,
            size: iconSize,
          ),
        if (!isPrefix && svg != null)
          SvgPicture.asset(
            svg!,
            color: iconColor,
            height: iconSize,
          ),
      ],
    );
  }
}
