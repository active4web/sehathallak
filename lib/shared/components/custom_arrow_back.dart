import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class CustomArrowBack extends StatelessWidget {
  const CustomArrowBack({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        width: 30,
        height: 30,
        margin: EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10), color: Colors.white),
        child: Icon(
          Icons.arrow_back,
          color: Colors.black87,
        ),
      ),
    );
  }
}
