import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_notes/app/modules/note/bloc/note_bloc.dart';
import 'package:flutter_notes/app/modules/note/bloc/note_events.dart';
import 'package:flutter_notes/app/modules/note/bloc/note_states.dart';
import 'package:flutter_notes/core/di/locator.dart';

class NoteScreen extends StatefulWidget {
  const NoteScreen({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _NoteScreenState createState() => _NoteScreenState();
}

class _NoteScreenState extends State<NoteScreen> {
  NoteBloc noteBloc = locator<NoteBloc>();

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
        title: const Text('Note'),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
          buildWhen: (previous, current) => previous is NoteListLoadingState,
          builder: (_, state) {
            if (state is NoteListSuccessState) {
              return ListView(
                children: state.notes
                    .map((note) => InkWell(
                          onTap: () {
                            noteBloc.add(GetAllNotesEvent());
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Card(
                              elevation: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(20.0),
                                child: Text(
                                  note.title,
                                  style: const TextStyle(fontSize: 24),
                                ),
                              ),
                            ),
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
          }),
    );
  }
}
