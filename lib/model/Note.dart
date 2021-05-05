import 'package:floor/floor.dart';

@Entity(tableName: "notes_table")
class Note {
  @PrimaryKey(autoGenerate: true)
  int? id;
  String title;
  String note;

  Note({this.id, required this.title, required this.note});
}
