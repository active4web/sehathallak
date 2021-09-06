import 'package:flutter/material.dart';
import '../constants.dart';

Widget customTextField(
        {String labelText, String hintText, IconData prefixIcon}) =>
    TextField(
      cursorColor: kScaffoldColor,
      decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 20),
          labelText: labelText,
          labelStyle: TextStyle(
            color: kScaffoldColor,
            fontSize: 13,
          ),
          hintText: hintText,
          prefixIcon: Icon(prefixIcon),
          prefixIconConstraints: BoxConstraints(maxHeight: 0, maxWidth: 20)),
    );

Widget customButton({
  String text,
  double width = double.infinity,
}) =>
    Container(
      decoration: BoxDecoration(gradient: kAppGradient),
      child: MaterialButton(
        onPressed: () {},
        minWidth: width,
        height: 50,
        child: Text(
          text,
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Future navigateTo({BuildContext context, String page}) =>
    Navigator.pushNamed(context, page);

Future navigateToAndStop({BuildContext context, String page}) =>
    Navigator.pushNamedAndRemoveUntil(context, page, (route) => false);
