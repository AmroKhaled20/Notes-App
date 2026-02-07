import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    required this.hintText,
    this.controller,
    this.onSaved,
    this.maxLines = 1,
    this.minLines = 1,
    super.key,
  });
  final String hintText;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final int maxLines;
  final int minLines;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      onSaved: onSaved,
      validator: (value) {
        if (value?.isEmpty ?? true) {
          return 'Feild is required';
        } else {
          return null;
        }
      },
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.multiline,
      maxLines: maxLines,
      minLines: minLines,
      textInputAction: TextInputAction.newline,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(16)),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: kPrimaryColor, width: 2),
          borderRadius: BorderRadius.circular(16),
        ),
      ),
    );
  }
}
