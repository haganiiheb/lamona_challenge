import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';

class CustomListTile extends StatelessWidget {
  const CustomListTile(
      {Key? key,
      required this.title,
      required this.icon,
      required this.press,
      this.iconColor,
      this.iconSize = 18,
      this.fontSize = 13.5,
      this.textColor = kBlackColor,
      this.fontWeight = FontWeight.w500,
      this.horizontal = 10,
      this.vertical = 5,
      this.borderOpacity = .25,
      this.borderWidth = 1,
      this.borderRadius = 5})
      : super(key: key);
  final String title;
  final String icon;
  final GestureTapCallback press;
  final Color? iconColor;
  final double iconSize;
  final Color textColor;
  final FontWeight fontWeight;
  final double fontSize;
  final double horizontal;
  final double vertical;
  final double borderOpacity;
  final double borderWidth;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: horizontal,
          vertical: vertical,
        ),
        decoration: BoxDecoration(
          // border: Border.all(
          //   width: borderWidth,
          //   color: textColor.withOpacity(borderOpacity),
          // ),
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        child: Row(
          children: [
            SvgPicture.asset(
              icon,
              width: iconSize,
              color: iconColor,
              // theme: const SvgTheme(
              //   xHeight: 5,
              //   fontSize: 18,
              // ),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.symmetric(
                  // vertical:10),
                  horizontal: horizontal,
                ),
                child: Text(
                  title,
                  style: TextStyle(
                    color: textColor,
                    fontSize: fontSize,
                    fontWeight: fontWeight,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: iconColor,
              size: 18,
            )
          ],
        ),
      ),
    );
  }
}
