import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:todo/healper/consnant.dart';
import 'package:todo/model/db_model.dart';

class DbHealper {
  DbHealper._();
  static final DbHealper db = DbHealper._();

  Future<Database> initDb() async {
    print('inintDatabase=================');
    final path = join(await getDatabasesPath(), 'todo_database.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        return await db.execute('''
      CREATE TABLE $tableColumn(
        $idColumn INTEGER NOT NULL PRIMARY KEY AUTOINCREMENT,
        $titleColumn TEXT NOT NULL,
        $dateTimeCreatedColumn TEXT NOT NULL,
        $isCheckColumn INTEGER NOT NULL DEFAULT 0);
        ''');
      },
    );
  }

  Future<int> addTask(Task task) async {
    final db = await initDb();
    return db.insert(
      tableColumn,
      task.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> updateTask(Task task) async {
    final db = await initDb();
    return db.update(
      tableColumn,
      task.toMap(),
      where: '$idColumn = ?',
      whereArgs: [task.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<int> deleteTask(Task task) async {
    final db = await initDb();
    return db.delete(
      tableColumn,
      where: '$idColumn = ?',
      whereArgs: [task.id],
    );
  }

  Future<int> deleteAllTaskes() async {
    final db = await initDb();
    return db.delete(
      tableColumn,
    );
  }

  Future<List<Task>> getAllTaskes() async {
    final db = await initDb();
    final List<Map<String, dynamic>> myMap = await db.query(tableColumn);
    return List.generate(myMap.length, (i) {
      return Task(
        title: myMap[i][titleColumn],
        dateTimeCreated: myMap[i][dateTimeCreatedColumn],
        id: myMap[i][idColumn],
        isDone: myMap[i][isCheckColumn] == 1 ? true : false,
      );
    });
  }
}
