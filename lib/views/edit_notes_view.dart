import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/read_notes_cubit/read_notes_cubit.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_bar_widget.dart';
import 'package:notes_app/widgets/custom_textfield_widget.dart';

class EditNotesView extends StatefulWidget {
  static const String id = 'Edit view';
  const EditNotesView({super.key});

  @override
  State<EditNotesView> createState() => _EditNotesViewState();
}

class _EditNotesViewState extends State<EditNotesView> {
  late TextEditingController titleController;
  late TextEditingController contentController;

  late int noteColor;
  late Color textColor;
  late NoteModel note;

  bool _isLight(Color color) => color.computeLuminance() > 0.5;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    note = ModalRoute.of(context)!.settings.arguments as NoteModel;

    noteColor = note.color;
    textColor = _isLight(Color(noteColor)) ? Colors.black : Colors.white;

    titleController = TextEditingController(text: note.title);
    contentController = TextEditingController(text: note.subtitle);
  }

  @override
  void dispose() {
    titleController.dispose();
    contentController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(noteColor),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomBarWidget(
                icon: Icons.done,
                colorr: textColor,
                onPressed: () {
                  note.title = titleController.text;
                  note.subtitle = contentController.text;
                  note.save();
                  BlocProvider.of<ReadNotesCubit>(context).fetchAllNotes();
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 40),
              CustomTextFieldWidget(
                hintText: 'Title',
                controller: titleController,
                minLines: 1,
                maxLines: 3,
                textColor: textColor,
              ),
              const SizedBox(height: 20),
              CustomTextFieldWidget(
                hintText: 'Content',
                controller: contentController,
                minLines: 6,
                maxLines: 6,
                textColor: textColor,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
