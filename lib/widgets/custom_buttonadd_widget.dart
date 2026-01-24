import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButtonaddWidget extends StatelessWidget {
  const CustomButtonaddWidget({required this.buttonText, this.onTap});
  final String buttonText;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        disabledBackgroundColor: kPrimaryColor,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onTap,
      child: Text(
        buttonText,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w700,
          color: const Color.fromARGB(255, 0, 0, 0),
        ),
      ),
    );
  }
}
