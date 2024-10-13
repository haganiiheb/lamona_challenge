import 'package:flutter/material.dart';

import '../constants/colors.dart';

class CustomDropDownButton extends StatefulWidget {
  const CustomDropDownButton({
    Key? key,
    required this.items,
    required this.hintText,
    this.hintColor = kLightGreyColor,
    // this.
    this.onChanged,
    this.initialValue,
    this.icon = Icons.arrow_drop_down,
    this.iconColor,
    this.iconSize = 35,
    this.radius = 5,
    this.dropDownRadius = 5,
    this.hintSize = 16,
    this.horizontal = 10,
    this.vertical = 0,
    this.borderColor = kLightGreyColor,
    this.borderOpacity = .55,
    this.borderWidth = 2,
    this.isExpanded = true,
    this.isUnderlined = false,
    this.underline,
    this.itemColor = kBlackColor,
    this.itemFontSize = 15,
    this.enabledColor = kPrimaryColor,
    this.enabledOpacity = .65,
    this.isDense = false,
    this.isEnabled = true,
    this.backgroundColor,
  }) : super(key: key);
  final double itemFontSize;
  final Color itemColor;
  final Function(String)? onChanged;
  final String hintText;
  final Color? hintColor;
  final double hintSize;
  final List<String> items;
  final String? initialValue;
  final IconData icon;
  final Color? iconColor;
  final double iconSize;
  final double radius;
  final double dropDownRadius;
  final double horizontal;
  final double vertical;
  final Color borderColor;
  final double borderWidth;
  final double borderOpacity;
  final Color enabledColor;
  final double enabledOpacity;
  final bool isExpanded;
  final Widget? underline;
  final bool isUnderlined;
  final bool isDense;
  final bool isEnabled;
  final Color? backgroundColor;

  @override
  State<CustomDropDownButton> createState() => _CustomDropDownButtonState();
}

class _CustomDropDownButtonState extends State<CustomDropDownButton> {
  String? value;
  @override
  void initState() {
    super.initState();
    if (widget.items.contains(widget.initialValue)) {
      value = widget.initialValue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: widget.horizontal,
        vertical: widget.vertical,
      ),
      decoration: BoxDecoration(
        color: widget.backgroundColor,
        border: Border.all(
          color: widget.borderColor.withOpacity(widget.borderOpacity),
          width: widget.borderWidth,
        ),
        borderRadius: BorderRadius.circular(widget.radius),
      ),
      child: DropdownButton(
        value: widget.items.contains(value) ? value : null,
        onChanged: widget.isEnabled
            ? (String? newValue) {
                widget.onChanged!(newValue!);
                value = newValue;
                setState(() {});
              }
            : null,
        borderRadius: BorderRadius.circular(widget.dropDownRadius),
        icon: Icon(widget.icon, color: widget.iconColor),
        iconSize: widget.iconSize,
        hint: Text(
          widget.hintText,
          style: TextStyle(
            color: widget.hintColor,
            fontSize: widget.hintSize,
          ),
        ),
        isExpanded: widget.isExpanded,
        isDense: widget.isDense,
        underline: !widget.isUnderlined ? Container() : widget.underline,
        iconEnabledColor: value == null
            ? widget.borderColor
            : widget.enabledColor.withOpacity(widget.enabledOpacity),
        items: widget.items
            .map(
              (item) => DropdownMenuItem(
                value: item,
                child: Text(
                  item,
                  style: TextStyle(
                    color: widget.itemColor,
                    fontSize: widget.itemFontSize,
                  ),
                ),
              ),
            )
            .toList(),
      ),
    );
  }
}
