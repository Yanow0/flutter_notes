import 'package:flutter_notes/app/modules/note/data/models/note_model.dart';
import 'package:sqflite/sqflite.dart';

class NoteCacheProvider {
  static const _name = "NotesDatabase.db";
  static const _version = 2;
  late Database database;
  static const tableName = 'notes';

  initDatabase() async {
    database = await openDatabase(_name, version: _version,
        onCreate: (Database db, int version) async {
      await db.execute('''CREATE TABLE $tableName (
                    id INTEGER PRIMARY KEY AUTOINCREMENT,
                    title TEXT,
                    content TEXT,
                    noteColor TEXT,
                    imagePath TEXT
                    )''');
    });
  }

  Future<int> insertNote(Note note) async {
    await initDatabase();
    return await database.insert(tableName, note.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> updateNote(Note note) async {
    await initDatabase();
    return await database.update(tableName, note.toMap(),
        where: "id = ?",
        whereArgs: [note.id],
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Note>> getAllNotes() async {
    await initDatabase();
    var result = await database.query(tableName);
    return result.map((e) => Note.fromJson(e)).toList();
  }

  Future<Map<String, dynamic>?> getNotes(int id) async {
    await initDatabase();
    var result =
        await database.query(tableName, where: "id = ?", whereArgs: [id]);

    if (result.isNotEmpty) {
      return result.first;
    }

    return null;
  }

  Future<int> deleteNote(int id) async {
    await initDatabase();
    return await database.delete(tableName, where: "id = ?", whereArgs: [id]);
    print("id: $id");
    // return await database.rawDelete('DELETE FROM $tableName WHERE id = ?', [id]);
  }

  closeDatabase() async {
    await database.close();
  }
}
