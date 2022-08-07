import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';

class HomeVisitServices extends StatelessWidget {
  static const String id = "/HomeVisitServices";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "categories".tr(),
        canNavigate: false,
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("dependingOnThePurposeOfUse".tr()),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 2.5,
              mainAxisSpacing: 10,
              children: List.generate(
                6,
                (index) => Container(
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
                      Expanded(
                        child: Text(
                          "تحصين الحيوانات الاليفة",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("services".tr()),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 2.5,
              mainAxisSpacing: 10,
              children: List.generate(
                4,
                (index) => Container(
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
                      Expanded(
                        child: Text(
                          "تحصين الحيوانات الاليفة",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text("clinics".tr()),
          ),
          Expanded(
            child: GridView.count(
              crossAxisCount: 2,
              crossAxisSpacing: 10,
              childAspectRatio: 2.5,
              mainAxisSpacing: 10,
              children: List.generate(
                6,
                (index) => Container(
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
                      Expanded(
                        child: Text(
                          "تحصين الحيوانات الاليفة",
                          textAlign: TextAlign.center,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
