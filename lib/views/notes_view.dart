import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_bar_widget.dart';
import 'package:notes_app/widgets/custom_notecard_widget.dart';

class NotesView extends StatelessWidget {
  const NotesView();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: const Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomBarWidget(),
              SizedBox(height: 10,),
              CustomNotecardWidget(),
              ]),
        ),
      ),
    );
  }
}
