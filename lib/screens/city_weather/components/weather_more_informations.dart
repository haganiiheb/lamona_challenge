import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../models/weather.dart';
import '../../../utils/size_config.dart';

class WeatherMoreInformations extends StatelessWidget {
  const WeatherMoreInformations({
    super.key,
    required this.weather,
  });

  final WeatherModel weather;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: const BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(24),
          topRight: Radius.circular(24),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 40,
            height: 2,
            decoration: BoxDecoration(
              color: kBlueColor,
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          const VerticalSpacing(),
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.water_drop_outlined,
                      size: 35,
                      color: kBlueColor,
                    ),
                    const AutoSizeText(
                      "Humidité",
                      maxLines: 1,
                      style: TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const VerticalSpacing(of: 8),
                    AutoSizeText(
                      "${weather.humidity} %",
                      maxLines: 1,
                      style: const TextStyle(
                        color: kBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: kBlackColor,
                height: 60,
                thickness: 1,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.wind_power_outlined,
                      size: 35,
                      color: kBlueColor,
                    ),
                    const AutoSizeText(
                      "Vent",
                      maxLines: 1,
                      style: TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const VerticalSpacing(of: 8),
                    AutoSizeText(
                      "${((weather.windSpeed ?? 0) * 3.6).toStringAsFixed(0)} KM/H",
                      maxLines: 1,
                      style: const TextStyle(
                        color: kBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: kBlackColor,
                height: 60,
                thickness: 1,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(
                      Icons.cloudy_snowing,
                      size: 35,
                      color: kBlueColor,
                    ),
                    const AutoSizeText(
                      "Precipetation",
                      maxLines: 1,
                      style: TextStyle(
                        color: kBlackColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                    const VerticalSpacing(of: 8),
                    AutoSizeText(
                      "${weather.humidity}",
                      maxLines: 1,
                      style: const TextStyle(
                        color: kBlueColor,
                        fontWeight: FontWeight.w600,
                        fontSize: 14,
                      ),
                    ),
                    // Icon(Icons.ra)
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
