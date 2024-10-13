import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';

class CustomIconButton extends StatelessWidget {
  const CustomIconButton({
    super.key,
    this.press,
    this.iconData,
    this.svgIcon,
    this.size = 15,
    this.vertical = 0,
    this.horizontal = 0,
    this.iconColor = kPrimaryColor,
    this.backgroundColor = Colors.white,
    this.shadows,
    this.radius = 5,
    this.isLoading = false,
    this.circularIndicatorHeight = 20,
    this.circularIndicatorWidth = 20,
    this.circularIndicatorColor,
    this.circularIndicatorOpacity = .15,
  });
  final GestureTapCallback? press;
  final IconData? iconData;
  final String? svgIcon;
  final double size;
  final double vertical;
  final double horizontal;
  final Color? iconColor;
  final Color? backgroundColor;
  final double radius;
  final List<BoxShadow>? shadows;
  final bool isLoading;

  final double circularIndicatorHeight;
  final double circularIndicatorWidth;
  final Color? circularIndicatorColor;
  final double circularIndicatorOpacity;

  @override
  Widget build(BuildContext context) {
    // print("CUSTOM ICON BUTTON : ====> IS LOADING : ====> $isLoading");
    return InkWell(
      onTap: !isLoading ? press : () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: vertical,
          horizontal: horizontal,
        ),
        // margin: const EdgeInsets.symmetric(horizontal: 5),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(radius),
          boxShadow: shadows,
        ),
        child: !isLoading
            ? iconData != null
                ? Icon(
                    iconData,
                    color: iconColor,
                    size: size,
                  )
                : svgIcon != null
                    ? SvgPicture.asset(
                        svgIcon!,
                        width: size,
                        height: size,
                        // color: iconColor,
                        theme: SvgTheme(currentColor: iconColor ?? kBlackColor),
                      )
                    : null
            : Row(
                children: [
                  const Spacer(),
                  SizedBox(
                    height: circularIndicatorHeight,
                    width: circularIndicatorWidth,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(
                        circularIndicatorColor ?? (iconColor ?? kPrimaryColor),
                      ),
                      backgroundColor: circularIndicatorColor != null
                          ? circularIndicatorColor!
                              .withOpacity(circularIndicatorOpacity)
                          : (iconColor ?? kPrimaryColor)
                              .withOpacity(circularIndicatorOpacity),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
      ),
    );
  }
}
