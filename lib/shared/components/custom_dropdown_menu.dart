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
        contentPadding: EdgeInsets.symmetric(horizontal: 10),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: DropdownButtonHideUnderline(
        child: DropdownButton(
            value: value,
            hint: Text(
              hintText,
              style: TextStyle(fontSize: 12, color: kGreyColor),
            ),
            onChanged: onChange,
            items: items),
      ),
    );
  }
}
