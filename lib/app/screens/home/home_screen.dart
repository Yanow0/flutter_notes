import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_notes/app/screens/note/note_screen.dart';
import 'package:flutter_notes/app_routes.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
      title: const Text('Home'),
    ));
  }
}
