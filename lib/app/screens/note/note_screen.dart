import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_notes/app/modules/note/data/models/note_model.dart';
import 'package:flutter_notes/app/screens/home/home_screen.dart';
import 'package:image_picker/image_picker.dart';

import '../../modules/note/data/repository/note_repository.dart';

class NoteScreen extends StatefulWidget {
  final Note note;
  const NoteScreen({Key? key, required this.note}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  final NoteRepository _noteRepository = NoteRepository();
  final titleController = TextEditingController();
  final contentController = TextEditingController();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    titleController.text = widget.note.title;
    contentController.text = widget.note.content;
  }

  // Allow you to open camera and take picture
  XFile? _image;
  void getImage(ImageSource imageSource) async {
    final ImagePicker picker = ImagePicker();
    XFile? imageFile = await picker.pickImage(
      source: imageSource,
    );
    if (imageFile == null) return;
    setState(() {
      _image = imageFile;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          onPressed: () async {
            await Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) => HomeScreen(),
                ));
            setState(() {});
          },
        ),
        title: const Text('Ajouter une Note'),
      ),
      body: SingleChildScrollView(
        child: Column(children: [
          if (_image != null)
            Container(
              padding: const EdgeInsets.all(10.0),
              width: MediaQuery.of(context).size.width,
              height: 250.0,
              child: Stack(
                children: [
                  Image.file(File(_image!.path)),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Container(
                        height: 20.0,
                        width: 32.0,
                        decoration: const BoxDecoration(
                            shape: BoxShape.circle, color: Colors.white),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _image = null;
                            });
                          },
                          child: const Icon(
                            Icons.delete,
                            size: 32.0,
                          ),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          TextField(
            decoration: const InputDecoration(
                labelText: "Titulo", border: InputBorder.none),
            controller: titleController,
            onChanged: (text) {
              widget.note.title = titleController.text.trim();
              _noteRepository.updateNote(widget.note);
            },
            maxLines: null,
            textCapitalization: TextCapitalization.sentences,
          ),
          TextField(
            decoration: const InputDecoration(
                labelText: "Conteno", border: InputBorder.none),
            controller: contentController,
            onChanged: (text) {
              widget.note.content = contentController.text.trim();
              _noteRepository.updateNote(widget.note);
            },
          ),
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          getImage(ImageSource.camera);
          widget.note.imagePath = _image!.path;
          _noteRepository.updateNote(widget.note);
        },
        child: const Icon(Icons.camera_alt),
      ),
    );
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }
}
