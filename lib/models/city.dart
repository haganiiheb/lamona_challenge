import 'package:drift/drift.dart';

import '../constants/identifiers.dart';
import '../utils/database_manager.dart';

class CityModel {
  int? id;
  String? name;
  double? longitude;
  double? latitude;
  String? country;
  String? countryCode;

  CityModel({
    this.name,
    this.longitude,
    this.latitude,
    this.country,
    this.countryCode,
  });

  CityModel.fromJson(Map<String, dynamic>? data) {
    id = data?[GEONAME_ID];
    name = data?[NAME];
    longitude = double.tryParse(data?[LONGITUDE] ?? "");
    latitude = double.tryParse(data?[LATITUDE] ?? "");
    country = data?[COUNTRY];
    countryCode = data?[COUNTRY_CODE];
  }

  CityModel.fromTable(CityTableData? data) {
    id = data?.id;
    name = data?.name;
    longitude = data?.longitude;
    latitude = data?.latitude;
    country = data?.country;
    countryCode = data?.countryCode;
  }

  CityTableCompanion toCompanion({bool isEdit = false}) => isEdit
      ? CityTableCompanion(
          id: Value(id!),
          name: Value(name!),
          longitude: Value(longitude),
          latitude: Value(latitude),
          country: Value(country),
          countryCode: Value(countryCode),
        )
      : CityTableCompanion(
          name: Value(name!),
          longitude: Value(longitude),
          latitude: Value(latitude),
          country: Value(country),
          countryCode: Value(countryCode),
        );
}
