import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_bar_widget.dart';
import 'package:notes_app/widgets/custom_notecard_widget.dart';
import 'package:notes_app/widgets/custom_noteslist_widget.dart';

class NotesView extends StatelessWidget {
  const NotesView();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomBarWidget(),
              SizedBox(height: 10),
              Expanded(child: CustomNoteslistWidget()),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},

          backgroundColor: const Color.fromARGB(255, 73, 143, 249),
          child: IconButton(onPressed: () {}, icon: Icon(Icons.add, size: 35)),
        ),
      ),
    );
  }
}
