import 'package:sqflite/sqflite.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';
import 'package:sqflite_migration_plan/migration/sql.dart';
import 'package:sqflite_migration_plan/sqflite_migration_plan.dart';
import 'package:get/get.dart';

class SQliteService {
  //class attributes
  static Database? _db;
  static final SQliteService instance = SQliteService._constructor();
  static const _databaseVersion = 1;
  static const _databaseName = "local_habits_db.db";
  //named constructor
  SQliteService._constructor();
  // dynamic attributes
  Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await _getDatabase();
    return _db!;
  }

  //methods
  Future<Database> _getDatabase() async {
    String databaseDirPath = await _getDatabaseDirPath();
    final databasePath = join(databaseDirPath, _databaseName);
    final migrationPlan = await _getMigrationPlan();
    final database = await openDatabase(
      version: _databaseVersion,
      databasePath,
      onConfigure: (db) => db.execute('PRAGMA foreign_keys = ON'),
      onCreate: migrationPlan.call,
      onUpgrade: migrationPlan.call,
    );
    return database;
  }

  Future<String> _getDatabaseDirPath() async {
    if (GetPlatform.isDesktop) {
      sqfliteFfiInit();
      databaseFactory = databaseFactoryFfi;
      return await databaseFactory.getDatabasesPath();
    }
    return await getDatabasesPath();
  }

  Future<MigrationPlan> _getMigrationPlan() async {
    final plan = MigrationPlan({
      1: [
        await _migrationFromFile(
          'migrations/v1_initial_data_structure.sql',
        ),
      ],
    });
    return plan;
  }

  Future<Migration> _migrationFromFile(String path) async {
    final sql = await rootBundle.loadString(path);
    return SqlMigration(sql);
  }
}
