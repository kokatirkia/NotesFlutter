import 'package:floor/floor.dart';
import 'package:notes_flutter/model/Note.dart';

@dao
abstract class NotesDao {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertNote(Note note);

  @Query('SELECT * FROM notes_table')
  Stream<List<Note>> getNotes();

  @update
  Future<void> updateNote(Note note);

  @delete
  Future<void> deleteNote(Note note);
}
