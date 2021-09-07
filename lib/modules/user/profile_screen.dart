import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = "profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "الملف الشخصي"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration:
                    BoxDecoration(shape: BoxShape.circle, color: Colors.black),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
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
                  hintText: "حدد الدولة",
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
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
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: customButton(text: "حفظ", onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
