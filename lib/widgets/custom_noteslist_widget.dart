import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/widgets/custom_notecard_widget.dart';

class CustomNoteslistWidget extends StatelessWidget {
  const CustomNoteslistWidget();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadNotesCubit, ReadNotesState>(
      builder: (context, state) {
        return ListView.builder(
          itemCount: state is ReadNotesSuccess ? state.notes.length : 0,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 5),
              child: const CustomNotecardWidget(),
            );
          },
        );
      },
    );
  }
}
