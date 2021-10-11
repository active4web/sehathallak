import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/constants.dart';

class OrderDetails extends StatelessWidget {
  static const String id = "OrderDetails";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Directionality(
            textDirection: TextDirection.ltr,
            child: AppBar(
              centerTitle: true,
              backgroundColor: Colors.transparent,
              elevation: 0,
              title: Text(
                "orderDetails".tr(),
                style: TextStyle(color: Colors.black),
              ),
              leading: IconButton(
                icon: Icon(Icons.close, color: Colors.black),
                onPressed: () {
                  Navigator.pop(context);
                },
              ),
            ),
          ),
          Divider(),
          Card(
            color: kGreyColor.withOpacity(0.7),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(20),
                  color: kAppSecondColor,
                  child: Row(
                    children: [
                      Image.asset(
                        "assets/images/logo.png",
                        width: 100,
                      ),
                      SizedBox(
                        width: 30,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "order".tr(),
                            style: TextStyle(color: Colors.white, fontSize: 17),
                          ),
                          Text(
                            "No.#1893",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                            ),
                          ),
                          Text(
                            "Apr 11, 2021 2:00PM",
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
                ListView.separated(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) => cartProductItem(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 2),
                Divider(),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "orderDetails".tr(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "price".tr(),
                          ),
                          Text("240 ريال",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kAppSecondColor)),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "discount".tr(),
                          ),
                          Text("240 ريال",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: kAppSecondColor)),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(20),
                  color: kGreyColor,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("paymentMethod".tr()),
                      Row(
                        children: [
                          Image.asset("assets/images/card icon.png"),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "1234 ************",
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "address".tr(),
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      Text(
                        "زاوية الدهماني - شارع القبطان بعد عيادة وصيدلية القبطان على اليمين ., شارع فشلوم -الشارع المقابل لجامع فشلوم , طرابلس, ليبيا",
                        style: TextStyle(
                            fontSize: 15, color: Colors.grey.shade500),
                      ),
                    ],
                  ),
                ),
                Divider(),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "total".tr(),
                    style: TextStyle(fontSize: 14),
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    "240 ريال",
                    style: TextStyle(
                        fontSize: 24,
                        color: kAppSecondColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget cartProductItem() => Row(
        children: [
          Image.asset(
            "assets/images/medecine.png",
            width: 100,
          ),
          Text("Diurizone"),
          Spacer(),
          Text(
            "120.00 ريال",
            style: TextStyle(color: kAppSecondColor),
          ),
        ],
      );
}
