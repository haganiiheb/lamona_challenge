import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import '../../../constants/colors.dart';
import '../../../constants/constants.dart';
import '../../../models/city.dart';
import '../../../utils/size_config.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    super.key,
    required this.city,
    required this.deleteCity,
    this.weather,
  });
  final CityModel city;
  final GestureTapCallback deleteCity;
  final Weather? weather;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
      decoration: const BoxDecoration(
        // color: isSelected ? Colors.green.withOpacity(.15) : Colors.transparent,
        border: Border(
          bottom: BorderSide(color: kPrimaryColor, width: .5),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          // const Icon(Icons.pin_drop, color: kBlueColor),
          if (weather?.weatherConditionCode != null &&
              weatherImages[weather?.weatherConditionCode] != null)
            SizedBox(
              width: 24,
              child: Image.asset(weatherImages[weather!.weatherConditionCode]!),
            ),
          const HorizontalSpacing(of: 4),
          Expanded(
            child: AutoSizeText.rich(
              TextSpan(
                text: city.name ?? "-",
                // style: const TextStyle(fontWeight: FontWeight.w600),
                children: [
                  TextSpan(
                    text: ", ${city.country}",
                    style: const TextStyle(fontWeight: FontWeight.normal),
                  ),
                  TextSpan(text: " (${city.countryCode})"),
                ],
              ),
              maxLines: 1,
              style: const TextStyle(
                fontSize: 16,
                color: kBlackColor,
                fontWeight: FontWeight.w600,
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          if (weather?.temperature?.celsius != null)
            const HorizontalSpacing(of: 4),
          if (weather?.temperature?.celsius != null)
            AutoSizeText(
              "${weather?.temperature?.celsius?.toStringAsFixed(0)}°",
              maxLines: 1,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: (weather?.temperature?.celsius ?? 0) > 20
                    ? kOrangeColor
                    : kBlueColor,
              ),
            ),
          const HorizontalSpacing(of: 4),
          GestureDetector(
            onTap: deleteCity,
            child: Icon(Icons.delete, color: Colors.red[800]),
          )
        ],
      ),
    );
  }
}
