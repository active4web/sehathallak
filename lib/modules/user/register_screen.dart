import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/layout/home_layout.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class RegisterScreen extends StatelessWidget {
  static const String id = "registerScreen";

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
              child: SingleChildScrollView(
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
                        keyboardType: TextInputType.name,
                        prefixIcon: CupertinoIcons.person),
                    customTextField(
                        labelText: "البريد الالكتروني",
                        hintText: "Moha@testmail.com",
                        keyboardType: TextInputType.emailAddress,
                        prefixIcon: CupertinoIcons.mail),
                    customTextField(
                        labelText: "الدولة",
                        keyboardType: TextInputType.name,
                        hintText: "حدد المدينه",
                        prefixIcon: CupertinoIcons.location),
                    customTextField(
                        labelText: "المدينة",
                        hintText: "حدد المدينه",
                        keyboardType: TextInputType.name,
                        suffixIcon: Icon(Icons.keyboard_arrow_down),
                        prefixIcon: CupertinoIcons.location),
                    customTextField(
                        labelText: "رقم الجوال",
                        keyboardType: TextInputType.phone,
                        suffixIcon: CountryCodePicker(
                          favorite: ['+971', 'FR'],
                        ),
                        hintText: "1234567889",
                        prefixIcon: CupertinoIcons.phone),
                    customTextField(
                        labelText: "كلمة المرور",
                        isPassword: true,
                        hintText: "***************",
                        prefixIcon: CupertinoIcons.lock),
                    customTextField(
                        labelText: "تأكيد كلمة المرور",
                        isPassword: true,
                        hintText: "***************",
                        prefixIcon: CupertinoIcons.lock),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 30),
                      child: customButton(
                          text: "تسجيل حساب",
                          onPressed: () {
                            navigateTo(context: context, page: HomeLayout.id);
                          }),
                    ),
                  ],
                ),
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
                  text: "لديك حساب بالفعل ؟",
                  style: TextStyle(color: Colors.white),
                  children: [
                    TextSpan(
                        text: " سجل دخول",
                        style: TextStyle(color: kAppSecondColor))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}
