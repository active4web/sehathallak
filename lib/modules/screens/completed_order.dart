import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

import 'order_details.dart';

class CompletedOrder extends StatelessWidget {
  static const String id = "CompletedOrder";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset("assets/images/Check mark.png"),
            SizedBox(
              height: 30,
            ),
            Text(
              "orderCompletedSuccessfully".tr(),
              style: TextStyle(fontSize: 22),
            ),
            Text(
              "${"order".tr()}1893# ",
              style: TextStyle(fontSize: 22),
            ),
            SizedBox(
              height: 30,
            ),
            customButton(
                text: "orderDetails".tr(),
                onPressed: () {
                  navigateTo(context: context, page: OrderDetails.id);
                }),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text(
                  "backToHome".tr(),
                  style: TextStyle(fontSize: 22, color: Colors.black),
                ))
          ],
        ),
      ),
    );
  }
}
