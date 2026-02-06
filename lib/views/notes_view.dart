import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/widgets/custom_addnote_bottomsheet_widget.dart';
import 'package:notes_app/widgets/custom_bar_widget.dart';
import 'package:notes_app/widgets/custom_notecard_widget.dart';
import 'package:notes_app/widgets/custom_noteslist_widget.dart';

class NotesView extends StatefulWidget {
  static const String id = 'Notes view';
  const NotesView();

  @override
  State<NotesView> createState() => _NotesViewState();
}

class _NotesViewState extends State<NotesView> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomBarWidget(icon: Icons.search),
              SizedBox(height: 10),
              Expanded(child: CustomNoteslistWidget()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            showModalBottomSheet(
              isScrollControlled: true,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadiusGeometry.circular(32),
              ),
              context: context,
              builder: (context) {
                return CustomAddnoteBottomsheetWidget();
              },
            );
          },

          backgroundColor: const Color.fromARGB(255, 73, 143, 249),
          child: Icon(Icons.add, size: 35),
        ),
      ),
    );
  }
}
