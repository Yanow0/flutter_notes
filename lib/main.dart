import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/app/modules/note/bloc/note_bloc.dart';
import 'package:flutter_notes/app_routes.dart';
import 'package:flutter_notes/core/di/locator.dart';

void main() {
  setupLocator();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  final NoteBloc noteBloc = locator<NoteBloc>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        initialRoute: '/',
        routes: kRoutes,
        builder: (_, widget) {
          //donner acces à tous les écran de l'app au FactureBloc
          return MultiBlocProvider(providers: [
            BlocProvider<NoteBloc>(
              create: (_) => noteBloc,
            )
          ], child: widget ?? Container());
        });
  }
}
