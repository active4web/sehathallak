import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String id = "onBoarding";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    PageController controller = PageController();
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: size.height * 0.75,
            child: PageView.builder(
              itemBuilder: (context, index) {
                return buildItem();
              },
              itemCount: 4,
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customButton(onPressed: () {}, text: "ابدأ", width: 150),
                SmoothPageIndicator(
                  controller: controller,
                  count: 4,
                  effect: WormEffect(
                    dotHeight: 6,
                    activeDotColor: kAppSecondColor,
                    dotWidth: 16,
                    type: WormType.normal,
                    // strokeWidth: 5,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildItem() => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 420,
              decoration: BoxDecoration(
                  color: Colors.white, borderRadius: BorderRadius.circular(15)),
            ),
            Text(
              "صحة حلالك",
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              "نحن نهتم بحلالك ونقدم لك الخدمات البيطرية المختلفة والأدوية والعقاقير البيطرية",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: kScaffoldColor,
              ),
            ),
          ],
        ),
      );
}
