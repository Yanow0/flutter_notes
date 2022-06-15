import 'package:flutter_notes/app/modules/note/data/models/note_model.dart';
import 'package:flutter_notes/app/modules/note/data/providers/note_cache_provider.dart';

class NoteRepository {
  final NoteCacheProvider _cache = NoteCacheProvider();

  Future<int> insertNote(Note note) async {
    return await _cache.insertNote(note);
  }

  Future<int> updateNote(Note note) async {
    return await _cache.updateNote(note);
  }

  Future<List<Note>> getAllNotes() async {
    return await _cache.getAllNotes();
  }

  Future<Map<String, dynamic>?> getNotes(int id) async {
    return await _cache.getNotes(id);
  }

  Future<int> deleteNote(int id) async {
    return await _cache.deleteNote(id);
  }

  closeDatabase() async {
    await _cache.closeDatabase();
  }
}
