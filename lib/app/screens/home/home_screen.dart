import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/app/modules/note/bloc/note_bloc.dart';
import 'package:flutter_notes/app/modules/note/data/repository/note_repository.dart';
import 'package:flutter_notes/app/modules/note/bloc/note_states.dart';
import 'package:flutter_notes/core/di/locator.dart';

import '../../modules/note/bloc/note_events.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // final NoteRepository _noteRepository = NoteRepository();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Note'),
        ),
        body: SafeArea(
            child: ListView(children: [
          // Add button to add new note
          ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/note');
              },
              child: const Text('Add note')),
          BlocBuilder<NoteBloc, NoteState>(
            buildWhen: (previous, current) => previous is NoteListLoadingState,
            builder: (context, state) {
              if (state is NoteListSuccessState) {
                return ListView(
                  children: state.notes
                      .map((note) => ListTile(
                            title: Text(note.title),
                            subtitle: Text(note.content),
                            trailing: IconButton(
                              icon: Icon(Icons.delete),
                              onPressed: () {
                                // BlocProvider.of<NoteBloc>(context)
                                //     .add(DeleteNoteEvent(note));
                              },
                            ),
                          ))
                      .toList(),
                );
              }
              if (state is NoteListLoadingState) {
                return const Center(child: CircularProgressIndicator());
              }
              if (state is NoteListErrorState) {
                return Center(child: Text(state.error));
              }
              return Container();
            },
          ),
        ])));
  }
}
