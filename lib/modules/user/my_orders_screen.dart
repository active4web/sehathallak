import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/screens/doctor_notes_screen.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class MyOrdersScreen extends StatelessWidget {
  static const String id = "MyOrdersScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "طلباتي",
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
                      Text("نوع الطلب"),
                      Text("تاريخ الطلب"),
                      Text("رقم الطلب"),
                      Text("قيمه الطلب"),
                      Text("تاريخ الاستلام"),
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
                          "(مشاهدة التفاصيل)",
                          style: TextStyle(color: Colors.red, fontSize: 11),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {
                      navigateTo(page: DoctorNotesScreen.id, context: context);
                    },
                    icon: Icon(
                      Icons.replay,
                      color: Colors.green,
                    ),
                    label: Text(
                      "إعادة الطلب",
                      style: TextStyle(color: Colors.green),
                    )),
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    label: Text(
                      "تقييم الطلب",
                      style: TextStyle(color: Colors.amber),
                    )),
              ],
            )
          ],
        ),
      );
}
