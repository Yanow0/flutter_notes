import 'package:flutter_notes/theme/note_colors.dart';

class Note {
  int? id;
  String title;
  String content;
  String noteColor;
  String imagePath;

  Note(
      {this.id,
      this.title = "Note",
      this.content = "Put text here...",
      this.noteColor = "red",
      this.imagePath = ""});

  Map<String, dynamic> toMap() {
    Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['title'] = title;
    data['content'] = content;
    data['noteColor'] = noteColor;
    data['imagePath'] = imagePath;
    return data;
  }

  @override
  toString() {
    return {
      'id': id,
      'title': title,
      'content': content,
      'noteColor': noteColor,
      'imagePath': imagePath
    }.toString();
  }
}
