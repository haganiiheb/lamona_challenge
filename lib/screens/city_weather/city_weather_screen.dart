import 'package:flutter/material.dart';
import 'package:weather_app/models/weather.dart';

import '../../constants/colors.dart';
import 'components/body.dart';

class CityWeatherScreen extends StatelessWidget {
  const CityWeatherScreen({
    super.key,
    required this.weathers,
    this.initialPage,
  });
  final List<WeatherModel> weathers;
  final int? initialPage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: const Icon(Icons.arrow_back_ios, color: kBlueColor),
        ),
      ),
      body: Body(
        weathers: weathers,
        initialPage: initialPage ?? 0,
      ),
    );
  }
}
