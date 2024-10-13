// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'database_manager.dart';

// ignore_for_file: type=lint
class $CityTableTable extends CityTable
    with TableInfo<$CityTableTable, CityTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CityTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _longitudeMeta =
      const VerificationMeta('longitude');
  @override
  late final GeneratedColumn<double> longitude = GeneratedColumn<double>(
      'longitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _latitudeMeta =
      const VerificationMeta('latitude');
  @override
  late final GeneratedColumn<double> latitude = GeneratedColumn<double>(
      'latitude', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countryCodeMeta =
      const VerificationMeta('countryCode');
  @override
  late final GeneratedColumn<String> countryCode = GeneratedColumn<String>(
      'country_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, name, longitude, latitude, country, countryCode];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'city_table';
  @override
  VerificationContext validateIntegrity(Insertable<CityTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('longitude')) {
      context.handle(_longitudeMeta,
          longitude.isAcceptableOrUnknown(data['longitude']!, _longitudeMeta));
    }
    if (data.containsKey('latitude')) {
      context.handle(_latitudeMeta,
          latitude.isAcceptableOrUnknown(data['latitude']!, _latitudeMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    if (data.containsKey('country_code')) {
      context.handle(
          _countryCodeMeta,
          countryCode.isAcceptableOrUnknown(
              data['country_code']!, _countryCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CityTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CityTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      longitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}longitude']),
      latitude: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}latitude']),
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country']),
      countryCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country_code']),
    );
  }

  @override
  $CityTableTable createAlias(String alias) {
    return $CityTableTable(attachedDatabase, alias);
  }
}

class CityTableData extends DataClass implements Insertable<CityTableData> {
  final int id;
  final String name;
  final double? longitude;
  final double? latitude;
  final String? country;
  final String? countryCode;
  const CityTableData(
      {required this.id,
      required this.name,
      this.longitude,
      this.latitude,
      this.country,
      this.countryCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || longitude != null) {
      map['longitude'] = Variable<double>(longitude);
    }
    if (!nullToAbsent || latitude != null) {
      map['latitude'] = Variable<double>(latitude);
    }
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || countryCode != null) {
      map['country_code'] = Variable<String>(countryCode);
    }
    return map;
  }

  CityTableCompanion toCompanion(bool nullToAbsent) {
    return CityTableCompanion(
      id: Value(id),
      name: Value(name),
      longitude: longitude == null && nullToAbsent
          ? const Value.absent()
          : Value(longitude),
      latitude: latitude == null && nullToAbsent
          ? const Value.absent()
          : Value(latitude),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      countryCode: countryCode == null && nullToAbsent
          ? const Value.absent()
          : Value(countryCode),
    );
  }

  factory CityTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CityTableData(
      id: serializer.fromJson<int>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      longitude: serializer.fromJson<double?>(json['longitude']),
      latitude: serializer.fromJson<double?>(json['latitude']),
      country: serializer.fromJson<String?>(json['country']),
      countryCode: serializer.fromJson<String?>(json['countryCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'name': serializer.toJson<String>(name),
      'longitude': serializer.toJson<double?>(longitude),
      'latitude': serializer.toJson<double?>(latitude),
      'country': serializer.toJson<String?>(country),
      'countryCode': serializer.toJson<String?>(countryCode),
    };
  }

  CityTableData copyWith(
          {int? id,
          String? name,
          Value<double?> longitude = const Value.absent(),
          Value<double?> latitude = const Value.absent(),
          Value<String?> country = const Value.absent(),
          Value<String?> countryCode = const Value.absent()}) =>
      CityTableData(
        id: id ?? this.id,
        name: name ?? this.name,
        longitude: longitude.present ? longitude.value : this.longitude,
        latitude: latitude.present ? latitude.value : this.latitude,
        country: country.present ? country.value : this.country,
        countryCode: countryCode.present ? countryCode.value : this.countryCode,
      );
  @override
  String toString() {
    return (StringBuffer('CityTableData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude, ')
          ..write('country: $country, ')
          ..write('countryCode: $countryCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, name, longitude, latitude, country, countryCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CityTableData &&
          other.id == this.id &&
          other.name == this.name &&
          other.longitude == this.longitude &&
          other.latitude == this.latitude &&
          other.country == this.country &&
          other.countryCode == this.countryCode);
}

class CityTableCompanion extends UpdateCompanion<CityTableData> {
  final Value<int> id;
  final Value<String> name;
  final Value<double?> longitude;
  final Value<double?> latitude;
  final Value<String?> country;
  final Value<String?> countryCode;
  const CityTableCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.longitude = const Value.absent(),
    this.latitude = const Value.absent(),
    this.country = const Value.absent(),
    this.countryCode = const Value.absent(),
  });
  CityTableCompanion.insert({
    this.id = const Value.absent(),
    required String name,
    this.longitude = const Value.absent(),
    this.latitude = const Value.absent(),
    this.country = const Value.absent(),
    this.countryCode = const Value.absent(),
  }) : name = Value(name);
  static Insertable<CityTableData> custom({
    Expression<int>? id,
    Expression<String>? name,
    Expression<double>? longitude,
    Expression<double>? latitude,
    Expression<String>? country,
    Expression<String>? countryCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (longitude != null) 'longitude': longitude,
      if (latitude != null) 'latitude': latitude,
      if (country != null) 'country': country,
      if (countryCode != null) 'country_code': countryCode,
    });
  }

  CityTableCompanion copyWith(
      {Value<int>? id,
      Value<String>? name,
      Value<double?>? longitude,
      Value<double?>? latitude,
      Value<String?>? country,
      Value<String?>? countryCode}) {
    return CityTableCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      longitude: longitude ?? this.longitude,
      latitude: latitude ?? this.latitude,
      country: country ?? this.country,
      countryCode: countryCode ?? this.countryCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (longitude.present) {
      map['longitude'] = Variable<double>(longitude.value);
    }
    if (latitude.present) {
      map['latitude'] = Variable<double>(latitude.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (countryCode.present) {
      map['country_code'] = Variable<String>(countryCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CityTableCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('longitude: $longitude, ')
          ..write('latitude: $latitude, ')
          ..write('country: $country, ')
          ..write('countryCode: $countryCode')
          ..write(')'))
        .toString();
  }
}

class $WeatherTableTable extends WeatherTable
    with TableInfo<$WeatherTableTable, WeatherTableData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $WeatherTableTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _areaNameMeta =
      const VerificationMeta('areaName');
  @override
  late final GeneratedColumn<String> areaName = GeneratedColumn<String>(
      'area_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _tempCMeta = const VerificationMeta('tempC');
  @override
  late final GeneratedColumn<double> tempC = GeneratedColumn<double>(
      'temp_c', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _tempfMeta = const VerificationMeta('tempf');
  @override
  late final GeneratedColumn<double> tempf = GeneratedColumn<double>(
      'tempf', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _minTempCMeta =
      const VerificationMeta('minTempC');
  @override
  late final GeneratedColumn<double> minTempC = GeneratedColumn<double>(
      'min_temp_c', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _minTempFMeta =
      const VerificationMeta('minTempF');
  @override
  late final GeneratedColumn<double> minTempF = GeneratedColumn<double>(
      'min_temp_f', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maxTempCMeta =
      const VerificationMeta('maxTempC');
  @override
  late final GeneratedColumn<double> maxTempC = GeneratedColumn<double>(
      'max_temp_c', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _maxTempVMeta =
      const VerificationMeta('maxTempV');
  @override
  late final GeneratedColumn<double> maxTempV = GeneratedColumn<double>(
      'max_temp_v', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _humidityMeta =
      const VerificationMeta('humidity');
  @override
  late final GeneratedColumn<double> humidity = GeneratedColumn<double>(
      'humidity', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _windSpeedMeta =
      const VerificationMeta('windSpeed');
  @override
  late final GeneratedColumn<double> windSpeed = GeneratedColumn<double>(
      'wind_speed', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _sunriseMeta =
      const VerificationMeta('sunrise');
  @override
  late final GeneratedColumn<DateTime> sunrise = GeneratedColumn<DateTime>(
      'sunrise', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _sunsetMeta = const VerificationMeta('sunset');
  @override
  late final GeneratedColumn<DateTime> sunset = GeneratedColumn<DateTime>(
      'sunset', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _islocalMeta =
      const VerificationMeta('islocal');
  @override
  late final GeneratedColumn<bool> islocal = GeneratedColumn<bool>(
      'islocal', aliasedName, true,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("islocal" IN (0, 1))'));
  static const VerificationMeta _conditionCodeMeta =
      const VerificationMeta('conditionCode');
  @override
  late final GeneratedColumn<int> conditionCode = GeneratedColumn<int>(
      'condition_code', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        country,
        areaName,
        tempC,
        tempf,
        minTempC,
        minTempF,
        maxTempC,
        maxTempV,
        humidity,
        windSpeed,
        date,
        sunrise,
        sunset,
        islocal,
        conditionCode
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'weather_table';
  @override
  VerificationContext validateIntegrity(Insertable<WeatherTableData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    }
    if (data.containsKey('area_name')) {
      context.handle(_areaNameMeta,
          areaName.isAcceptableOrUnknown(data['area_name']!, _areaNameMeta));
    }
    if (data.containsKey('temp_c')) {
      context.handle(
          _tempCMeta, tempC.isAcceptableOrUnknown(data['temp_c']!, _tempCMeta));
    }
    if (data.containsKey('tempf')) {
      context.handle(
          _tempfMeta, tempf.isAcceptableOrUnknown(data['tempf']!, _tempfMeta));
    }
    if (data.containsKey('min_temp_c')) {
      context.handle(_minTempCMeta,
          minTempC.isAcceptableOrUnknown(data['min_temp_c']!, _minTempCMeta));
    }
    if (data.containsKey('min_temp_f')) {
      context.handle(_minTempFMeta,
          minTempF.isAcceptableOrUnknown(data['min_temp_f']!, _minTempFMeta));
    }
    if (data.containsKey('max_temp_c')) {
      context.handle(_maxTempCMeta,
          maxTempC.isAcceptableOrUnknown(data['max_temp_c']!, _maxTempCMeta));
    }
    if (data.containsKey('max_temp_v')) {
      context.handle(_maxTempVMeta,
          maxTempV.isAcceptableOrUnknown(data['max_temp_v']!, _maxTempVMeta));
    }
    if (data.containsKey('humidity')) {
      context.handle(_humidityMeta,
          humidity.isAcceptableOrUnknown(data['humidity']!, _humidityMeta));
    }
    if (data.containsKey('wind_speed')) {
      context.handle(_windSpeedMeta,
          windSpeed.isAcceptableOrUnknown(data['wind_speed']!, _windSpeedMeta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    if (data.containsKey('sunrise')) {
      context.handle(_sunriseMeta,
          sunrise.isAcceptableOrUnknown(data['sunrise']!, _sunriseMeta));
    }
    if (data.containsKey('sunset')) {
      context.handle(_sunsetMeta,
          sunset.isAcceptableOrUnknown(data['sunset']!, _sunsetMeta));
    }
    if (data.containsKey('islocal')) {
      context.handle(_islocalMeta,
          islocal.isAcceptableOrUnknown(data['islocal']!, _islocalMeta));
    }
    if (data.containsKey('condition_code')) {
      context.handle(
          _conditionCodeMeta,
          conditionCode.isAcceptableOrUnknown(
              data['condition_code']!, _conditionCodeMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  WeatherTableData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return WeatherTableData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country']),
      areaName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}area_name']),
      tempC: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}temp_c']),
      tempf: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tempf']),
      minTempC: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_temp_c']),
      minTempF: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}min_temp_f']),
      maxTempC: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_temp_c']),
      maxTempV: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}max_temp_v']),
      humidity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}humidity']),
      windSpeed: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}wind_speed']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
      sunrise: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sunrise']),
      sunset: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}sunset']),
      islocal: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}islocal']),
      conditionCode: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}condition_code']),
    );
  }

  @override
  $WeatherTableTable createAlias(String alias) {
    return $WeatherTableTable(attachedDatabase, alias);
  }
}

class WeatherTableData extends DataClass
    implements Insertable<WeatherTableData> {
  final int id;
  final String? country;
  final String? areaName;
  final double? tempC;
  final double? tempf;
  final double? minTempC;
  final double? minTempF;
  final double? maxTempC;
  final double? maxTempV;
  final double? humidity;
  final double? windSpeed;
  final DateTime? date;
  final DateTime? sunrise;
  final DateTime? sunset;
  final bool? islocal;
  final int? conditionCode;
  const WeatherTableData(
      {required this.id,
      this.country,
      this.areaName,
      this.tempC,
      this.tempf,
      this.minTempC,
      this.minTempF,
      this.maxTempC,
      this.maxTempV,
      this.humidity,
      this.windSpeed,
      this.date,
      this.sunrise,
      this.sunset,
      this.islocal,
      this.conditionCode});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || country != null) {
      map['country'] = Variable<String>(country);
    }
    if (!nullToAbsent || areaName != null) {
      map['area_name'] = Variable<String>(areaName);
    }
    if (!nullToAbsent || tempC != null) {
      map['temp_c'] = Variable<double>(tempC);
    }
    if (!nullToAbsent || tempf != null) {
      map['tempf'] = Variable<double>(tempf);
    }
    if (!nullToAbsent || minTempC != null) {
      map['min_temp_c'] = Variable<double>(minTempC);
    }
    if (!nullToAbsent || minTempF != null) {
      map['min_temp_f'] = Variable<double>(minTempF);
    }
    if (!nullToAbsent || maxTempC != null) {
      map['max_temp_c'] = Variable<double>(maxTempC);
    }
    if (!nullToAbsent || maxTempV != null) {
      map['max_temp_v'] = Variable<double>(maxTempV);
    }
    if (!nullToAbsent || humidity != null) {
      map['humidity'] = Variable<double>(humidity);
    }
    if (!nullToAbsent || windSpeed != null) {
      map['wind_speed'] = Variable<double>(windSpeed);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    if (!nullToAbsent || sunrise != null) {
      map['sunrise'] = Variable<DateTime>(sunrise);
    }
    if (!nullToAbsent || sunset != null) {
      map['sunset'] = Variable<DateTime>(sunset);
    }
    if (!nullToAbsent || islocal != null) {
      map['islocal'] = Variable<bool>(islocal);
    }
    if (!nullToAbsent || conditionCode != null) {
      map['condition_code'] = Variable<int>(conditionCode);
    }
    return map;
  }

  WeatherTableCompanion toCompanion(bool nullToAbsent) {
    return WeatherTableCompanion(
      id: Value(id),
      country: country == null && nullToAbsent
          ? const Value.absent()
          : Value(country),
      areaName: areaName == null && nullToAbsent
          ? const Value.absent()
          : Value(areaName),
      tempC:
          tempC == null && nullToAbsent ? const Value.absent() : Value(tempC),
      tempf:
          tempf == null && nullToAbsent ? const Value.absent() : Value(tempf),
      minTempC: minTempC == null && nullToAbsent
          ? const Value.absent()
          : Value(minTempC),
      minTempF: minTempF == null && nullToAbsent
          ? const Value.absent()
          : Value(minTempF),
      maxTempC: maxTempC == null && nullToAbsent
          ? const Value.absent()
          : Value(maxTempC),
      maxTempV: maxTempV == null && nullToAbsent
          ? const Value.absent()
          : Value(maxTempV),
      humidity: humidity == null && nullToAbsent
          ? const Value.absent()
          : Value(humidity),
      windSpeed: windSpeed == null && nullToAbsent
          ? const Value.absent()
          : Value(windSpeed),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
      sunrise: sunrise == null && nullToAbsent
          ? const Value.absent()
          : Value(sunrise),
      sunset:
          sunset == null && nullToAbsent ? const Value.absent() : Value(sunset),
      islocal: islocal == null && nullToAbsent
          ? const Value.absent()
          : Value(islocal),
      conditionCode: conditionCode == null && nullToAbsent
          ? const Value.absent()
          : Value(conditionCode),
    );
  }

  factory WeatherTableData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return WeatherTableData(
      id: serializer.fromJson<int>(json['id']),
      country: serializer.fromJson<String?>(json['country']),
      areaName: serializer.fromJson<String?>(json['areaName']),
      tempC: serializer.fromJson<double?>(json['tempC']),
      tempf: serializer.fromJson<double?>(json['tempf']),
      minTempC: serializer.fromJson<double?>(json['minTempC']),
      minTempF: serializer.fromJson<double?>(json['minTempF']),
      maxTempC: serializer.fromJson<double?>(json['maxTempC']),
      maxTempV: serializer.fromJson<double?>(json['maxTempV']),
      humidity: serializer.fromJson<double?>(json['humidity']),
      windSpeed: serializer.fromJson<double?>(json['windSpeed']),
      date: serializer.fromJson<DateTime?>(json['date']),
      sunrise: serializer.fromJson<DateTime?>(json['sunrise']),
      sunset: serializer.fromJson<DateTime?>(json['sunset']),
      islocal: serializer.fromJson<bool?>(json['islocal']),
      conditionCode: serializer.fromJson<int?>(json['conditionCode']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'country': serializer.toJson<String?>(country),
      'areaName': serializer.toJson<String?>(areaName),
      'tempC': serializer.toJson<double?>(tempC),
      'tempf': serializer.toJson<double?>(tempf),
      'minTempC': serializer.toJson<double?>(minTempC),
      'minTempF': serializer.toJson<double?>(minTempF),
      'maxTempC': serializer.toJson<double?>(maxTempC),
      'maxTempV': serializer.toJson<double?>(maxTempV),
      'humidity': serializer.toJson<double?>(humidity),
      'windSpeed': serializer.toJson<double?>(windSpeed),
      'date': serializer.toJson<DateTime?>(date),
      'sunrise': serializer.toJson<DateTime?>(sunrise),
      'sunset': serializer.toJson<DateTime?>(sunset),
      'islocal': serializer.toJson<bool?>(islocal),
      'conditionCode': serializer.toJson<int?>(conditionCode),
    };
  }

  WeatherTableData copyWith(
          {int? id,
          Value<String?> country = const Value.absent(),
          Value<String?> areaName = const Value.absent(),
          Value<double?> tempC = const Value.absent(),
          Value<double?> tempf = const Value.absent(),
          Value<double?> minTempC = const Value.absent(),
          Value<double?> minTempF = const Value.absent(),
          Value<double?> maxTempC = const Value.absent(),
          Value<double?> maxTempV = const Value.absent(),
          Value<double?> humidity = const Value.absent(),
          Value<double?> windSpeed = const Value.absent(),
          Value<DateTime?> date = const Value.absent(),
          Value<DateTime?> sunrise = const Value.absent(),
          Value<DateTime?> sunset = const Value.absent(),
          Value<bool?> islocal = const Value.absent(),
          Value<int?> conditionCode = const Value.absent()}) =>
      WeatherTableData(
        id: id ?? this.id,
        country: country.present ? country.value : this.country,
        areaName: areaName.present ? areaName.value : this.areaName,
        tempC: tempC.present ? tempC.value : this.tempC,
        tempf: tempf.present ? tempf.value : this.tempf,
        minTempC: minTempC.present ? minTempC.value : this.minTempC,
        minTempF: minTempF.present ? minTempF.value : this.minTempF,
        maxTempC: maxTempC.present ? maxTempC.value : this.maxTempC,
        maxTempV: maxTempV.present ? maxTempV.value : this.maxTempV,
        humidity: humidity.present ? humidity.value : this.humidity,
        windSpeed: windSpeed.present ? windSpeed.value : this.windSpeed,
        date: date.present ? date.value : this.date,
        sunrise: sunrise.present ? sunrise.value : this.sunrise,
        sunset: sunset.present ? sunset.value : this.sunset,
        islocal: islocal.present ? islocal.value : this.islocal,
        conditionCode:
            conditionCode.present ? conditionCode.value : this.conditionCode,
      );
  @override
  String toString() {
    return (StringBuffer('WeatherTableData(')
          ..write('id: $id, ')
          ..write('country: $country, ')
          ..write('areaName: $areaName, ')
          ..write('tempC: $tempC, ')
          ..write('tempf: $tempf, ')
          ..write('minTempC: $minTempC, ')
          ..write('minTempF: $minTempF, ')
          ..write('maxTempC: $maxTempC, ')
          ..write('maxTempV: $maxTempV, ')
          ..write('humidity: $humidity, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('date: $date, ')
          ..write('sunrise: $sunrise, ')
          ..write('sunset: $sunset, ')
          ..write('islocal: $islocal, ')
          ..write('conditionCode: $conditionCode')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      country,
      areaName,
      tempC,
      tempf,
      minTempC,
      minTempF,
      maxTempC,
      maxTempV,
      humidity,
      windSpeed,
      date,
      sunrise,
      sunset,
      islocal,
      conditionCode);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is WeatherTableData &&
          other.id == this.id &&
          other.country == this.country &&
          other.areaName == this.areaName &&
          other.tempC == this.tempC &&
          other.tempf == this.tempf &&
          other.minTempC == this.minTempC &&
          other.minTempF == this.minTempF &&
          other.maxTempC == this.maxTempC &&
          other.maxTempV == this.maxTempV &&
          other.humidity == this.humidity &&
          other.windSpeed == this.windSpeed &&
          other.date == this.date &&
          other.sunrise == this.sunrise &&
          other.sunset == this.sunset &&
          other.islocal == this.islocal &&
          other.conditionCode == this.conditionCode);
}

class WeatherTableCompanion extends UpdateCompanion<WeatherTableData> {
  final Value<int> id;
  final Value<String?> country;
  final Value<String?> areaName;
  final Value<double?> tempC;
  final Value<double?> tempf;
  final Value<double?> minTempC;
  final Value<double?> minTempF;
  final Value<double?> maxTempC;
  final Value<double?> maxTempV;
  final Value<double?> humidity;
  final Value<double?> windSpeed;
  final Value<DateTime?> date;
  final Value<DateTime?> sunrise;
  final Value<DateTime?> sunset;
  final Value<bool?> islocal;
  final Value<int?> conditionCode;
  const WeatherTableCompanion({
    this.id = const Value.absent(),
    this.country = const Value.absent(),
    this.areaName = const Value.absent(),
    this.tempC = const Value.absent(),
    this.tempf = const Value.absent(),
    this.minTempC = const Value.absent(),
    this.minTempF = const Value.absent(),
    this.maxTempC = const Value.absent(),
    this.maxTempV = const Value.absent(),
    this.humidity = const Value.absent(),
    this.windSpeed = const Value.absent(),
    this.date = const Value.absent(),
    this.sunrise = const Value.absent(),
    this.sunset = const Value.absent(),
    this.islocal = const Value.absent(),
    this.conditionCode = const Value.absent(),
  });
  WeatherTableCompanion.insert({
    this.id = const Value.absent(),
    this.country = const Value.absent(),
    this.areaName = const Value.absent(),
    this.tempC = const Value.absent(),
    this.tempf = const Value.absent(),
    this.minTempC = const Value.absent(),
    this.minTempF = const Value.absent(),
    this.maxTempC = const Value.absent(),
    this.maxTempV = const Value.absent(),
    this.humidity = const Value.absent(),
    this.windSpeed = const Value.absent(),
    this.date = const Value.absent(),
    this.sunrise = const Value.absent(),
    this.sunset = const Value.absent(),
    this.islocal = const Value.absent(),
    this.conditionCode = const Value.absent(),
  });
  static Insertable<WeatherTableData> custom({
    Expression<int>? id,
    Expression<String>? country,
    Expression<String>? areaName,
    Expression<double>? tempC,
    Expression<double>? tempf,
    Expression<double>? minTempC,
    Expression<double>? minTempF,
    Expression<double>? maxTempC,
    Expression<double>? maxTempV,
    Expression<double>? humidity,
    Expression<double>? windSpeed,
    Expression<DateTime>? date,
    Expression<DateTime>? sunrise,
    Expression<DateTime>? sunset,
    Expression<bool>? islocal,
    Expression<int>? conditionCode,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (country != null) 'country': country,
      if (areaName != null) 'area_name': areaName,
      if (tempC != null) 'temp_c': tempC,
      if (tempf != null) 'tempf': tempf,
      if (minTempC != null) 'min_temp_c': minTempC,
      if (minTempF != null) 'min_temp_f': minTempF,
      if (maxTempC != null) 'max_temp_c': maxTempC,
      if (maxTempV != null) 'max_temp_v': maxTempV,
      if (humidity != null) 'humidity': humidity,
      if (windSpeed != null) 'wind_speed': windSpeed,
      if (date != null) 'date': date,
      if (sunrise != null) 'sunrise': sunrise,
      if (sunset != null) 'sunset': sunset,
      if (islocal != null) 'islocal': islocal,
      if (conditionCode != null) 'condition_code': conditionCode,
    });
  }

  WeatherTableCompanion copyWith(
      {Value<int>? id,
      Value<String?>? country,
      Value<String?>? areaName,
      Value<double?>? tempC,
      Value<double?>? tempf,
      Value<double?>? minTempC,
      Value<double?>? minTempF,
      Value<double?>? maxTempC,
      Value<double?>? maxTempV,
      Value<double?>? humidity,
      Value<double?>? windSpeed,
      Value<DateTime?>? date,
      Value<DateTime?>? sunrise,
      Value<DateTime?>? sunset,
      Value<bool?>? islocal,
      Value<int?>? conditionCode}) {
    return WeatherTableCompanion(
      id: id ?? this.id,
      country: country ?? this.country,
      areaName: areaName ?? this.areaName,
      tempC: tempC ?? this.tempC,
      tempf: tempf ?? this.tempf,
      minTempC: minTempC ?? this.minTempC,
      minTempF: minTempF ?? this.minTempF,
      maxTempC: maxTempC ?? this.maxTempC,
      maxTempV: maxTempV ?? this.maxTempV,
      humidity: humidity ?? this.humidity,
      windSpeed: windSpeed ?? this.windSpeed,
      date: date ?? this.date,
      sunrise: sunrise ?? this.sunrise,
      sunset: sunset ?? this.sunset,
      islocal: islocal ?? this.islocal,
      conditionCode: conditionCode ?? this.conditionCode,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (areaName.present) {
      map['area_name'] = Variable<String>(areaName.value);
    }
    if (tempC.present) {
      map['temp_c'] = Variable<double>(tempC.value);
    }
    if (tempf.present) {
      map['tempf'] = Variable<double>(tempf.value);
    }
    if (minTempC.present) {
      map['min_temp_c'] = Variable<double>(minTempC.value);
    }
    if (minTempF.present) {
      map['min_temp_f'] = Variable<double>(minTempF.value);
    }
    if (maxTempC.present) {
      map['max_temp_c'] = Variable<double>(maxTempC.value);
    }
    if (maxTempV.present) {
      map['max_temp_v'] = Variable<double>(maxTempV.value);
    }
    if (humidity.present) {
      map['humidity'] = Variable<double>(humidity.value);
    }
    if (windSpeed.present) {
      map['wind_speed'] = Variable<double>(windSpeed.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    if (sunrise.present) {
      map['sunrise'] = Variable<DateTime>(sunrise.value);
    }
    if (sunset.present) {
      map['sunset'] = Variable<DateTime>(sunset.value);
    }
    if (islocal.present) {
      map['islocal'] = Variable<bool>(islocal.value);
    }
    if (conditionCode.present) {
      map['condition_code'] = Variable<int>(conditionCode.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('WeatherTableCompanion(')
          ..write('id: $id, ')
          ..write('country: $country, ')
          ..write('areaName: $areaName, ')
          ..write('tempC: $tempC, ')
          ..write('tempf: $tempf, ')
          ..write('minTempC: $minTempC, ')
          ..write('minTempF: $minTempF, ')
          ..write('maxTempC: $maxTempC, ')
          ..write('maxTempV: $maxTempV, ')
          ..write('humidity: $humidity, ')
          ..write('windSpeed: $windSpeed, ')
          ..write('date: $date, ')
          ..write('sunrise: $sunrise, ')
          ..write('sunset: $sunset, ')
          ..write('islocal: $islocal, ')
          ..write('conditionCode: $conditionCode')
          ..write(')'))
        .toString();
  }
}

abstract class _$DatabaseManager extends GeneratedDatabase {
  _$DatabaseManager(QueryExecutor e) : super(e);
  late final $CityTableTable cityTable = $CityTableTable(this);
  late final $WeatherTableTable weatherTable = $WeatherTableTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [cityTable, weatherTable];
}
