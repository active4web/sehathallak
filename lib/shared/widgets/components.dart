import 'package:flutter/material.dart';
import '../constants.dart';

Widget customTextField(
        {String labelText,
        String hintText,
        IconData prefixIcon,
        Widget suffixIcon,
        TextInputType keyboardType,
        bool isPassword = false}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: kGreyColor,
            fontSize: 13,
          ),
        ),
        TextField(
          obscureText: isPassword,
          keyboardType:
              isPassword ? TextInputType.visiblePassword : keyboardType,
          decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(fontSize: 14),
              prefixIcon: Icon(prefixIcon),
              suffixIcon: suffixIcon),
        ),
      ],
    );

Widget customButton(
        {String text, double width = double.infinity, Function onPressed}) =>
    Container(
      decoration: BoxDecoration(gradient: kAppGradient),
      child: MaterialButton(
        onPressed: onPressed,
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

Widget customAppBar({String title}) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      actions: [
        IconButton(
            onPressed: () {},
            color: Colors.white,
            icon: Icon(Icons.arrow_forward, color: Colors.black)),
        SizedBox(
          width: 10,
        ),
      ],
      title: Text(
        title,
        style: TextStyle(color: Colors.black, fontSize: 18),
      ),
      centerTitle: true,
    );

Widget customDropDownMenu(
        {String labelText, dynamic value, List items, Function onChanged}) =>
    Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: TextStyle(
            color: kGreyColor,
            fontSize: 13,
          ),
        ),
        DropdownButtonHideUnderline(
            child: DropdownButton(
          items: items,
          value: value,
          isExpanded: true,
          onChanged: onChanged,
        ))
      ],
    );
