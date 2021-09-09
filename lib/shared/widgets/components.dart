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
        {String text,
        double width = double.infinity,
        double height = 50,
        Function onPressed}) =>
    Container(
      decoration: BoxDecoration(gradient: kAppGradient),
      child: MaterialButton(
        onPressed: onPressed,
        minWidth: width,
        height: height,
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

Widget customAppBar({String title, BuildContext context}) => AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      automaticallyImplyLeading: false,
      actions: [
        IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.white,
            icon: Icon(Icons.arrow_forward, color: Colors.black)),
        SizedBox(
          width: 10,
        ),
      ],
      title: Text(
        title,
        textAlign: TextAlign.center,
        style: TextStyle(color: Colors.black, fontSize: 15),
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

Widget buildImageContainer({String title, IconData icon, Function onPressed}) =>
    InkWell(
      onTap: () {},
      child: Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
            ),
            borderRadius: BorderRadius.circular(15)),
        child: TextButton.icon(
            onPressed: onPressed,
            icon: Icon(icon, color: Colors.grey),
            label: Text(
              title,
              style: TextStyle(color: Colors.grey),
            )),
      ),
    );
