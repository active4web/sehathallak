import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';

class CustomSearchTextField extends StatelessWidget {
  final TextEditingController controller;
  const CustomSearchTextField({Key key, this.controller}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(
          filled: true,
          contentPadding: EdgeInsets.symmetric(horizontal: 10, vertical: 5),
          fillColor: Colors.white,
          isDense: true,
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              gapPadding: 0,
              borderRadius: BorderRadius.circular(20)),
          hintText: "searchForAProductOrService".tr()),
    );
  }
}
