import 'package:flutter/material.dart';
import 'package:notes_app/widgets/custom_bar_widget.dart';
import 'package:notes_app/widgets/custom_textfield_widget.dart';

class EditNotesView extends StatelessWidget {
  const EditNotesView();
  @override
  Widget build(BuildContext context) {
    TextEditingController controller = TextEditingController();
    return SafeArea(
      child: Scaffold(
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              CustomBarWidget(icon: Icons.done),
              SizedBox(height: 40),
              CustomTextFieldWidget(hintText: 'Title', controller: controller),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                hintText: 'Content',
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
