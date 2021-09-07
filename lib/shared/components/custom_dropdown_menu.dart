import 'package:flutter/material.dart';

import '../constants.dart';

class CustomDropDownMenu extends StatelessWidget {
  final dynamic value;
  final String hintText;
  final Function onChange;
  final List<DropdownMenuItem> items;
  const CustomDropDownMenu(
      {this.value, this.hintText, this.onChange, this.items});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: DropdownButtonHideUnderline(
        child: Container(
          height: 50,
          child: DropdownButton(
              itemHeight: 50,
              value: value,
              isDense: true,
              hint: Text(
                hintText,
                style: TextStyle(fontSize: 12, color: kGreyColor),
              ),
              onChanged: onChange,
              items: items),
        ),
      ),
    );
  }
}
