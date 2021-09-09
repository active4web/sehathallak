import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

import 'clinic_details.dart';

class ReservationOfSpecialtyClinics extends StatelessWidget {
  static const String id = "ReservationOfSpecialtyClinics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "حجز عيادات بالتخصص",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("حجز عيادات بالتخصص"),
          ),
          buildCategorySlider(),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
              padding: EdgeInsets.all(16),
              children: List.generate(
                  4,
                  (index) => InkWell(
                        onTap: () {
                          navigateTo(context: context, page: ClinicDetails.id);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: Colors.white,
                              border: Border.all(color: kGreyColor),
                              borderRadius: BorderRadius.circular(10)),
                          child: Column(
                            children: [
                              Image.asset("assets/images/test.png"),
                              Text(
                                "عيادة 5",
                                style: TextStyle(
                                    color: kAppColor,
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      )),
            ),
          )
        ],
      ),
    );
  }

  Widget buildCategorySlider() => Container(
        height: 100,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => Container(
                  padding: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      Image.asset("assets/images/test.png"),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        "تحصين الحيوانات الاليفة",
                        maxLines: 1,
                      )
                    ],
                  ),
                ),
            separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
            itemCount: 3),
      );
}
