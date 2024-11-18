import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:nodebook/screen_edit/screen_edit.dart';
import 'package:nodebook/second_screen/view/screnn_node.dart';
import 'note_bloc.dart';

void navigateToAddNoteScreen(BuildContext context) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => AddNoteScreen()),
  );

  if (result != null && result.isNotEmpty) {
    BlocProvider.of<NoteBloc>(context).add(AddNote(result));
  }
}

void editNote(BuildContext context, int index, String note) async {
  final result = await Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => EditNoteScreen(note: note)),
  );

  if (result != null && result.isNotEmpty) {
    BlocProvider.of<NoteBloc>(context).add(EditNote(index, result));
  }
}

void removeNote(BuildContext context, int index) {
  BlocProvider.of<NoteBloc>(context).add(RemoveNote(index));
}