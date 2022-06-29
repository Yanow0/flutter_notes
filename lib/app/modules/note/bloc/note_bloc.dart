import 'package:flutter_notes/app/modules/note/bloc/note_events.dart';
import 'package:flutter_notes/app/modules/note/bloc/note_states.dart';
import 'package:flutter_notes/app/modules/note/data/models/note_model.dart';
import 'package:flutter_notes/app/modules/note/data/repository/note_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(InitialNoteState()) {
    on<GetAllNotesEvent>(_onGetAllNotes);
  }

  final NoteRepository _noteRepository = NoteRepository();

  // lier les states à l'evenement GetAllNotesEvent
  void _onGetAllNotes(GetAllNotesEvent event, Emitter<NoteState> emit) async {
    // state de loading va etre écouté par l'UI
    emit(NoteListLoadingState());
    try {
      //get data from repository
      List<Note> notes = await _noteRepository.getAllNotes();

      //put data in state to be communicated to UI
      emit(NoteListSuccessState(notes));
    } catch (e) {
      //put error in state to be communicated to UI
      emit(NoteListErrorState(e.toString()));
    }
  }
}
