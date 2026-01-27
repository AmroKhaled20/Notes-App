import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/custom_icon_widget.dart';

class CustomBarWidget extends StatelessWidget {
  const CustomBarWidget({required this.icon});
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Text(
            'Notes',
            style: TextStyle(fontSize: 23, fontWeight: FontWeight.w400),
          ),

          CustomIconhWidget(icon: icon),
        ],
      ),
    );
  }
}
