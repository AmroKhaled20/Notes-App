import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/simple_bloc_observer.dart';
import 'package:notes_app/views/edit_notes_view.dart';
import 'package:notes_app/views/notes_view.dart';

void main() async {
  await Hive.initFlutter();

  Bloc.observer = SimpleBlocObserver();

  Hive.registerAdapter(NoteModelAdapter());
  await Hive.openBox<NoteModel>(kNotesBox);

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
      home: BlocProvider(
        create: (context) => ReadNotesCubit(),
        child: const NotesView(),
      ),
    );
  }
}
