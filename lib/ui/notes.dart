import 'package:flutter/material.dart';
import 'package:notes_flutter/bloc/notes_bloc.dart';
import 'package:notes_flutter/model/Note.dart';
import 'package:notes_flutter/ui/add_note.dart';
import 'package:notes_flutter/ui/update_note.dart';
import 'package:provider/provider.dart';

class NotesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    NotesBloc notesBloc = Provider.of<NotesBloc>(context);
    return Scaffold(
      appBar: AppBar(
        title: Text("Notes"),
      ),
      body: StreamBuilder(
        stream: notesBloc.notes,
        builder: (context, AsyncSnapshot<List<Note>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Card(
                  child: ListTile(
                    title: Text('${snapshot.data![index].title}'),
                    trailing: IconButton(
                      icon: Icon(Icons.delete),
                      onPressed: () {
                        notesBloc.deleteNote(snapshot.data![index]);
                      },
                    ),
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                                UpdateNoteScreen(snapshot.data![index])),
                      );
                    },
                  ),
                );
              },
            );
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => AddNoteScreen()),
          );
        },
      ),
    );
  }
}
