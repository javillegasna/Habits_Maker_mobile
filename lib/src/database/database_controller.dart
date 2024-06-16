import 'package:habit_maker/src/database/services/sqlite/sqlite_service.dart';

class DatabaseController {
  final SQliteService sqliteService;

  DatabaseController(this.sqliteService);

  Future<void> loadLocalDatabase() async {
    await sqliteService.database;
  }
}
