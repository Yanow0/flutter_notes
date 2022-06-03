import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_notes/app/screens/home/home_screen.dart';
import 'package:flutter_notes/app_routes.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Note'),
    ));
  }
}
