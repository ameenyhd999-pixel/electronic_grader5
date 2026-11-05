import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class LocalDatabase {
  LocalDatabase._();

  static final LocalDatabase instance = LocalDatabase._();
  static const String _databaseName = 'electronic_grader.db';
  static const int _databaseVersion = 1;

  Future<Database>? _openingDatabase;

  Future<Database> get database {
    final current = _openingDatabase;
    if (current != null) return current;

    final opening = _openDatabase();
    _openingDatabase = opening;
    return opening;
  }

  Future<void> close() async {
    final current = _openingDatabase;
    if (current == null) return;

    try {
      final database = await current;
      await database.close();
    } finally {
      _openingDatabase = null;
    }
  }

  Future<Database> _openDatabase() async {
    final databaseDirectory = await getDatabasesPath();
    final databasePath = path.join(databaseDirectory, _databaseName);

    try {
      return await openDatabase(
        databasePath,
        version: _databaseVersion,
        onConfigure: (database) async {
          await database.execute('PRAGMA foreign_keys = ON');
        },
        onCreate: (database, version) async {
          await database.execute('''
            CREATE TABLE app_settings (
              setting_key TEXT PRIMARY KEY,
              setting_value TEXT NOT NULL,
              updated_at TEXT NOT NULL
            )
          ''');
          await database.execute('''
            CREATE TABLE app_metadata (
              metadata_key TEXT PRIMARY KEY,
              metadata_value TEXT NOT NULL
            )
          ''');
        },
      );
    } catch (_) {
      _openingDatabase = null;
      rethrow;
    }
  }
}
