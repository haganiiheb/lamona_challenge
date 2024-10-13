import 'package:drift/drift.dart';

class CityTable extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  RealColumn get longitude => real().nullable()();
  RealColumn get latitude => real().nullable()();
  TextColumn get country => text().nullable()();
  TextColumn get countryCode => text().nullable()();
}
