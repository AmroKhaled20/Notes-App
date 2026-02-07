import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/widgets/add_note_form.dart';
import 'package:notes_app/widgets/custom_buttonadd_widget.dart';
import 'package:notes_app/widgets/custom_textfield_widget.dart';

class CustomAddnoteBottomsheetWidget extends StatelessWidget {
  const CustomAddnoteBottomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AddNoteCubit(),
      child: BlocConsumer<AddNoteCubit, AddNoteState>(
        listener: (context, state) {
          if (state is AddNoteFailure) {
            print('Faild ${state.errorMessage}');
          }

          if (state is AddNoteSuccess) {
            Navigator.pop(context);
            BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
          }
        },
        builder: (context, state) {
          return ModalProgressHUD(
            inAsyncCall: state is AddNoteLoading ? true : false,
            progressIndicator: Center(child: const CircularProgressIndicator()),
            child: AbsorbPointer(
              absorbing: state is AddNoteLoading ? true : false,
              child: Padding(
                padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom,
                ),
                child: AddNoteForm(),
              ),
            ),
          );
        },
      ),
    );
  }
}
