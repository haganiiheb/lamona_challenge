import 'package:flutter/material.dart';

// import 'package:weather/weather.dart';

import '../../../constants/colors.dart';
import '../../../models/weather.dart';
import 'city_page.dart';
import 'weather_main_informations.dart';
import 'weather_more_informations.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
    required this.weathers,
    required this.initialPage,
  });
  final List<WeatherModel> weathers;
  final int initialPage;

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  PageController? controller;
  int currentPage = 0;
  @override
  void initState() {
    super.initState();
    currentPage = widget.initialPage;
    // print("INIT STATE : =======> INITIAL PAGE : ======> $widget")
    controller = PageController(initialPage: currentPage);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          flex: 2,
          child: PageView.builder(
            controller: controller,
            itemCount: widget.weathers.length,
            onPageChanged: (value) {
              currentPage = value;
              setState(() {});
            },
            itemBuilder: ((context, index) => CityPage(
                  weather: widget.weathers[index],
                  index: index,
                  length: widget.weathers.length,
                )),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ...List.generate(
              widget.weathers.length,
              (_) => AnimatedContainer(
                margin: const EdgeInsets.symmetric(horizontal: 2),
                duration: const Duration(milliseconds: 300),
                height: 8,
                width: currentPage == _ ? 24 : 8,
                decoration: BoxDecoration(
                  color: currentPage == _ ? kBlueColor : kLightGreyColor,
                  borderRadius: BorderRadius.circular(8),
                  // shape:
                  //     currentPage == _ ? BoxShape.rectangle : BoxShape.circle,
                ),
              ),
            ),
          ],
        ),
        Expanded(
          child: WeatherMainInformation(weather: widget.weathers[currentPage]),
        ),
        WeatherMoreInformations(weather: widget.weathers[currentPage]),
      ],
    );
  }
}
