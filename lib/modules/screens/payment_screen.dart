import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

import 'completed_order.dart';

class PaymentScreen extends StatelessWidget {
  static const String id = "PaymentScreen";
  var paymentRadioValue = "cash";
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
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: kGreyColor,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Image.asset("assets/images/purse.png"),
                    SizedBox(
                      width: 5,
                    ),
                    Container(
                      color: Colors.black,
                      height: 20,
                    ),
                    Text("payCash".tr()),
                    Spacer(),
                    Radio(
                      value: "cash",
                      groupValue: paymentRadioValue,
                      onChanged: (value) {
                        paymentRadioValue = value;
                      },
                    )
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
                    Row(
                      children: [
                        Image.asset("assets/images/card icon.png"),
                        SizedBox(
                          width: 5,
                        ),
                        VerticalDivider(
                          thickness: 10,
                          color: Colors.red,
                        ),
                        Text("Visa/CreditCard".tr()),
                        Spacer(),
                        Radio(
                          value: "visa",
                          groupValue: paymentRadioValue,
                          onChanged: (value) {
                            paymentRadioValue = value;
                          },
                        )
                      ],
                    ),
                    Divider(),
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
                    navigateTo(context: context, page: CompletedOrder.id);
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
