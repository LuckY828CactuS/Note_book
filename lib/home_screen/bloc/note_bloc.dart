import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'note_events.dart';
part 'note_states.dart';

class NoteBloc extends Bloc<NoteEvent, NoteState> {
  NoteBloc() : super(NoteInitial()) {
    on<AddNote>((event, emit) {
      final notes = state is NoteLoaded ? (state as NoteLoaded).notes : [];
      emit(NoteLoaded([...notes, event.note]));
    });

    on<EditNote>((event, emit) {
      if (state is NoteLoaded) {
        final notes = (state as NoteLoaded).notes;
        notes[event.index] = event.note;
        emit(NoteLoaded([...notes]));
      }
    });

    on<RemoveNote>((event, emit) {
      if (state is NoteLoaded) {
        final notes = (state as NoteLoaded).notes;
        notes.removeAt(event.index);
        emit(NoteLoaded([...notes]));
      }
    });
  }
}