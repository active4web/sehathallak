import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/auth_screens/auth_screen.dart';
import 'package:se7a_7alalk/modules/auth_screens/email_login_screen.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnBoardingScreen extends StatelessWidget {
  static const String id = "/onBoarding";
  List<Map<String, String>> onBoardingList = [
    {
      "title": "صحة حلالك",
      "image": "assets/images/onBoard1.png",
      "description":
          "نحن نهتم بحلالك ونقدم لك الخدمات البيطرية المختلفة والأدوية والعقاقير البيطرية"
    },
    {
      "title": "صحة  حلالك ",
      "image": "assets/images/onBoard2.png",
      "description":
          "لو كنت من هواه تربيه الصقور او صاحب تجارة تطبيق صحة حلالك يوفر لك جميع الخدمات البيطريه والادويه"
    },
    {
      "title": "لا تخاف على حلالك",
      "image": "assets/images/onBoard3.png",
      "description":
          "فنحن في تطبيق صحة  حلالك سهلنا عليك طلب الخدمات البيطريه والادويه"
    },
  ];
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
                return buildItem(onBoardingList[index]);
              },
              itemCount: onBoardingList.length,
              controller: controller,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                customButton(
                    onPressed: () {
                      CacheHelper.setData(key: "onBoard", value: true)
                          .then((value) {
                        navigateTo(context: context, page: AuthScreen());
                      });
                    },
                    text: "ابدأ",
                    width: 150),
                SmoothPageIndicator(
                  controller: controller,
                  count: onBoardingList.length,
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

  Widget buildItem(model) => Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 420,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(model["image"]), fit: BoxFit.cover),
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15)),
            ),
            Text(
              model["title"],
              style: TextStyle(
                  fontSize: 24,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
            Text(
              model["description"],
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 14,
                color: kGreyColor,
              ),
            ),
          ],
        ),
      );
}
