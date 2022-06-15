import 'package:flutter_notes/app/modules/note/data/models/note_model.dart';
import 'package:equatable/equatable.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();
}

//add note event
class AddNoteEvent extends NoteEvent {
  final Note note;

  const AddNoteEvent({required this.note});

  @override
  List<Object> get props => [Note];
}

// remove note event
class RemoveNoteEvent extends NoteEvent {
  final int noteId;

  const RemoveNoteEvent({required this.noteId});

  @override
  List<Object> get props => [noteId];
}

//get all notes event
class GetAllNotesEvent extends NoteEvent {
  @override
  List<Object> get props => [];
}
