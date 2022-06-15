class Note {
  Note(
      {required this.id,
      required this.title,
      required this.content,
      required this.noteColor,
      required this.imagePath});

  final int id;
  final String title;
  final String content;
  final String noteColor;
  final String imagePath;

  factory Note.fromJson(Map<String, dynamic> json) {
    return Note(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      noteColor: json['noteColor'],
      imagePath: json['imagePath'],
    );
  }

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
