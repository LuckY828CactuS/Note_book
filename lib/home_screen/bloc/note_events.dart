part of 'note_bloc.dart';

abstract class NoteEvent extends Equatable {
  const NoteEvent();

  @override
  List<Object> get props => [];
}

class AddNote extends NoteEvent {
  final String note;

  const AddNote(this.note);

  @override
  List<Object> get props => [note];
}

class EditNote extends NoteEvent {
  final int index;
  final String note;

  const EditNote(this.index, this.note);

  @override
  List<Object> get props => [index, note];
}

class RemoveNote extends NoteEvent {
  final int index;

  const RemoveNote(this.index);

  @override
  List<Object> get props => [index];
}