import 'package:flutter/material.dart';

import '../constants.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget{
  const GradientAppBar({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: Size.fromHeight(80),
      child: Directionality(
        textDirection: TextDirection.ltr,
        child: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: Container(
            width: 30,
            height: 30,
            margin: EdgeInsets.all(10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: Colors.white
            ),
            child: Icon(
              Icons.arrow_back,
              color: Colors.black87,
            ),
          ),
          title: Text('مكافئات'),
          centerTitle: true,
          flexibleSpace: Container(
            height: 140,
            decoration: BoxDecoration(
              gradient: kAppGradient,
              borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
            ),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}