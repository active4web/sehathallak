import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class ChangePasswordScreen extends StatelessWidget {
  static const String id = "changePassword";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "الملف الشخصي"),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            customTextField(
                labelText: "كلمة المرور الحالية",
                isPassword: true,
                hintText: "***************",
                suffixIcon: Icon(Icons.visibility_off_outlined),
                prefixIcon: CupertinoIcons.lock),
            customTextField(
                labelText: "كلمة المرور الجديدة",
                isPassword: true,
                hintText: "***************",
                suffixIcon: Icon(Icons.visibility_off_outlined),
                prefixIcon: CupertinoIcons.lock),
            customTextField(
                labelText: "تأكيد كلمة المرور",
                isPassword: true,
                hintText: "***************",
                suffixIcon: Icon(Icons.visibility_off_outlined),
                prefixIcon: CupertinoIcons.lock),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: customButton(text: "حفظ", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }
}
