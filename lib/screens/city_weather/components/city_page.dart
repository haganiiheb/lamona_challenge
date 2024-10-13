import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../models/weather.dart';

class CityPage extends StatelessWidget {
  const CityPage({
    super.key,
    required this.weather,
    required this.index,
    required this.length,
  });

  final WeatherModel weather;
  final int index;
  final int length;

  @override
  Widget build(BuildContext context) {
    return Stack(
      // crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Positioned(
          right: 80,
          top: 60,
          child: SizedBox(
            child: Image.asset(
              weatherImages[weather.conditionCode]!,
              width: 168,
              height: 168,
              fit: BoxFit.cover,
              // color: kOrangeColor,
            ),
          ),
        ),
        Positioned(
          right: 40,
          top: 0,
          child: AutoSizeText(
            "${weather.tempC?.toStringAsFixed(0)}°",
            maxLines: 1,
            style: TextStyle(
              color: (weather.tempC ?? 0) > 20 ? kOrangeColor : kBlueColor,
              fontWeight: FontWeight.w700,
              fontSize: 104,
            ),
          ),
        ),
        // Expanded(child: Container()),
      ],
    );
  }
}
