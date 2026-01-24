import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomTextFieldWidget extends StatelessWidget {
  const CustomTextFieldWidget({
    required this.hintText,
    required this.controller,
    super.key,
  });
  final String hintText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: kPrimaryColor,
      keyboardType: TextInputType.multiline,
      maxLines: 5,
      minLines: 1,
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
