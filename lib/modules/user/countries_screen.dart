import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class CountriesScreen extends StatelessWidget {
  static const String id = "countriesScreen";
  @override
  Widget build(BuildContext context) {
    String nationality;
    String language;
    String country = "السعويه";
    return Scaffold(
      appBar: customAppBar(title: ""),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "chooseCountry".tr(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kAppColor),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      value: index,
                      title: Text("الامارات"),
                      controlAffinity: ListTileControlAffinity.trailing,
                      activeColor: kAppSecondColor,
                      secondary: Image.asset("assets/images/emirates.png"),
                      groupValue: nationality,
                      onChanged: (value) {},
                    );
                  },
                  itemCount: 8),
              SizedBox(
                height: 10,
              ),
              customDropDownMenu(labelText: "country".tr(), value: country),
              Text(
                "language".tr(),
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: kAppColor),
              ),
              ListView.builder(
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return RadioListTile(
                      value: index,
                      title: Text("عربي"),
                      controlAffinity: ListTileControlAffinity.trailing,
                      secondary: Image.asset("assets/images/emirates.png"),
                      groupValue: language,
                      onChanged: (value) {},
                    );
                  },
                  itemCount: 2),
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
