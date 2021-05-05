import 'package:flutter/material.dart';
import 'package:notes_flutter/bloc/notes_bloc.dart';
import 'package:provider/provider.dart';

class AddNoteScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NotesBloc notesBloc = Provider.of<NotesBloc>(context);
    TextEditingController titleController = TextEditingController();
    TextEditingController noteController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Note"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: titleController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Enter title',
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10),
            child: TextField(
              controller: noteController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                hintText: 'Enter note',
              ),
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(elevation: 2),
            onPressed: () {
              notesBloc.addNote(
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
