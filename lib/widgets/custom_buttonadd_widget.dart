import 'package:flutter/material.dart';
import 'package:notes_app/constants.dart';

class CustomButtonaddWidget extends StatelessWidget {
  const CustomButtonaddWidget({
    required this.buttonText,
    this.onTap,
    required this.isloading,
  });
  final String buttonText;
  final bool isloading;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: kPrimaryColor,
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      onPressed: onTap,

      child: isloading
          ? Center(
              child: SizedBox(
                height: 28,
                width: 28,
                child: CircularProgressIndicator(color: Colors.black),
              ),
            )
          : Text(
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
