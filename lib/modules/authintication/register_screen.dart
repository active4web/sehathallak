import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = "registerScreen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              height: size.height * 0.9,
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      bottomRight: Radius.circular(20))),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 220,
                  ),
                  Text(
                    "تسجيل حساب",
                    style: TextStyle(
                        fontSize: 22,
                        color: kAppSecondColor,
                        fontWeight: FontWeight.bold),
                  ),
                  customTextField(
                      labelText: "اسم المستخدم",
                      hintText: "Moha123456",
                      prefixIcon: CupertinoIcons.person),
                  customTextField(
                      labelText: "كلمة المرور",
                      hintText: "***************",
                      prefixIcon: CupertinoIcons.lock),
                  Align(
                      alignment: Alignment.centerLeft,
                      child: TextButton(
                          onPressed: () {},
                          child: Text(
                            "نسيت كلمة المرور ؟",
                            style: TextStyle(color: kAppSecondColor),
                          ))),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: customButton(text: "دخول"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Text(
                      "او يمكنك الدخول",
                      style: TextStyle(color: kScaffoldColor, fontSize: 16),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset(
                        "assets/images/twitter.png",
                      ),
                      Image.asset(
                        "assets/images/google.png",
                      ),
                      Image.asset(
                        "assets/images/facebook.png",
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text.rich(TextSpan(
                text: "ليس لديك حساب ؟ ",
                style: TextStyle(color: Colors.white),
                children: [
                  TextSpan(
                      text: "سجل الان",
                      style: TextStyle(color: kAppSecondColor))
                ]))
          ],
        ),
      ),
    );
  }
}
