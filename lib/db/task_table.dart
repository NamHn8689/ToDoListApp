import 'package:sqflite/sqflite.dart';

import '../model/task.dart';
import 'task_database.dart';

class TaskTable {
  static const TABLE_NAME = 'MyTable';

  static const CREATE_TABLE_QUERY = '''
    CREATE TABLE $TABLE_NAME(
      id TEXT PRIMARY KEY,
      description TEXT,
      date TEXT,
      time TEXT
      )''';

  static const DROP_TABLE_QUERY = '''
    DROP TABLE IF EXISTS $TABLE_NAME
  ''';

  Future<int> insertTask(Task task) {
    final db = TaskDatabase.instanse.database;
    return db.insert(TABLE_NAME, task.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<void> deleteTask(Task task) async {
    final db = TaskDatabase.instanse.database;
    await db.delete(TABLE_NAME, where: 'id = ?', whereArgs: [task.id]);
  }

  Future<List<Task>> selectAllTask() async {
    final db = TaskDatabase.instanse.database;
    final maps = await db.query(TABLE_NAME);

    return List.generate(maps.length, (index) {
      return Task(
        maps[index]['id'],
        maps[index]['description'],
        maps[index]['date'],
        maps[index]['time'],
      );
    });
  }
}
