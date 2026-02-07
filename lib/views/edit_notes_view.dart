import 'package:flutter/material.dart';
import 'package:notes_app/models/note_model.dart';
import 'package:notes_app/widgets/custom_bar_widget.dart';
import 'package:notes_app/widgets/custom_textfield_widget.dart';

class EditNotesView extends StatefulWidget {
  static const String id = 'Edit view';
  const EditNotesView();

  @override
  State<EditNotesView> createState() => _EditNotesViewState();
}

class _EditNotesViewState extends State<EditNotesView> {
  late TextEditingController titleController;
  late TextEditingController contentController;
  late int noteColor;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final NoteModel note =
        ModalRoute.of(context)!.settings.arguments as NoteModel;
    noteColor = note.color;
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
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(noteColor),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomBarWidget(icon: Icons.done),
              SizedBox(height: 40),
              CustomTextFieldWidget(
                hintText: 'Title',
                controller: titleController,
                minLines: 1,
                maxLines: 3,
              ),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                hintText: 'Content',
                controller: contentController,
                minLines: 6,
                maxLines: 6,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
