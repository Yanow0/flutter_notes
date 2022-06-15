import 'package:flutter_notes/app/modules/note/data/models/note_model.dart';
import 'package:equatable/equatable.dart';

abstract class NoteState extends Equatable {
  const NoteState();
}

//inital note state
class InitialNoteState extends NoteState {
  @override
  List<Object> get props => [];
}

// note loading state
class NoteListLoadingState extends NoteState {
  @override
  List<Object> get props => [];
}

// noteList success state
class NoteListSuccessState extends NoteState {
  final List<Note> notes;

  const NoteListSuccessState(this.notes);

  @override
  List<Object> get props => [notes];
}

//noteList error state
class NoteListErrorState extends NoteState {
  final String error;

  const NoteListErrorState(this.error);

  @override
  List<Object> get props => [error];
}
