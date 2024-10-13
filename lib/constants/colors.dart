import 'package:flutter/material.dart';

const Color kPrimaryColor = Color(0xFFd6e3f5);
const Color kWhiteColor = Color(0xFFf6f6f6);
const Color kLightGreyColor = Color(0xFFD3D3D3);
const Color kBlackColor = Color(0xFF1a1d27);

const Color kOrangeColor = Color(0xfff1a43c);
const Color kBlueColor = Color(0xff366295);
// const Color kPrimaryColor = Color(0xFFFFFFFF);

BoxShadow kDefaultShadow({
  Color color = kWhiteColor,
  double opacity = .3,
  Offset offset = const Offset(0, 10),
  double blurRadius = 15,
}) {
  return BoxShadow(
    color: color.withOpacity(opacity),
    offset: offset,
    blurRadius: blurRadius,
  );
}
