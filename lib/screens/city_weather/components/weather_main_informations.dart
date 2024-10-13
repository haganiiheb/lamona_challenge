import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../models/weather.dart';
import '../../../utils/format.dart';

class WeatherMainInformation extends StatelessWidget {
  const WeatherMainInformation({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AutoSizeText(
            "${weather.areaName}, ${weather.country}",
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              letterSpacing: -.5,
              fontSize: 28,
            ),
            maxLines: 1,
          ),
          // const VerticalSpacing(of: 8),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AutoSizeText(
                "${weather.minTempC?.toStringAsFixed(0)}° - "
                "${weather.maxTempC?.toStringAsFixed(0)}°",
                style: const TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.w600,
                  color: kBlueColor,
                ),
              ),
              if (weather.conditionCode != null &&
                  weatherDescriptions[weather.conditionCode] != null)
                AutoSizeText(
                  "${weatherDescriptions[weather.conditionCode]!['fr']}",
                  maxLines: 1,
                  style: const TextStyle(fontSize: 16),
                ),
            ],
          ),
          // const VerticalSpacing(of: 8),
          AutoSizeText(
            "${dateFormat.format(weather.date ?? DateTime.now())} -"
            " ${timeFormat.format(weather.date ?? DateTime.now())}",
            maxLines: 1,
            style: const TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 16,
            ),
          )
        ],
      ),
    );
  }
}
