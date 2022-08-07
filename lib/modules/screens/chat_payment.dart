import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/screens/package_subscription_screen.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

import 'completed_order.dart';

class ChatPayment extends StatelessWidget {
  static const String id = "/ChatPayment";
  var cardNumberController = TextEditingController();
  var cardNameController = TextEditingController();
  var cvcController = TextEditingController();
  var expiryDateController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: "pay".tr(),
        ),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: ListView(
            children: [
              Text(
                "عزيزي محمد أحمد",
                style: TextStyle(
                    color: kAppColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 15),
              ),
              Text(
                "${"theValueOfObtainingAVeterinaryConsultation".tr()} 500 ريال ${"BecauseYouAreNotSubscribedToOurPackage".tr()}",
                style: TextStyle(color: kAppColor, fontSize: 15),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "youCanSubscribeToOneOfOurPackagesToGetAFreeConsultationService"
                          .tr(),
                      style: TextStyle(color: kAppColor, fontSize: 15),
                    ),
                  ),
                  TextButton(
                      onPressed: () {
                        navigateTo(
                            context: context, page: PackageSubscription());
                      },
                      child: Text(
                        "subscribeToPackages".tr(),
                        style: TextStyle(color: Color(0xffFA6400)),
                      ))
                ],
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kAppSecondColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "orderPrice".tr(),
                      style: TextStyle(color: kAppColor),
                    ),
                    Text(
                      "5000 ريال",
                      style: TextStyle(color: kAppColor),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kGreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    visaAndCreditField("cardNumber".tr(), cardNumberController,
                        "11 22 33 44 55 ",
                        showPrefix: true),
                    visaAndCreditField(
                        "nameOnCard".tr(), cardNumberController, "Mohamd Ahed",
                        showPrefix: false),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: visaAndCreditField("CVC", cvcController, "123",
                              isPassword: true,
                              showSuffix: true,
                              icon: Icon(Icons.lock)),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: visaAndCreditField("expirationDate".tr(),
                              expiryDateController, "20/03/2022",
                              showSuffix: true,
                              icon: Icon(Icons.calendar_today)),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              customButton(
                  text: "completePayment".tr(),
                  onPressed: () {
                    buildSuccessDialog(context: context);
                    // buildPayServiceDialog(context);
                  })
            ],
          ),
        ));
  }

  Widget visaAndCreditField(String label, controller, String hintText,
          {bool showPrefix = false,
          showSuffix = false,
          Widget icon,
          bool isPassword = false}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextField(
                obscureText: isPassword,
                controller: controller,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: hintText,
                    prefixIcon: showPrefix
                        ? Image.asset("assets/images/card icon.png")
                        : null,
                    suffixIcon: showSuffix ? icon : null),
              )),
        ],
      );
}
