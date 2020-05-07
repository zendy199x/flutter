import 'dart:async';

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

// import Task model
import '../models/task.dart';

class TasksDB {
  Database _database;

  // Mình để các biến final để sau này chỉ cần đổi một chỗ thôi cho tiện
  final String kTableName = 'tasks';
  final String kId = 'id';
  final String kTask = 'task';

  // Hàm mở database
  Future _openDB() async {
    // openDatabase được cung cấp bởi sqflite
    _database = await openDatabase(
      // lấy đường dẫn database, tasks.db là tên file do mình đặt
      join(await getDatabasesPath(), 'tasks.db'),
      onCreate: (db, version) {
        // Truy vấn tạo table khi database được tạo
        return db.execute(
            'CREATE TABLE $kTableName($kId INTEGER PRIMARY KEY AUTOINCREMENT, $kTask TEXT)');
      },
      // Phiên bản của database
      version: 1,
    );
  }

  // Thêm task vào database
  Future insert(Task task) async {
    // Phải chờ mở database trước khi thao tác tiếp
    await _openDB();
    // Thêm task sau khi đã được convert sang Map vào table kTableName
    await _database.insert(kTableName, task.toMap());
    print('Task inserted');
  }

  // Hàm cập nhật task
  Future update(Task task) async {
    await _openDB();
    // Cập nhật lại task tại record có id là id của task truyền vào
    await _database.update(
      kTableName,
      task.toMap(),
      where: '$kId = ?',
      whereArgs: [task.id],
    );
    print('Task updated');
  }

  // Xóa task
  Future delete(int id) async {
    await _openDB();
    // Xóa task có id là id được truyền vào
    print((await _database.delete(
      kTableName,
      where: '$kId = ?',
      whereArgs: [id],
    )));
    print('Task deleted');
  }

  // Lấy toàn bộ task trong database
  Future<List<Task>> getTasks() async {
    await _openDB();
    // Query toàn bộ table kTableName về một List<Map>
    List<Map<String, dynamic>> maps = await _database.query(kTableName);
    // Chuyển List<Map> về dạng List<Task> và return về List đó
    return List.generate(
        maps.length,
        (i) => Task(
              id: maps[i][kId],
              task: maps[i][kTask],
            ));
  }
}
