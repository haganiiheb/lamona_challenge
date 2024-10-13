import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../components/custom_loading_indicator.dart';
import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../models/weather.dart';
import '../../../utils/format.dart';
import '../../../utils/size_config.dart';

class CurrentPositionWeatherCard extends StatelessWidget {
  const CurrentPositionWeatherCard({
    super.key,
    required this.press,
    required this.weather,
    this.isLoading = false,
  });
  final GestureTapCallback press;
  final bool isLoading;
  final WeatherModel? weather;

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const CustomLoadingIndicator(isDefault: false)
        : weather == null
            ? const SizedBox()
            : GestureDetector(
                onTap: press,
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
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            AutoSizeText(
                              "${weather?.tempC?.toStringAsFixed(0)}°",
                              maxLines: 1,
                              style: TextStyle(
                                color: (weather?.tempC ?? 0) < 20
                                    ? kBlueColor
                                    : kOrangeColor,
                                fontSize: 70,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                            // const VerticalSpacing(of: 8),
                            AutoSizeText(
                              "${weather?.areaName}, ${weather?.country}",
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                letterSpacing: -.5,
                                fontSize: 22,
                              ),
                              maxLines: 1,
                            ),
                            // const VerticalSpacing(of: 8),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                AutoSizeText(
                                  "${weather?.minTempC?.toStringAsFixed(0)}° - "
                                  "${weather?.maxTempC?.toStringAsFixed(0)}°",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: kBlueColor,
                                  ),
                                ),
                                if (weather?.conditionCode != null &&
                                    weatherDescriptions[
                                            weather!.conditionCode] !=
                                        null)
                                  AutoSizeText(
                                    "${weatherDescriptions[weather!.conditionCode]!['fr']}",
                                    maxLines: 1,
                                    style: const TextStyle(fontSize: 12),
                                  ),
                              ],
                            ),
                            // const VerticalSpacing(of: 8),
                            AutoSizeText(
                              "${dateFormat.format(weather?.date ?? DateTime.now())} -"
                              " ${timeFormat.format(weather?.date ?? DateTime.now())}",
                              maxLines: 1,
                              style: const TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 14,
                              ),
                            )
                          ],
                        ),
                      ),
                      const HorizontalSpacing(of: 8),
                      if (weather?.conditionCode != null &&
                          weatherImages[weather!.conditionCode] != null)
                        Expanded(
                          child: Image.asset(
                            weatherImages[weather!.conditionCode]!,
                            // color: kOrangeColor,
                          ),
                        )
                    ],
                  ),
                ),
              );
  }
}
