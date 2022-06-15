import 'package:flutter_notes/app/modules/note/bloc/note_bloc.dart';
import 'package:get_it/get_it.dart';

GetIt locator = GetIt.instance;

void setupLocator() {
  locator.registerLazySingleton(() => NoteBloc());
}
