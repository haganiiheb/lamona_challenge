import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

import '../models/city.dart';
import '../models/weather.dart';
import '../tables/city.dart';
import '../tables/weather.dart';

part "database_manager.g.dart";

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    var defaultFolder = await getApplicationDocumentsDirectory();

    final file = File(
      path.join(
        "${defaultFolder.path}/lamona/weather_app/",
        'database.sqlite',
      ),
    );
    return NativeDatabase(file);
  });
}

@DriftDatabase(
  tables: [
    CityTable,
    WeatherTable,
  ],
)
class DatabaseManager extends _$DatabaseManager {
  DatabaseManager() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();
      },
      onUpgrade: (Migrator m, int from, int to) async {
        // if (from == 1) {
        //   await m.addColumn(weatherTable, weatherTable.islocal);
        //   await m.addColumn(weatherTable, weatherTable.windSpeed);
        //   await m.addColumn(weatherTable, weatherTable.humidity);
        //   await m.addColumn(weatherTable, weatherTable.conditionCode);
        // }
      },
    );
  }

  // WEATHERS FUNCTIONS
  Future<List<WeatherModel>> getWeathers({
    String? areaName,
    String? country,
    bool? isLocal,
  }) async {
    try {
      var query = select(weatherTable);

      if (areaName != null) {
        query = query..where((tbl) => tbl.areaName.equals(areaName));
      }
      if (country != null) {
        query = query..where((tbl) => tbl.country.equals(country));
      }
      if (isLocal != null) {
        query = query..where((tbl) => tbl.islocal.equals(isLocal));
      }

      List<WeatherTableData> weathers = await query.get();

      return weathers
          .map((element) => WeatherModel.fromTable(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> insertWeahter(WeatherModel weather) async {
    return (await into(weatherTable).insert(weather.toCompanion()) > 0);
  }

  Future<bool> updateWeather(WeatherModel weather) async {
    return await update(weatherTable)
        .replace(weather.toCompanion(isEdit: true));
  }

  Future<bool> deleteWeahter(WeatherModel weather) async {
    return (await (delete(weatherTable)
              ..where((tbl) => tbl.id.equals(weather.id!)))
            .go() >
        0);
  }

  // CITIES FUNCTIONS
  Future<List<CityModel>> getCities({
    String? name,
    double? longitude,
    double? latitude,
    String? country,
    String? countryCode,
  }) async {
    try {
      var query = select(cityTable);

      if (name != null) {
        query = query..where((tbl) => tbl.name.equals(name));
      }
      if (longitude != null) {
        query = query..where((tbl) => tbl.longitude.equals(longitude));
      }
      if (latitude != null) {
        query = query..where((tbl) => tbl.latitude.equals(latitude));
      }
      if (country != null) {
        query = query..where((tbl) => tbl.country.equals(country));
      }
      if (countryCode != null) {
        query = query..where((tbl) => tbl.countryCode.equals(countryCode));
      }

      List<CityTableData> cities = await query.get();

      return cities.map((element) => CityModel.fromTable(element)).toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<bool> insertCity(CityModel city) async {
    return (await into(cityTable).insert(city.toCompanion()) > 0);
  }

  Future<bool> deleteCity(CityModel city) async {
    return (await (delete(cityTable)..where((tbl) => tbl.id.equals(city.id!)))
            .go() >
        0);
  }
}

DatabaseManager dbManager = DatabaseManager();
