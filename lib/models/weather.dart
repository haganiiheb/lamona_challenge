import 'package:drift/drift.dart';
import 'package:weather/weather.dart';

import '../utils/database_manager.dart';

class WeatherModel {
  int? id, conditionCode;
  String? country, areaName;
  double? tempC,
      tempF,
      minTempC,
      minTempF,
      maxTempC,
      maxTempF,
      humidity,
      windSpeed;
  DateTime? date, sunrise, sunset;

  bool? isLocal;

  WeatherModel({
    this.id,
    this.country,
    this.areaName,
    this.tempC,
    this.tempF,
    this.minTempC,
    this.minTempF,
    this.maxTempC,
    this.maxTempF,
    this.humidity,
    this.windSpeed,
    this.date,
    this.sunrise,
    this.sunset,
    this.isLocal,
    this.conditionCode,
  });

  WeatherModel.fromWeahter(Weather? weather, {bool this.isLocal = false}) {
    country = weather?.country;
    areaName = weather?.areaName;
    tempC = weather?.temperature?.celsius;
    tempF = weather?.temperature?.fahrenheit;
    minTempC = weather?.tempMin?.celsius;
    minTempF = weather?.tempMin?.fahrenheit;
    maxTempC = weather?.tempMax?.celsius;
    maxTempF = weather?.tempMax?.fahrenheit;
    date = weather?.date;
    sunrise = weather?.sunrise;
    sunset = weather?.sunset;
    windSpeed = weather?.windSpeed;
    humidity = weather?.humidity;
    conditionCode = weather?.weatherConditionCode;
  }

  WeatherModel.fromTable(WeatherTableData? data) {
    id = data?.id;
    country = data?.country;
    areaName = data?.areaName;
    tempC = data?.tempC;
    tempF = data?.tempf;
    minTempC = data?.minTempC;
    minTempF = data?.minTempF;
    maxTempC = data?.maxTempC;
    maxTempF = data?.maxTempV;
    date = data?.date;
    sunrise = data?.sunrise;
    sunset = data?.sunset;
    isLocal = data?.islocal;
    humidity = data?.humidity;
    windSpeed = data?.windSpeed;
    conditionCode = data?.conditionCode;
  }

  WeatherTableCompanion toCompanion({bool isEdit = false}) => isEdit
      ? WeatherTableCompanion(
          id: Value(id!),
          areaName: Value(areaName),
          country: Value(country),
          tempC: Value(tempC),
          tempf: Value(tempF),
          minTempC: Value(minTempC),
          minTempF: Value(minTempF),
          maxTempC: Value(maxTempC),
          maxTempV: Value(maxTempF),
          humidity: Value(humidity),
          windSpeed: Value(windSpeed),
          date: Value(date),
          sunrise: Value(sunrise),
          sunset: Value(sunset),
          islocal: Value(isLocal),
          conditionCode: Value(conditionCode),
        )
      : WeatherTableCompanion(
          areaName: Value(areaName),
          country: Value(country),
          tempC: Value(tempC),
          tempf: Value(tempF),
          minTempC: Value(minTempC),
          minTempF: Value(minTempF),
          maxTempC: Value(maxTempC),
          maxTempV: Value(maxTempF),
          humidity: Value(humidity),
          windSpeed: Value(windSpeed),
          date: Value(date),
          sunrise: Value(sunrise),
          sunset: Value(sunset),
          islocal: Value(isLocal),
          conditionCode: Value(conditionCode),
        );
}
