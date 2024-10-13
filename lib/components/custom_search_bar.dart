import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    Key? key,
    required this.hintText,
    this.onChanged,
    this.onSubmit,
    this.width,
    this.horizontal = 10,
    this.vertical = 3,
    this.backgroundColor = kLightGreyColor,
    this.backgroundOpacity = .15,
    this.radius = 5,
    this.enabled = true,
    this.textAlignVertical = TextAlignVertical.center,
    this.inputBorder = InputBorder.none,
    this.focusedBorder = InputBorder.none,
    this.enabledBorder = InputBorder.none,
    this.disabledBorder = InputBorder.none,
    this.icon,
    this.svgIcon,
    this.iconColor,
    this.iconSize = 5,
    this.isPrefix = false,
    this.padding = 15,
    this.left = 10,
    this.top = 10,
    this.bottom = 10,
    this.right = 15,
  }) : super(key: key);
  final String hintText;
  final Function(String)? onChanged;
  final Function(String)? onSubmit;
  final double? width;
  final double vertical;
  final double horizontal;
  final Color backgroundColor;
  final double backgroundOpacity;
  final double radius;
  final bool enabled;
  final TextAlignVertical textAlignVertical;
  final InputBorder inputBorder;
  final InputBorder focusedBorder;
  final InputBorder enabledBorder;
  final InputBorder disabledBorder;
  final String? svgIcon;
  final IconData? icon;
  final double iconSize;
  final Color? iconColor;
  final bool isPrefix;
  final double padding;
  final double left;
  final double right;
  final double top;
  final double bottom;
  // final bool enabled;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      padding: EdgeInsets.symmetric(
        vertical: vertical,
        horizontal: horizontal,
      ),
      decoration: BoxDecoration(
        color: backgroundColor.withOpacity(backgroundOpacity),
        borderRadius: BorderRadius.circular(radius),
      ),
      child: TextFormField(
        enabled: enabled,
        onChanged: onChanged,
        onFieldSubmitted: onSubmit,
        textAlignVertical: textAlignVertical,
        decoration: InputDecoration(
          hintText: hintText,
          border: inputBorder,
          focusedBorder: focusedBorder,
          enabledBorder: enabledBorder,
          disabledBorder: disabledBorder,
          prefixIcon: isPrefix
              ? icon != null
                  ? Icon(
                      icon,
                      size: iconSize,
                      color: iconColor,
                    )
                  : svgIcon != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: left,
                            top: top,
                            bottom: bottom,
                            right: right,
                          ),
                          child: SvgPicture.asset(
                            svgIcon!,
                            height: iconSize,
                            width: iconSize,
                            color: iconColor,
                          ),
                        )
                      : null
              : null,
          suffixIcon: !isPrefix
              ? icon != null
                  ? Icon(
                      icon,
                      size: iconSize,
                      color: iconColor,
                    )
                  : svgIcon != null
                      ? Padding(
                          padding: EdgeInsets.only(
                            left: left,
                            top: top,
                            bottom: bottom,
                            right: right,
                          ),
                          child: SvgPicture.asset(
                            svgIcon!,
                            height: iconSize,
                            width: iconSize,
                            color: iconColor,
                          ),
                        )
                      : null
              : null,
        ),
      ),
    );
  }
}
