// db_helper.dart
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'db_memo.dart';

class MemoHelper {
  late Database _database;

  Future<Database> get database async {
    _database = await _openDb();
    return _database;
  }
  // 데이터베이스를 시작한다.
  Future _openDb() async {
    final databasePath = await getDatabasesPath();
    String path = join(databasePath, 'my_database.db');

    return await openDatabase(
      path,
      version: 1,
      onConfigure: (Database db) => {},
      onCreate: _onCreate,
      onUpgrade: (Database db, int oldVersion, int newVersion) => {},
    );
  }

  // 데이터베이스 테이블 생성.
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE IF NOT EXISTS memo (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT NOT NULL,
        contents TEXT NOT NULL
      )
    ''');
  }

  // 새로운 데이터 추가.
  Future add(item) async {
    final db = await database;

    // json 형식
    item.id = await db.insert(
      'memo',  // table name
      {
        'title': item.title,
        'contents': item.contents
      },  // new data
      conflictAlgorithm: ConflictAlgorithm.replace,
    );

    // query 사용
    // item.id = await db.rawInsert(
    //   'INSERT INTO memo(title, contents) VALUES( ?, ? )',  // new data
    //   [item.title, item.contents],
    // );

    return item;
  }

  // 데이터 업데이트
  Future update(item) async {
    final db = await database;

    // json 방식
    await db.update(
      'memo',  // table name
      {
        'title': item.title,
        'contents': item.contents
      },  // update data
      where: 'id = ?',
      whereArgs: [item.id],
    );

    // query 사용
    // await db.rawUpdate(
    //   'UPDATE user SET title = ?, contents = ? WHERE id = ?',
    //   [item.title, item.contents, item.id],
    // );

    return item;
  }

  // 데이터 삭제.
  Future<int> remove(int id) async {
    final db = await database;

    // json 형식
    await db.delete(
      'memo', // table name
      where: 'id = ?',
      whereArgs: [id],
    );

    // query 사용
    // await db.rawDelete(
    //   'DELETE FROM memo WHERE id = ?',
    //    [id],
    // );

    return id;
  }

  // 전체 데이터 조회
  Future<List<Memo>> getAllMemo() async {
    final db = await database;

    final List<Map<String, dynamic>> maps = await db.query('memo');

    late List<Memo> todoList = [];
    for(int i = 0 ; i < maps.length; i++){
      todoList.add(Memo(
        id: maps[i]['id'],
        title: maps[i]['title'],
        contents: maps[i]['contents'],
      ));
    }
    return todoList;

    // return List.generate(maps.length, (i) {
    //     return Memo(
    //       id: maps[i]['id'],
    //       title: maps[i]['title'],
    //       contents: maps[i]['contents'],
    //     );
    //   }
    // );

  }

  // 한 데이터 조회
  Future<dynamic> getMemo(int id) async {
    final db = await database;

    final List<Map<String, dynamic>> maps = (await db.query(
      'memo',
      where: 'id = ?',
      whereArgs: [id],
    ));

    // final List<Map<String, dynamic>> maps = await db.rawQuery('SELECT * FROM memo WHERE name=?', [id]);

    return maps.isNotEmpty ? maps : null;
  }


}