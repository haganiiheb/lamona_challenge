import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:weather/weather.dart';

import '../../../components/custom_loading_indicator.dart';
import '../../../components/custom_text_form_field.dart';
import '../../../constants/apis.dart';
import '../../../constants/colors.dart';
import '../../../dialogs/cities/cities_dialog.dart';
import '../../../models/city.dart';
import '../../../models/weather.dart';
import '../../../utils/database_manager.dart';
import '../../../utils/functions.dart';
import '../../../utils/geolocalisation.dart';
import '../../../utils/size_config.dart';
import '../../city_weather/city_weather_screen.dart';
import 'current_position_weather_card.dart';
import 'weahter_card.dart';

class Body extends StatefulWidget {
  const Body({
    super.key,
  });

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final WeatherFactory wf = WeatherFactory(apiUrl);
  // Weather? weather;
  bool isLoading = false;
  bool isCurrentLoading = false;

  WeatherModel? currentPositionWeather;
  List<WeatherModel> weathers = [];
  List<CityModel> cities = [];
  // List<String> cities = ['Alger', 'Oran', 'Madrid', 'Paris', 'Marseille'];

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: init,
      child: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                // padding: const EdgeInsets.all(8.0),
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 4),

                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    const Expanded(
                      child: CustomTextFormField(
                        hintText: 'Recherche',
                        fillColor: Colors.white,
                        // borderColor: Colors,
                      ),
                    ),
                    const HorizontalSpacing(),
                    GestureDetector(
                      onTap: showSettings,
                      child: const Icon(
                        Icons.segment_outlined,
                        color: kBlueColor,
                      ),
                    ),
                  ],
                ),
              ),
              // const VerticalSpacing(of: 8),
              Expanded(
                child: SingleChildScrollView(
                  // clipBehavior: Clip.none,
                  child: Padding(
                    // padding: const EdgeInsets.all(8.0),
                    padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        AspectRatio(
                          aspectRatio: 3 / 2,
                          child: CurrentPositionWeatherCard(
                            weather: currentPositionWeather,
                            isLoading: isCurrentLoading,
                            press: () async {
                              await showDetails(0);
                            },
                          ),
                        ),
                        const VerticalSpacing(of: 12),
                        if (isLoading)
                          const CustomLoadingIndicator(isDefault: false),
                        if (!isLoading)
                          GridView.count(
                            crossAxisCount: 2,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            childAspectRatio: 2 / 3,
                            crossAxisSpacing: 8,
                            mainAxisSpacing: 4,
                            clipBehavior: Clip.none,
                            children: [
                              ...List.generate(
                                weathers.length,
                                (index) => GestureDetector(
                                  onTap: () async {
                                    await showDetails(
                                      index +
                                          (currentPositionWeather != null
                                              ? 1
                                              : 0),
                                    );
                                  },
                                  child: WeatherCard(weather: weathers[index]),
                                ),
                              ),
                            ],
                            // children: weathers
                            //     .map(
                            //       (e) => GestureDetector(
                            //         onTap: () async{
                            //           await showDetails( )
                            //         },
                            //         child: WeatherCard(weather: e),
                            //       ),
                            //     )
                            //     .toList(),
                          ),
                        // AspectRatio(
                        //   aspectRatio: 3 / 2,
                        //   child: CurrentPositionWeatherCard(
                        //     weather: weather,
                        //     isLoading: isCurrentLoading,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future init() async {
    await loadOnlineCurrentPositionWeatherData();
    await loadOnlineWeathers();
  }

  void showSettings() async {
    await showModalBottomSheet_(
      context,
      const CitiesDialog(),
    );
  }

  Future showDetails(int initialPage) async {
    List<WeatherModel> _ = [];
    if (currentPositionWeather != null) {
      _.add(currentPositionWeather!);
    }
    _.addAll(weathers);
    // print(currentPositionWeather?.)
    await push(
      context,
      CityWeatherScreen(
        weathers: _,
        initialPage: initialPage,
      ),
    );
  }

  Future loadOffilneWeathers() async {
    String? error;
    print("OFFLINE WEAHTERS");
    try {
      weathers = await dbManager.getWeathers(isLocal: false);
    } catch (e) {
      error = "$e";
    }

    if (mounted) {
      setState(() {});
    }

    if (error != null) {
      print(error);
    }
  }

  Future loadOnlineWeathers() async {
    isLoading = true;
    setState(() {});

    String? error;
    try {
      cities = await dbManager.getCities();
      weathers = [];
      for (CityModel city in cities) {
        if (city.name != null) {
          weathers.add(
            WeatherModel.fromWeahter(
              await wf.currentWeatherByCityName(city.name!),
            ),
          );
        }
      }

      List<WeatherModel> old = await dbManager.getWeathers(isLocal: false);
      for (WeatherModel weather in old) {
        await dbManager.deleteWeahter(weather);
      }

      for (WeatherModel weather in weathers) {
        await dbManager.insertWeahter(weather);
      }
    } catch (e) {
      await loadOffilneWeathers();
      error = "$e";
    }

    if (error != null) {
      print("UNE ERREUR EST SURVENUE LORS DU CHARGEMENTS DES METEO");
    }

    isLoading = false;
    setState(() {});
  }

  Future loadOnlineCurrentPositionWeatherData() async {
    isCurrentLoading = true;
    setState(() {});

    String? error;
    try {
      Position position = await getCurrentPosition();
      currentPositionWeather = WeatherModel.fromWeahter(
        await wf.currentWeatherByLocation(
          position.latitude,
          position.longitude,
        ),
        isLocal: true,
      );

      if (currentPositionWeather != null) {
        WeatherModel? old =
            (await dbManager.getWeathers(isLocal: true)).firstOrNull;
        if (old?.id != null) {
          await dbManager.deleteWeahter(old!);
        }

        await dbManager.insertWeahter(currentPositionWeather!);
      }
    } catch (e) {
      await loadOfflineCurrentPositionWeatherData();
      error = "$e";
    }

    if (error != null) {
      print("ERREUR DANS LA RECUPERATION DES TEMPERATURE ");
    }

    isCurrentLoading = false;
    setState(() {});
  }

  Future loadOfflineCurrentPositionWeatherData() async {
    String? error;
    print("OFFLINE CURRENT POSITION");
    try {
      currentPositionWeather =
          (await dbManager.getWeathers(isLocal: true)).firstOrNull;
    } catch (e) {
      error = "$e";
    }
    if (error != null) {
      print("error : $error");
    }
  }

  // Future<Position> loadLocalisation() async {
  //   String? error;
  //   try {
  //     Position _ = await getCurrentPosition();
  //   } catch (e) {
  //     error = "$e";
  //   }
  // }
}
