import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class SettingsScreen extends StatelessWidget {
  static const String id = "settingsScreen";

  @override
  Widget build(BuildContext context) {
    String language = "english";
    String country = "السعويه";
    String currency = "ريال";
    return Scaffold(
      appBar: customAppBar(title: "الاعدادات", context: context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            customDropDownMenu(
              labelText: "حدد اللغة",
              value: language,
            ),
            customDropDownMenu(labelText: "الدولة", value: country),
            customDropDownMenu(labelText: "العمله", value: currency),
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
