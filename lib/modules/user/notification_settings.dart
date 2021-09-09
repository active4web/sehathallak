import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class NotificationSettings extends StatelessWidget {
  static const String id = "NotificationSettings";

  List<Map<String, dynamic>> pushNotificationList = [
    {"title": "تمكين جميع الاشعارات", "subtitle": "", "active": false},
    {
      "title": "الحساب والطلبات",
      "subtitle": "تلقي اشعارات حول طلبك ومعلومات حسابك",
      "active": false
    },
    {
      "title": "العروض الترويجية",
      "subtitle": "تلقي اشعارات عن طرح عروض خاصة",
      "active": false
    },
    {"title": "مكافأتي", "subtitle": "", "active": false},
    {"title": "تقييمات المنتج", "subtitle": "", "active": false},
  ];
  List<Map<String, dynamic>> emailAddressNotification = [
    {"title": "تمكين جميع الاشعارات", "subtitle": "", "active": false},
    {"title": "عروض حصرية وتوصيات منتجات", "subtitle": "", "active": false},
    {"title": "مكافأتي", "subtitle": "", "active": false},
    {"title": "تقييمات المنتج", "subtitle": "", "active": false},
    {"title": "اسألة وأجوبة", "subtitle": "", "active": false},
  ];
  List<Map<String, dynamic>> phoneNumberNotification = [
    {"title": "تمكين جميع الاشعارات", "subtitle": "", "active": false},
    {"title": "الحساب والطلبات", "subtitle": "", "active": false},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "الاشعارات", context: context),
      body: Column(
        children: [
          buildExpansionTile(
              title: "دفع الاشعارات", model: pushNotificationList),
          buildExpansionTile(
              title: "البريد الالكتروني", model: emailAddressNotification),
          buildExpansionTile(
              title: "رسائل النصية", model: phoneNumberNotification),
        ],
      ),
    );
  }

  StatefulBuilder buildExpansionTile({
    String title,
    List<Map<String, dynamic>> model,
  }) {
    return StatefulBuilder(
      builder: (context, setState) => ExpansionTile(
        title: Text(title),
        children: List.generate(
            model.length,
            (index) => SwitchListTile(
                  title: Text(
                    model[index]["title"],
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    model[index]["subtitle"],
                    style: TextStyle(
                      fontSize: 11,
                    ),
                  ),
                  value: model[index]["active"],
                  onChanged: (value) {
                    setState(() {
                      model[index]["active"] = !model[index]["active"];
                    });
                  },
                )),
      ),
    );
  }
}
