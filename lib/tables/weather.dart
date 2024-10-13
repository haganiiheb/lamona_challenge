import 'package:drift/drift.dart';

class WeatherTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get country => text().nullable()();
  TextColumn get areaName => text().nullable()();
  RealColumn get tempC => real().nullable()();
  RealColumn get tempf => real().nullable()();
  RealColumn get minTempC => real().nullable()();
  RealColumn get minTempF => real().nullable()();
  RealColumn get maxTempC => real().nullable()();
  RealColumn get maxTempV => real().nullable()();
  RealColumn get humidity => real().nullable()();
  RealColumn get windSpeed => real().nullable()();
  DateTimeColumn get date => dateTime().nullable()();
  DateTimeColumn get sunrise => dateTime().nullable()();
  DateTimeColumn get sunset => dateTime().nullable()();
  BoolColumn get islocal => boolean().nullable()();
  IntColumn get conditionCode => integer().nullable()();
}
