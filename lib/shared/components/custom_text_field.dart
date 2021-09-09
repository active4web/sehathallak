import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  int maxLines = 1;
  Widget suffixIcon;
  CustomTextField(
      {this.controller, this.hintText, this.maxLines, this.suffixIcon});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Container(
        child: TextField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            hintText: hintText,
            isDense: true,
            suffixIcon: suffixIcon,
            hintStyle: TextStyle(fontSize: 12, color: kGreyColor),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: kGreyColor)),
          ),
        ),
      ),
    );
  }
}
