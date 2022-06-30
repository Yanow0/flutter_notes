import 'package:flutter/material.dart';
import 'package:flutter_notes/app/screens/note/note_screen.dart';
import 'package:flutter_notes/app/screens/splash/splash_screen.dart';

import 'app/screens/home/home_screen.dart';

const kMainRoute = '/';
const kHomeRoute = '/home';
const kNoteRoute = '/note';

final Map<String, WidgetBuilder> kRoutes = {
  kMainRoute: (_) => const SplashScreen(),
  kHomeRoute: (_) => const HomeScreen(),
  // kNoteRoute: (_) => const NoteScreen(),
};
