import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/authintication/register_screen.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class LoginScreen extends StatelessWidget {
  static const String id = "loginScreen";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: kAppColor,
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
                    "تسجيل دخول",
                    style: TextStyle(
                        fontSize: 22,
                        color: kAppSecondColor,
                        fontWeight: FontWeight.bold),
                  ),
                  customTextField(
                      labelText: "البريد الالكتروني / رقم الجوال",
                      hintText: "Moha123456@gmail.com",
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
            InkWell(
              onTap: () {
                navigateTo(context: context, page: RegisterScreen.id);
              },
              child: Text.rich(TextSpan(
                  text: "ليس لديك حساب ؟ ",
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                        text: "سجل الان",
                        style: TextStyle(color: kAppSecondColor))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
