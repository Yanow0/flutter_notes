import 'package:flutter/material.dart';
import 'package:flutter_notes/app/modules/note/data/models/note_model.dart';
import 'package:image_picker/image_picker.dart';

class NoteScreen extends StatefulWidget {
  final Note note;
  const NoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  // Allow you to open camera and take picture
  List<XFile> pickedImages = [];
  launchCamera() async {
    final ImagePicker picker = ImagePicker();
    var pickedImage = await picker.pickImage(source: ImageSource.camera);
    print(pickedImage?.path); // ignore: avoid_print
    pickedImages.add(pickedImage!);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ajouter une Note'),
      ),
      body: ListView(children: [
        ElevatedButton(
            onPressed: () {
              launchCamera();
            },
            child: const Text('Prendre une photo')),
        TextField(
          decoration: InputDecoration(
              labelText: widget.note.title, border: InputBorder.none),
          onChanged: (text) {
            print('Title: $text');
          },
          maxLines: null,
          textCapitalization: TextCapitalization.sentences,
        ),
        TextField(
          decoration: InputDecoration(
              labelText: widget.note.content, border: InputBorder.none),
          onChanged: (text) {
            print('Content: $text');
          },
        ),
      ]),
    );
  }
}
