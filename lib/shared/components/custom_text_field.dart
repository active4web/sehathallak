import 'package:flutter/material.dart';

import '../constants.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  int minLines = 1;
  CustomTextField({this.controller, this.hintText, this.minLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TextField(
        controller: controller,
        minLines:minLines,
        maxLines: null,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12, color: kGreyColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10),
              borderSide: BorderSide(color: kGreyColor)),
        ),
      ),
    );
  }
}