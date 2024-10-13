import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:weather/weather.dart';

import '../../components/custom_loading_indicator.dart';
import '../../constants/apis.dart';
import '../../constants/colors.dart';
import '../../models/city.dart';
import '../../utils/database_manager.dart';
import '../../utils/functions.dart';
import '../city/city_dialog.dart';
import 'components/city_card.dart';

class CitiesDialog extends StatefulWidget {
  const CitiesDialog({
    super.key,
  });

  @override
  State<CitiesDialog> createState() => _CitiesDialogState();
}

class _CitiesDialogState extends State<CitiesDialog> {
  List<CityModel> cities = [];
  List<Weather> weathers = [];
  final WeatherFactory wf = WeatherFactory(apiUrl);
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    loadCities();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const AutoSizeText(
                "Les villes",
                maxLines: 1,
                style: TextStyle(
                  color: kBlackColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: newCity,
                child: const Icon(
                  Icons.add,
                  color: kBlueColor,
                  size: 28,
                ),
              ),
            ],
          ),
        ),
        Container(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * .7,
          ),
          child: SingleChildScrollView(
            child: isLoading
                ? const CustomLoadingIndicator(
                    isDefault: false,
                    color: kBlueColor,
                  )
                : Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: cities
                        .map((e) => CityCard(
                              city: e,
                              weather: weathers
                                  .where(
                                      (element) => element.areaName == e.name)
                                  .firstOrNull,
                              deleteCity: () async {
                                deleteCity(e);
                              },
                            ))
                        .toList(),
                  ),
          ),
        ),
      ],
    );
  }

  Future loadCities() async {
    isLoading = true;
    if (mounted) {}
    setState(() {});
    String? error;
    try {
      cities = await dbManager.getCities();
      weathers = [];
      for (CityModel city in cities) {
        if (city.name != null) {
          weathers.add(await wf.currentWeatherByCityName(city.name!));
        }
      }
    } catch (e) {
      error = "$e";
    }
    isLoading = false;
    if (mounted) {
      setState(() {});
    }

    if (error != null) {
      print(error);
    }
  }

  Future newCity() async {
    bool? _ = await buildCustomAlertDialog(context, child: const CityDialog());
    if (_ == true) {
      setState(() {});
    }
  }

  Future deleteCity(CityModel city) async {}
}
