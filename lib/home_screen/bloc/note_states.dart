part of 'note_bloc.dart';

abstract class NoteState extends Equatable {
  const NoteState();

  @override
  List<Object> get props => [];
}

class NoteInitial extends NoteState {}

class NoteLoaded extends NoteState {
  final List<String> notes;

  const NoteLoaded(this.notes);

  @override
  List<Object> get props => [notes];
}