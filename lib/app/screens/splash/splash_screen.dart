import 'package:flutter_notes/app/modules/note/bloc/note_bloc.dart';
import 'package:flutter_notes/app/modules/note/bloc/note_events.dart';
import 'package:flutter_notes/app/modules/note/data/repository/note_repository.dart';
import 'package:flutter_notes/app_routes.dart';
import 'package:flutter_notes/core/di/locator.dart';
import 'package:flutter/material.dart';

import '../../modules/note/data/models/note_model.dart';

class SplashScreen extends StatefulWidget {
  // ignore: use_key_in_widget_constructors
  const SplashScreen({Key? key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  navigateNamedToHome(context) {
    Navigator.pushNamedAndRemoveUntil(context, kHomeRoute, (_) => false);
  }

  final NoteBloc noteBloc = locator<NoteBloc>();
  final NoteRepository _noteRepository = NoteRepository();

  loadNotes() {
    noteBloc.add(GetAllNotesEvent());
  }

  @override
  void initState() {
    loadNotes();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // le scaffold est un widget spécial primordial pour l'utilisation des widgets dans chaque écran
      body: Column(
        //le column sert à organiser les widgets fils verticaelement
        mainAxisAlignment: MainAxisAlignment.center,
        //ici les fils sont centrer veriticalement
        children: [
          Padding(
            //le padding crée un espace autour du widget
            padding: const EdgeInsets.all(8.0),
            child: Center(
              //le widget image est un widget qui affiche les images depuis l'application ou depuis un network
              child: InkWell(
                onTap: () => navigateNamedToHome(context),
                child: Image.asset(
                  'assets/images/logo.png',
                  height: 120,
                ),
              ),
            ),
          ),
          const Padding(
            // un padding peut avoir plusieurs parametre : exemple ici le padding est seulement horizontale
            padding: EdgeInsets.symmetric(horizontal: 60),
            child: Text(
              'Notes',
              style: TextStyle(
                  fontSize: 30, height: 1, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
          )
        ],
      ),
    );
  }
}
