import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

import 'clinic_details.dart';

class Clinics extends StatelessWidget {
  static const String id = "Clinics";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "حجز عيادات حسب المكان",
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Container(
              height: 100,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      // Container(
                      //   decoration: BoxDecoration(
                      //       color: Colors.white,
                      //       borderRadius: BorderRadius.circular(10)),
                      // ),
                      Text(
                        "العين",
                        style: TextStyle(color: kAppColor),
                      ),
                  separatorBuilder: (context, index) => SizedBox(
                        width: 15,
                      ),
                  itemCount: 5),
            ),
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
                            navigateTo(
                                context: context, page: ClinicDetails.id);
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
      ),
    );
  }
}
