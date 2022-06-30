import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/app/modules/note/bloc/note_bloc.dart';
import 'package:flutter_notes/app/modules/note/data/models/note_model.dart';
import 'package:flutter_notes/app/modules/note/data/repository/note_repository.dart';
import 'package:flutter_notes/app/modules/note/bloc/note_states.dart';
import 'package:flutter_notes/app/screens/note/note_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final NoteRepository _noteRepository = NoteRepository();

  void deleteNote(int noteid, List<Note> listnotes) async {
    await _noteRepository.deleteNote(noteid);
    listnotes.removeWhere((note) => note.id == noteid);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Note'),
        ),
        body: SafeArea(
            child: ListView(shrinkWrap: true, children: [
          // Add button to add new note
          ElevatedButton(
              onPressed: () {
                Note note = Note(
                    title: 'Titulo',
                    content: 'Conteno',
                    noteColor: '#ff0000',
                    imagePath: 'assets/images/note1.jpg');

                _noteRepository.insertNote(note);

                // Navigator.pushNamed(context, '/note');
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => NoteScreen(note: note),
                    ));
              },
              child: const Text('Add note')),
          BlocBuilder<NoteBloc, NoteState>(
            buildWhen: (previous, current) => previous is NoteListLoadingState,
            builder: (context, state) {
              if (state is NoteListSuccessState) {
                return ListView(
                  shrinkWrap: true,
                  children: state.notes
                      .map((note) => ListTile(
                            title: Text(note.title),
                            subtitle: Text(note.content),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                deleteNote(note.id, state.notes);
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
