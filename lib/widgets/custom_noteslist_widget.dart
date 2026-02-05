import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/widgets/custom_notecard_widget.dart';

class CustomNoteslistWidget extends StatelessWidget {
  const CustomNoteslistWidget();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 10,
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.only(bottom: 5),
          child: const CustomNotecardWidget(),
        );
      },
    );
  }
}
