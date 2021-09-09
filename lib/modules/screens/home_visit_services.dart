import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';

class HomeVisitServices extends StatelessWidget {
  static const String id = "HomeVisitServices";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "حجز عيادات حسب المكان",
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Text(" حسب الغرض من الاستخدام"),
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
