import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:notes_app/widgets/custom_icon_widget.dart';

class CustomBarWidget extends StatelessWidget {
  const CustomBarWidget({required this.icon, this.colorr = Colors.white});
  final IconData icon;
  final Color? colorr;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Notes',
            style: TextStyle(
              color: colorr,
              fontSize: 23,
              fontWeight: FontWeight.w400,
            ),
          ),

          CustomIconhWidget(icon: icon, iconColor: colorr),
        ],
      ),
    );
  }
}
