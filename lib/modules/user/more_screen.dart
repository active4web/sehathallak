import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/forms/Book_a_vaccination_appointment_screen.dart';
import 'package:se7a_7alalk/modules/forms/book_appointment_screen.dart';
import 'package:se7a_7alalk/modules/forms/emergency_booking_screen.dart';
import 'package:se7a_7alalk/modules/forms/lab_analysis_appointment_screen.dart';
import 'package:se7a_7alalk/modules/screens/about_app.dart';
import 'package:se7a_7alalk/modules/screens/rewards_screen.dart';
import 'package:se7a_7alalk/modules/user/settings_screen.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

import 'change_password_screen.dart';

class MoreScreen extends StatelessWidget {
  static const String id = "MoreScreen";
  List<Map<String, String>> storeList = [
    {"title": "أدوية بيطرية", "page": ""},
    {"title": "التحصينات البيطرية", "page": ""},
    {"title": "الأدوات والمستلزمات البيطرية", "page": ""},
    {"title": "الاعلاف الحيوانية", "page": ""},
  ];
  List<Map<String, String>> veterinaryServicesList = [
    {"title": "خدمات الرش والتخلص من الحشرات الخارجية للحيوانات", "page": ""},
    {"title": "خدمات قص الشعر وجز الصوف وتقليم الحوافر للحيوانات", "page": ""},
    {"title": "خدمات التحصينات للحيوانات المختلفة", "page": ""},
    {"title": "خدمات العلاج للحيوانات المختلفة", "page": ""},
    {"title": "خدمات الزيارات المنزليه", "page": ""},
  ];
  List<Map<String, String>> veterinaryConsultationList = [
    {"title": "استشارة بيطرية( محادثة كتابية )", "page": ""},
    {"title": "استشارة بيطرية( فيديو )", "page": ""},
  ];
  List<Map<String, String>> appointmentsBookingList = [
    {
      "title": "حجز موعد زيارة ميدانية ( حالات عادية)",
      "page": AppointmentBooking.id
    },
    {"title": "حجز موعد ( حالات طارئة)", "page": EmergencyBooking.id},
    {"title": "حجز موعد تحصين", "page": VaccinationAppointmentBooking.id},
    {"title": "طلب تحليل مخبري", "page": LapAnalysisAppointment.id},
  ];
  List<Map<String, String>> myDataList = [
    {"title": "مكافئاتي", "page": RewardsScreen.id},
    {"title": "طلباتي", "page": ""},
    {"title": "تغيير كلمة المرور", "page": ChangePasswordScreen.id},
    {"title": "اعدادات التنبيهات", "page": ""},
  ];

  @override
  Widget build(BuildContext context) {
    bool isCollapsed = false;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 40,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Mohamed Ahmed",
                        style: TextStyle(fontSize: 22),
                      ),
                      Text(
                        "رقم العميل : 12333",
                        style: TextStyle(fontSize: 14),
                      ),
                      Text(
                        "الباقة السنوية",
                        style: TextStyle(
                            fontSize: 20,
                            color: kAppSecondColor,
                            fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "من : 1-7-2020",
                            style: TextStyle(
                                fontSize: 11,
                                color: Color(0xffED6B27),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "الى : 1-7-2021",
                            style: TextStyle(
                                fontSize: 11,
                                color: Color(0xffED6B27),
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
            Divider(
              thickness: 3,
            ),
            Expanded(
              child: ListView(
                padding: EdgeInsets.zero,
                children: [
                  buildExpansionTile(
                      isCollapsed: isCollapsed,
                      title: "المتجر",
                      icon: CupertinoIcons.shopping_cart,
                      model: storeList),
                  buildExpansionTile(
                      isCollapsed: isCollapsed,
                      title: "الخدمات البيطرية",
                      icon: CupertinoIcons.shopping_cart,
                      model: veterinaryServicesList),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "العيادات البيطرية التخصصية",
                      onPressed: () {}),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "العيادات البيطرية ( حسب المكان)",
                      onPressed: () {}),
                  buildExpansionTile(
                      isCollapsed: isCollapsed,
                      title: "الاستشارات البيطرية",
                      icon: CupertinoIcons.shopping_cart,
                      model: veterinaryConsultationList),
                  buildExpansionTile(
                      isCollapsed: isCollapsed,
                      title: "حجز مواعيد العلاج والتحصين والتحاليل المخبرية",
                      icon: CupertinoIcons.shopping_cart,
                      model: appointmentsBookingList),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title:
                          "الاشتراك في باقات المتابعة الشهرية للحيوانات بالمزارع والعزب "),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title:
                          "الاشتراك في باقات الاستشارات البيطرية الكتابية والفيديو"),
                  buildExpansionTile(
                      isCollapsed: isCollapsed,
                      title: "بياناتي",
                      icon: CupertinoIcons.shopping_cart,
                      model: myDataList),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "عروض خاصة",
                      onPressed: () {}),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "الاعدادات",
                      onPressed: () {
                        navigateTo(context: context, page: SettingsScreen.id);
                      }),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "الدعم الفني",
                      onPressed: () {}),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "عن التطبيق",
                      onPressed: () {
                        navigateTo(context: context, page: AboutAppScreen.id);
                      }),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "الأسئلة الشائعة",
                      onPressed: () {}),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "خروج",
                      onPressed: () {}),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  StatefulBuilder buildExpansionTile({
    bool isCollapsed,
    String title,
    IconData icon,
    List<Map<String, String>> model,
  }) {
    return StatefulBuilder(
      builder: (context, setState) => ExpansionTile(
        leading: !isCollapsed
            ? Container(
                padding: EdgeInsets.all(5),
                color: Color(0xff4FC6E9).withAlpha(50),
                child: Icon(icon),
              )
            : Icon(
                icon,
                color: Color(0xff4FC6E9),
              ),
        title: Text(title),
        // trailing: Icon(
        //   Icons.arrow_forward_ios_rounded,
        //   size: 16,
        // ),
        children: List.generate(
            model.length,
            (index) => ListTile(
                  leading: Container(
                      decoration: BoxDecoration(
                          border: Border.all(color: kGreyColor),
                          shape: BoxShape.circle),
                      child: Icon(
                        Icons.arrow_forward_ios_sharp,
                        size: 10,
                      )),
                  title: Text(
                    model[index]["title"],
                    style: TextStyle(
                        fontSize: 13,
                        color: kGreyColor,
                        fontWeight: FontWeight.bold),
                  ),
                  onTap: () {
                    navigateTo(
                      context: context,
                      page: model[index]["page"],
                    );
                  },
                )),
        backgroundColor: kGreyColor.withOpacity(0.1),
        onExpansionChanged: (value) {
          setState(() {
            isCollapsed = value;
          });
        },
      ),
    );
  }

  Widget buildListTile({IconData icon, String title, Function onPressed}) =>
      ListTile(
        leading: Container(
          padding: EdgeInsets.all(5),
          color: Color(0xff4FC6E9).withAlpha(50),
          child: Icon(icon),
        ),
        title: Text(title),
        trailing: Icon(
          Icons.arrow_forward_ios_rounded,
          size: 16,
        ),
        onTap: onPressed,
      );
}
