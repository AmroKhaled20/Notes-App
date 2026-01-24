import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';
import 'package:notes_app/widgets/custom_buttonadd_widget.dart';
import 'package:notes_app/widgets/custom_textfield_widget.dart';

class CustomAddnoteBottomsheetWidget extends StatelessWidget {
  const CustomAddnoteBottomsheetWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.5,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: SingleChildScrollView(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: Column(
            children: [
              SizedBox(height: 40),
              CustomTextFieldWidget(hintText: 'Title', controller: controller),
              SizedBox(height: 20),
              CustomTextFieldWidget(
                hintText: 'Content',
                controller: controller,
              ),
              SizedBox(height: 140),
              CustomButtonaddWidget(buttonText: 'Add'),
              SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
