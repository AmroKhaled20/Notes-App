import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/add_note_cubit/add_note_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_buttonadd_widget.dart';
import 'package:notes_app/widgets/custom_textfield_widget.dart';

class AddNoteForm extends StatefulWidget {
  AddNoteForm({super.key});
  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  AutovalidateMode autovalidateMode = AutovalidateMode.disabled;
  String? title, subtitle;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: AddNoteForm(),
        ),
      ),
    );
  }

  Form AddNoteForm() {
    return Form(
      key: formKey,
      autovalidateMode: autovalidateMode,
      child: Column(
        children: [
          const SizedBox(height: 40),
          CustomTextFieldWidget(
            hintText: 'Title',
            onSaved: (value) {
              title = value;
            },
          ),
          const SizedBox(height: 20),
          CustomTextFieldWidget(
            hintText: 'Content',
            onSaved: (value) {
              subtitle = value;
            },
          ),
          const SizedBox(height: 140),
          CustomButtonaddWidget(
            buttonText: 'Add',
            onTap: () {
              if (formKey.currentState!.validate()) {
                formKey.currentState!.save();
                NoteModel note = NoteModel(
                  title: title!,
                  subtitle: subtitle!,
                  date: DateTime.now().toString(),
                  color: Colors.blue.value,
                );
                BlocProvider.of<AddNoteCubit>(context).addNote(note);
              } else {
                autovalidateMode = AutovalidateMode.always;
                setState(() {});
              }
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
