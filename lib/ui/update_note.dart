import 'package:flutter/material.dart';
import 'package:notes_flutter/bloc/notes_bloc.dart';
import 'package:notes_flutter/model/Note.dart';
import 'package:provider/provider.dart';

class UpdateNoteScreen extends StatelessWidget {
  final Note note;

  UpdateNoteScreen(this.note) : super();

  @override
  Widget build(BuildContext context) {
    NotesBloc notesBloc = Provider.of<NotesBloc>(context);
    TextEditingController titleController = TextEditingController();
    titleController.text = note.title;
    TextEditingController noteController = TextEditingController();
    noteController.text = note.note;
    return Scaffold(
      appBar: AppBar(
        title: Text("Update Note"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: titleController,
              decoration: InputDecoration(
                hintText: 'Enter title',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: noteController,
              decoration: InputDecoration(
                hintText: 'Enter note',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 2),
            onPressed: () {
              notesBloc.updateNote(
                note,
                titleController.text.toString(),
                noteController.text.toString(),
              );
              Navigator.pop(context);
            },
            child: Text('Save'),
          )
        ],
      ),
    );
  }
}
