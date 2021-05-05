import 'package:flutter/material.dart';
import 'package:notes_flutter/bloc/notes_bloc.dart';
import 'package:notes_flutter/ui/notes.dart';
import 'package:provider/provider.dart';

class NotesApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (_) => NotesBloc(),
      dispose: (_, NotesBloc notesBloc) => notesBloc.dispose(),
      child: MaterialApp(
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: NotesScreen(),
      ),
    );
  }
}
