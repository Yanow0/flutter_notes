import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

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
        title: const Text('Ajout Note'),
      ),
      body: ListView(children: [
        ElevatedButton(
            onPressed: () {
              launchCamera();
            },
            child: const Text('Prendre une photo')),
      ]),
    );
  }
}
