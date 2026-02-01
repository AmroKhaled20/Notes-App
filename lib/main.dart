import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/views/edit_notes_view.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();

  await Hive.openBox(kNotesBox);
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        NotesView.id: (context) => NotesView(),
        EditNotesView.id: (context) => EditNotesView(),
      },
      debugShowCheckedModeBanner: false,
      theme: ThemeData(brightness: Brightness.dark, fontFamily: 'Poppins'),
      home: const NotesView(),
    );
  }
}
