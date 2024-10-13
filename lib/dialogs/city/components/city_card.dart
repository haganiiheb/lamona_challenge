import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../models/city.dart';
import '../../../utils/size_config.dart';

class CityCard extends StatelessWidget {
  const CityCard({
    super.key,
    required this.city,
    required this.select,
    this.isSelected = false,
  });

  final CityModel city;
  final GestureTapCallback select;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: select,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
        decoration: BoxDecoration(
          color:
              isSelected ? Colors.green.withOpacity(.15) : Colors.transparent,
          border: const Border(
            bottom: BorderSide(color: kPrimaryColor, width: .5),
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.max,
          children: [
            const Icon(Icons.pin_drop, color: kBlueColor),
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
            // AutoSizeText(
            //   city.name ?? "-",
            //   maxLines: 1,
            //   style: const TextStyle(
            //     color: kBlackColor,
            //     fontWeight: FontWeight.w600,
            //     fontSize: 16,
            //   ),
            // ),
            // AutoSizeText(
            //   ", ${city.country}",
            //   maxLines: 1,
            //   style: const TextStyle(
            //     color: kBlackColor,
            //     // fontWeight: FontWeight.w600,
            //     fontSize: 16,
            //   ),
            // ),
            // AutoSizeText(
            //   "(${city.countryCode})",
            //   maxLines: 1,
            //   style: const TextStyle(
            //     color: kBlackColor,
            //     fontWeight: FontWeight.w600,
            //     fontSize: 16,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
