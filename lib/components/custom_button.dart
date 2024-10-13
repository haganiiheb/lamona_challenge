import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    Key? key,
    required this.text,
    required this.press,
    this.inactivePress,
    this.width,
    this.vertical = 0,
    this.horizontal = 0,
    this.radius = 10,
    this.backgroundColor = kPrimaryColor,
    this.textColor = kWhiteColor,
    this.borderColor,
    this.fontSize = 15,
    this.fontWeight = FontWeight.w500,
    this.textAlign = TextAlign.center,
    this.textStyle,
    this.boxShaddow,
    this.isActive = true,
    this.inactiveBackgroundColor,
    this.inactiveTextColor,
    this.inactiveborderColor,
    this.isLoading = false,
    this.circularIndicatorHeight = 20,
    this.circularIndicatorWidth = 20,
    this.circularIndicatorColor,
    this.circularIndicatorOpacity = .15,
    this.borderWidth = 1.0,
  }) : super(key: key);
  final String text;
  final GestureTapCallback press;
  final GestureTapCallback? inactivePress;
  final double? width;
  final double vertical;
  final double horizontal;
  final double radius;
  final Color backgroundColor;
  final Color textColor;
  final Color? borderColor;
  final double fontSize;
  final FontWeight fontWeight;
  final TextAlign textAlign;
  final TextStyle? textStyle;
  final List<BoxShadow>? boxShaddow;
  final bool isActive;
  final Color? inactiveBackgroundColor;
  final Color? inactiveTextColor;
  final Color? inactiveborderColor;
  final bool isLoading;
  final double circularIndicatorHeight;
  final double circularIndicatorWidth;
  final Color? circularIndicatorColor;
  final double circularIndicatorOpacity;
  final double borderWidth;
  // String
  // final

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: !isLoading
          ? isActive
              ? press
              : inactivePress
          : () {},
      child: Container(
        width: width,
        padding:
            EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
        decoration: BoxDecoration(
          color: isActive ? backgroundColor : inactiveBackgroundColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            color: (isActive
                    ? borderColor ?? (backgroundColor)
                    : inactiveborderColor ?? inactiveBackgroundColor) ??
                Colors.white,
            width: borderWidth,
          ),
          boxShadow: boxShaddow,
        ),
        child: !isLoading
            ? Text(
                text,
                style: textStyle ??
                    TextStyle(
                      color: isActive ? textColor : inactiveTextColor,
                      fontSize: fontSize,
                      fontWeight: fontWeight,
                      // fontFamily:
                    ),
                textAlign: TextAlign.center,
              )
            : Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: circularIndicatorHeight,
                    width: circularIndicatorWidth,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        circularIndicatorColor ?? textColor,
                      ),
                      backgroundColor: circularIndicatorColor != null
                          ? circularIndicatorColor!
                              .withOpacity(circularIndicatorOpacity)
                          : textColor.withOpacity(circularIndicatorOpacity),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
      ),
    );
  }
}
