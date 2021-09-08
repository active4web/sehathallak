import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/custom_arrow_back.dart';

import '../constants.dart';

class GradientAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final bool actions;
  final bool haveNotification;
  final bool haveCart;
  GradientAppBar(
      {this.title,
      this.actions = false,
      this.haveNotification = false,
      this.haveCart = false});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: CustomArrowBack(),
        actions: actions
            ? [
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Icon(
                          Icons.notifications_none_sharp,
                          color: Colors.black87,
                        ),
                        if (haveNotification)
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.amber),
                          )
                      ],
                    ),
                  ),
                ),
                Container(
                  width: 30,
                  height: 30,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white),
                  child: Center(
                    child: Stack(
                      alignment: Alignment.topRight,
                      children: [
                        Icon(
                          Icons.shopping_cart_outlined,
                          color: Colors.black87,
                        ),
                        if (haveCart)
                          Container(
                            height: 10,
                            width: 10,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle, color: Colors.amber),
                          )
                      ],
                    ),
                  ),
                )
              ]
            : [],
        title: Text(title),
        centerTitle: true,
        flexibleSpace: Container(
          height: 140,
          decoration: BoxDecoration(
            gradient: kAppGradient,
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(12)),
          ),
        ),
      ),
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(80);
}
