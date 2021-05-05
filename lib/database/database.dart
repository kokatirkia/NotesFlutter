import 'dart:async';

import 'package:floor/floor.dart';
import 'package:notes_flutter/database/notes_dao.dart';
import 'package:notes_flutter/model/Note.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'database.g.dart';

@Database(version: 1, entities: [Note])
abstract class NotesDatabase extends FloorDatabase {
  NotesDao get notesDao;

  static Future<NotesDao> create() async {
    final database =
        await $FloorNotesDatabase.databaseBuilder('NotesDatabase.db').build();
    return database.notesDao;
  }
}
