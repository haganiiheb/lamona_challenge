import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'colors.dart';

ThemeData theme() {
  return ThemeData(
    scaffoldBackgroundColor: kPrimaryColor,
    appBarTheme: appBarTheme,
    inputDecorationTheme: inputDecorationTheme,
    visualDensity: VisualDensity.adaptivePlatformDensity,
  );
}

AppBarTheme get appBarTheme => const AppBarTheme(
      color: Colors.transparent,
      elevation: 0,
      systemOverlayStyle: SystemUiOverlayStyle.light,
      iconTheme: IconThemeData(color: kBlackColor),
      titleTextStyle: TextStyle(color: kBlackColor, fontSize: 15),
    );

OutlineInputBorder outlineInputBorder = OutlineInputBorder(
  borderRadius: BorderRadius.circular(15),
  borderSide: const BorderSide(color: kBlackColor),
  gapPadding: 10,
);

InputDecorationTheme get inputDecorationTheme => InputDecorationTheme(
      contentPadding: const EdgeInsets.symmetric(horizontal: 45, vertical: 20),
      // filled: true,
      // fillColor: kBlackColor,
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
      border: outlineInputBorder,
    );
