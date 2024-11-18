
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nodebook/home_screen/bloc/note_bloc.dart';
import 'package:nodebook/home_screen/bloc/note_functions.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: BlocProvider(
        create: (context) => NoteBloc(),
        child: const MyHomePage(title: 'Note Book'),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: BlocBuilder<NoteBloc, NoteState>(
        builder: (context, state) {
          if (state is NoteLoaded) {
            if (state.notes.isEmpty) {
              return Center(child: Text('No notes yet.'));
            }
            return ListView.builder(
              itemCount: state.notes.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(state.notes[index]),
                  trailing: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        onPressed: () => editNote(context, index, state.notes[index]),
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        onPressed: () => removeNote(context, index),
                      ),
                    ],
                  ),
                );
              },
            );
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => navigateToAddNoteScreen(context),
        child: Icon(Icons.add),
        tooltip: 'Add Note',
      ),
    );
  }
}

