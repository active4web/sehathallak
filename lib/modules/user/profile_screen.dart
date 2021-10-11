import 'package:country_code_picker/country_code_picker.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class ProfileScreen extends StatelessWidget {
  static const String id = "profile";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "Profile".tr(),
        canNavigate: false,
      ),
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
                  labelText: "userName".tr(),
                  hintText: "Moha123456",
                  keyboardType: TextInputType.name,
                  prefixIcon: CupertinoIcons.person),
              customTextField(
                  labelText: "emailAddress".tr(),
                  hintText: "Moha@testmail.com",
                  keyboardType: TextInputType.emailAddress,
                  prefixIcon: CupertinoIcons.mail),
              customTextField(
                  labelText: "country".tr(),
                  keyboardType: TextInputType.name,
                  hintText: "chooseCountry".tr(),
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                  prefixIcon: CupertinoIcons.location),
              customTextField(
                  labelText: "city".tr(),
                  hintText: "chooseCity".tr(),
                  keyboardType: TextInputType.name,
                  suffixIcon: Icon(Icons.keyboard_arrow_down),
                  prefixIcon: CupertinoIcons.location),
              customTextField(
                  labelText: "phoneNumber".tr(),
                  keyboardType: TextInputType.phone,
                  suffixIcon: CountryCodePicker(
                    favorite: ['+971', 'FR'],
                  ),
                  hintText: "1234567889",
                  prefixIcon: CupertinoIcons.phone),
              customTextField(
                  labelText: "password".tr(),
                  isPassword: true,
                  hintText: "***************",
                  prefixIcon: CupertinoIcons.lock),
              customTextField(
                  labelText: "confirmPassword".tr(),
                  isPassword: true,
                  hintText: "***************",
                  prefixIcon: CupertinoIcons.lock),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                child: customButton(text: "save".tr(), onPressed: () {}),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
