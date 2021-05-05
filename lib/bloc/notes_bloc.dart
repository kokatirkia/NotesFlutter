import 'dart:async';

import 'package:notes_flutter/database/database.dart';
import 'package:notes_flutter/model/Note.dart';

class NotesBloc {
  late final notesDao;

  final _notesController = StreamController<List<Note>>();

  Stream<List<Note>> get notes => _notesController.stream;

  NotesBloc() {
    init();
  }

  init() async {
    notesDao = await NotesDatabase.create();
    _notesController.sink.addStream(notesDao.getNotes());
  }

  addNote(String title, String note) async {
    await notesDao.insertNote(Note(title: title, note: note));
  }

  updateNote(Note noteObject, String title, String note) async {
    noteObject.title = title;
    noteObject.note = note;
    await notesDao.updateNote(noteObject);
  }

  deleteNote(Note note) async {
    await notesDao.deleteNote(note);
  }

  dispose() {
    _notesController.close();
  }
}
