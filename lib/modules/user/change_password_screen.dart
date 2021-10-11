import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String id = "changePassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "profile".tr(), context: context),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            customTextField(
                labelText: "currentPassword".tr(),
                isPassword: true,
                hintText: "***************",
                suffixIcon: Icon(Icons.visibility_off_outlined),
                prefixIcon: CupertinoIcons.lock),
            customTextField(
                labelText: "newPassword".tr(),
                isPassword: true,
                hintText: "***************",
                suffixIcon: Icon(Icons.visibility_off_outlined),
                prefixIcon: CupertinoIcons.lock),
            customTextField(
                labelText: "confirmPassword".tr(),
                isPassword: true,
                hintText: "***************",
                suffixIcon: Icon(Icons.visibility_off_outlined),
                prefixIcon: CupertinoIcons.lock),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: customButton(text: "save".tr(), onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
