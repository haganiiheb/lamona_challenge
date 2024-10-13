import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../constants/colors.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    Key? key,
    required this.hintText,
    this.radius = 5,
    this.borderColor = kLightGreyColor,
    this.hintColor = kLightGreyColor,
    this.fillColor = kWhiteColor,
    this.filled = true,
    this.borderOpacity = .55,
    this.borderWidth = 2,
    this.labelText,
    this.svgIcon,
    this.isPrefix = false,
    this.icon,
    this.iconColor,
    this.onChanged,
    this.validator,
    this.futurValidator,
    this.onSaved,
    this.iconHeight = 25,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.isPassword = false,
    this.horizontal = 10,
    this.vertical = 0,
    this.errorHeight = 0,
    this.enabled = true,
    this.initialValue,
    this.svgPadding = 0,
    this.errorBorderWidth = 1,
    this.errorColor = Colors.redAccent,
    this.maxLines = 1,
    this.controller,
  }) : super(key: key);

  final String hintText;
  final Color hintColor;
  final bool filled;
  final Color fillColor;
  final double radius;
  final Color borderColor;
  final double borderOpacity;
  final double borderWidth;
  final bool isPrefix;
  final String? labelText;
  final String? svgIcon;
  final IconData? icon;
  final Color? iconColor;
  final double iconHeight;
  final TextInputType? keyboardType;
  final TextInputAction textInputAction;
  final String? Function(String?)? validator;
  final Future<String?> Function(String?)? futurValidator;
  final String? Function(String)? onChanged;
  final Function(String?)? onSaved;
  final bool isPassword;
  final double vertical;
  final double horizontal;
  final double errorHeight;
  final bool enabled;
  final String? initialValue;
  final double svgPadding;
  final Color errorColor;
  final double errorBorderWidth;
  final int? maxLines;
  final TextEditingController? controller;

  // final Color borderColor;
  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  // final
  late bool isObscure;
  @override
  void initState() {
    super.initState();
    isObscure = widget.isPassword;
  }

  @override
  Widget build(BuildContext context) {
    var outlineInputBorder = OutlineInputBorder(
      borderRadius: BorderRadius.circular(widget.radius),
      borderSide: BorderSide(
        color: widget.borderColor.withOpacity(widget.borderOpacity),
        width: widget.borderWidth,
      ),
    );
    return TextFormField(
      controller: widget.controller,
      onChanged: widget.onChanged,
      validator: widget.validator,

      onSaved: widget.onSaved,
      textAlignVertical: TextAlignVertical.center,
      keyboardType: widget.keyboardType,
      textInputAction: widget.textInputAction,
      obscureText: isObscure,
      enabled: widget.enabled,
      initialValue: widget.initialValue,
      maxLines: widget.maxLines,
      // maxLines: null,
      decoration: InputDecoration(
        hintText: widget.hintText,
        // label: Text(widget.labelText ?? ""),
        hintStyle: TextStyle(color: widget.hintColor),
        fillColor: widget.fillColor,
        filled: widget.filled,
        prefixIcon: widget.isPrefix
            ? widget.svgIcon != null
                ? Padding(
                    padding: EdgeInsets.all(widget.svgPadding),
                    child: SvgPicture.asset(
                      widget.svgIcon!,
                      height: 5,
                      color: widget.iconColor,
                    ),
                  )
                : widget.icon != null
                    ? Icon(
                        widget.icon!,
                        color: widget.iconColor,
                        size: widget.iconHeight,
                      )
                    : null
            : null,
        suffixIcon: widget.isPassword
            ? widget.svgIcon != null
                ? Padding(
                    padding: EdgeInsets.all(widget.svgPadding),
                    child: SvgPicture.asset(
                      widget.svgIcon!,
                      color: widget.iconColor,
                      height: widget.iconHeight,
                    ),
                  )
                : widget.icon != null
                    ? Icon(
                        widget.icon,
                        color: widget.iconColor,
                        size: widget.iconHeight,
                      )
                    : GestureDetector(
                        onTap: () => setState(() {
                          isObscure = !isObscure;
                        }),
                        child: Icon(
                          isObscure ? Icons.visibility : Icons.visibility_off,
                          color: widget.iconColor,
                          size: widget.iconHeight,
                        ),
                      )
            : null,
        contentPadding: EdgeInsets.symmetric(
          vertical: widget.vertical,
          horizontal: widget.horizontal,
        ),
        errorStyle: TextStyle(height: widget.errorHeight),
        border: outlineInputBorder,
        enabledBorder: outlineInputBorder,
        focusedBorder: outlineInputBorder,
        disabledBorder: outlineInputBorder,

        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: widget.errorBorderWidth,
            color: widget.errorColor,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            width: widget.errorBorderWidth,
            color: widget.errorColor,
          ),
        ),
      ),
    );
  }
}
