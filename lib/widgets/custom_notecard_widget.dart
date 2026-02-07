import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/views/edit_notes_view.dart';

class CustomNotecardWidget extends StatelessWidget {
  final NoteModel noteItem;
  const CustomNotecardWidget({required this.noteItem});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: GestureDetector(
        onLongPress: () {
          Navigator.pushNamed(context, EditNotesView.id, arguments: noteItem);
        },
        child: Container(
          width: double.infinity,

          decoration: BoxDecoration(
            color: Color(noteItem.color),
            borderRadius: BorderRadius.circular(18),
          ),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ListTile(
                  contentPadding: EdgeInsets.all(0),
                  title: Text(noteItem.title),
                  titleTextStyle: const TextStyle(
                    color: Colors.black,
                    fontSize: 26,
                  ),
                  subtitle: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(noteItem.subtitle),
                  ),
                  subtitleTextStyle: TextStyle(
                    color: Colors.black.withAlpha(100),
                    fontSize: 18,
                  ),
                  trailing: Padding(
                    padding: const EdgeInsets.only(bottom: 15),
                    child: IconButton(
                      onPressed: () {
                        BlocProvider.of<ReadNotesCubit>(
                          context,
                        ).deleteNote(noteItem);
                      },
                      icon: Icon(Icons.delete, size: 32, color: Colors.black),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 15, bottom: 2),
                  child: Text(
                    noteItem.date,
                    style: TextStyle(color: Colors.black.withAlpha(100)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
