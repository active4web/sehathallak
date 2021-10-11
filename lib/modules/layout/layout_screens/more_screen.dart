import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/forms/Book_a_vaccination_appointment_screen.dart';
import 'package:se7a_7alalk/modules/forms/book_appointment_screen.dart';
import 'package:se7a_7alalk/modules/forms/emergency_booking_screen.dart';
import 'package:se7a_7alalk/modules/forms/lab_analysis_appointment_screen.dart';
import 'package:se7a_7alalk/modules/screens/clinics.dart';
import 'package:se7a_7alalk/modules/screens/reservation_of_specialty_clinics.dart';
import 'package:se7a_7alalk/modules/user/about_app.dart';
import 'package:se7a_7alalk/modules/user/customer_support.dart';
import 'package:se7a_7alalk/modules/user/my_orders_screen.dart';
import 'package:se7a_7alalk/modules/user/notification_settings.dart';
import 'package:se7a_7alalk/modules/user/questions_and_answers.dart';
import 'package:se7a_7alalk/modules/user/rewards_screen.dart';
import 'package:se7a_7alalk/modules/store/selling_animal_feed.dart';
import 'package:se7a_7alalk/modules/store/veterinary_fortifications.dart';
import 'package:se7a_7alalk/modules/store/veterinary_medicine_screen.dart';
import 'package:se7a_7alalk/modules/store/veterinary_supplies.dart';
import 'package:se7a_7alalk/modules/user/settings_screen.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';
import '../../user/change_password_screen.dart';
import '../../user/my_offers_screen.dart';

class MoreScreen extends StatelessWidget {
  static const String id = "MoreScreen";
  List<Map<String, String>> storeList = [
    {"title": "أدوية بيطرية", "page": VeterinaryMedicine.id},
    {"title": "التحصينات البيطرية", "page": VeterinaryFortifications.id},
    {"title": "الأدوات والمستلزمات البيطرية", "page": VeterinarySupplies.id},
    {"title": "الاعلاف الحيوانية", "page": SellingAnimalFeed.id},
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
    {"title": "طلباتي", "page": MyOrdersScreen.id},
    {"title": "تغيير كلمة المرور", "page": ChangePasswordScreen.id},
    {"title": "اعدادات التنبيهات", "page": NotificationSettings.id},
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
                        "${"clientNumber".tr()} : 12333",
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
                            "${"from".tr()} : 1-7-2020",
                            style: TextStyle(
                                fontSize: 11,
                                color: Color(0xffED6B27),
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            "${"to".tr()} : 1-7-2021",
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
                      title: "store".tr(),
                      icon: CupertinoIcons.shopping_cart,
                      model: storeList),
                  buildExpansionTile(
                      isCollapsed: isCollapsed,
                      title: "veterinaryServices".tr(),
                      icon: CupertinoIcons.shopping_cart,
                      model: veterinaryServicesList),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "specializedVeterinaryClinics".tr(),
                      onPressed: () {
                        navigateTo(
                            context: context,
                            page: ReservationOfSpecialtyClinics.id);
                      }),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "VeterinaryClinics(accordingToLocation)".tr(),
                      onPressed: () {
                        navigateTo(context: context, page: Clinics.id);
                      }),
                  buildExpansionTile(
                      isCollapsed: isCollapsed,
                      title: "VeterinaryConsultation".tr(),
                      icon: CupertinoIcons.shopping_cart,
                      model: veterinaryConsultationList),
                  buildExpansionTile(
                      isCollapsed: isCollapsed,
                      title:
                          "BookAppointmentsForTreatment,ImmunizationAndLaboratoryTests"
                              .tr(),
                      icon: CupertinoIcons.shopping_cart,
                      model: appointmentsBookingList),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title:
                          "SubscriptionToTheMonthlyFollow-upPackagesForAnimalsInFarmsAndRanches"
                              .tr()),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title:
                          "SubscribeToWrittenAndVideoVeterinaryConsultationPackages"
                              .tr()),
                  buildExpansionTile(
                      isCollapsed: isCollapsed,
                      title: "myData".tr(),
                      icon: CupertinoIcons.shopping_cart,
                      model: myDataList),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "specialOffers".tr(),
                      onPressed: () {
                        navigateTo(context: context, page: MyOffersScreen.id);
                      }),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "settings".tr(),
                      onPressed: () {
                        navigateTo(context: context, page: SettingsScreen.id);
                      }),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "technicalSupport".tr(),
                      onPressed: () {
                        navigateTo(context: context, page: CustomerSupport.id);
                      }),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "aboutApp".tr(),
                      onPressed: () {
                        navigateTo(context: context, page: AboutAppScreen.id);
                      }),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "commonQuestions".tr(),
                      onPressed: () {
                        navigateTo(
                            context: context, page: QuestionsAndAnswers.id);
                      }),
                  buildListTile(
                      icon: CupertinoIcons.shopping_cart,
                      title: "Exit".tr(),
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
