import 'package:flutter/material.dart';

import '../utils/size_config.dart';
import 'custom_button.dart';

class CustomNavbar extends StatelessWidget {
  const CustomNavbar({
    super.key,
    required this.accept,
    this.cancel,
    this.isLoading = false,
    this.fontSize = 16,
    this.vertical = 8,
    this.radius = 5,
    this.flex = 1,
    this.cancelText = "Annuler",
    this.acceptText = "Valider",
  });
  final String cancelText;
  final String acceptText;
  final GestureTapCallback? cancel;
  final GestureTapCallback accept;
  final bool isLoading;
  final double fontSize;
  final double vertical;
  final double radius;
  final int flex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(child: SizedBox()),
        Expanded(
          flex: flex,
          child: CustomButton(
            text: cancelText,
            backgroundColor: Colors.red[800]!,
            radius: radius,
            vertical: vertical,
            fontSize: fontSize,
            press: cancel ?? () => Navigator.pop(context),
          ),
        ),
        const HorizontalSpacing(of: 10),
        Expanded(
          flex: flex,
          child: CustomButton(
            text: acceptText,
            backgroundColor: Colors.green[800]!,
            radius: radius,
            vertical: vertical,
            fontSize: fontSize,
            isLoading: isLoading,
            press: accept,
          ),
        ),
        const Expanded(child: SizedBox()),
      ],
    );
  }
}
