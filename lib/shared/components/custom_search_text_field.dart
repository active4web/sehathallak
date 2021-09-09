import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          isDense: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(20)),
          hintText: "بحث عن خدمة او منتج"),
    );
  }
}
