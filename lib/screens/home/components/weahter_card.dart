import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../models/weather.dart';
import '../../../utils/format.dart';

class WeatherCard extends StatelessWidget {
  const WeatherCard({
    super.key,
    required this.weather,
  });
  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    // print(weather.areaName);
    // print(weather.weatherConditionCode);
    return Column(
      children: [
        const Expanded(flex: 1, child: SizedBox()),
        Expanded(
          flex: 2,
          child: Stack(
            clipBehavior: Clip.none,
            children: [
              Positioned.fill(
                child: Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
                  decoration: BoxDecoration(
                    color: kWhiteColor,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: kBlueColor.withOpacity(.55)),
                    boxShadow: [
                      kDefaultShadow(color: kBlueColor, blurRadius: 45)
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      AutoSizeText(
                        "${weather.tempC?.toStringAsFixed(0)}°",
                        maxLines: 1,
                        style: TextStyle(
                          color: (weather.tempC ?? 0) < 20
                              ? kBlueColor
                              : kOrangeColor,
                          fontSize: 48,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      // const VerticalSpacing(of: 8),
                      AutoSizeText(
                        "${weather.areaName}, ${weather.country}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                          letterSpacing: -.5,
                          fontSize: 16,
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
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: kBlueColor,
                            ),
                          ),
                          if (weather.conditionCode != null &&
                              weatherDescriptions[weather.conditionCode] !=
                                  null)
                            AutoSizeText(
                              "${weatherDescriptions[weather.conditionCode]!['fr']}",
                              maxLines: 1,
                              style: const TextStyle(fontSize: 8),
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
                          fontSize: 9,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              if (weather.conditionCode != null &&
                  weatherImages[weather.conditionCode] != null)
                Positioned(
                  right: -10,
                  top: -50,
                  child: SizedBox(
                    width: 96,
                    child: Image.asset(
                      weatherImages[weather.conditionCode]!,

                      // color: kOrangeColor,
                    ),
                  ),
                ),
            ],
          ),
        ),
      ],
    );
  }
}
