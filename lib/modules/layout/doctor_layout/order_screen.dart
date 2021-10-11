import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/screens/doctor_notes_screen.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

import 'doctor_notes.dart';

class DoctorOrdersScreen extends StatelessWidget {
  static const String id = "DoctorOrdersScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "order".tr(),
        canNavigate: false,
      ),
      body: ListView.separated(
          itemBuilder: (context, index) => buildOrderItem(context),
          separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
          itemCount: 3),
    );
  }

  Widget buildOrderItem(BuildContext context) => Card(
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Text("orderType".tr()),
                      Text("orderDate".tr()),
                      Text("orderNumber".tr()),
                      Text("orderPrice".tr()),
                      Text("receiptDate".tr()),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text("تحصين حيوانات"),
                      Text("30-1-2020"),
                      Text("#1893"),
                      Text("270.00"),
                      Text("1-2-2021"),
                    ],
                  ),
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.topLeft,
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          color: Colors.green,
                          child: Text(
                            "تم الاستلام",
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Text(
                          "(showDetails)".tr(),
                          style: TextStyle(color: Colors.red, fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            TextButton.icon(
                onPressed: () {
                  navigateTo(page: DoctorsNotesScreen.id, context: context);
                },
                icon: Image.asset("assets/images/doctor.png"),
                label: Text(
                  "doctorNotes".tr(),
                  style: TextStyle(color: Colors.green),
                ))
          ],
        ),
      );
}
