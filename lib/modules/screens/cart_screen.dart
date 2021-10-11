import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:se7a_7alalk/modules/screens/payment_screen.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class CartScreen extends StatelessWidget {
  static const String id = "CartScreen";
  var discountController = TextEditingController();
  var phoneNumberController = TextEditingController();
  var addressController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: EdgeInsets.symmetric(horizontal: 10),
        children: [
          ListTile(
            tileColor: kAppSecondColor,
            leading: Text("2", style: TextStyle(color: Colors.white)),
            title: Text(
              "عنصر لديك في السله",
              style: TextStyle(color: Colors.white),
            ),
            trailing: Icon(
              Icons.arrow_forward,
              color: Colors.white,
            ),
          ),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => cartItem(),
              separatorBuilder: (context, index) => SizedBox(
                    height: 10,
                  ),
              itemCount: 2),
          SizedBox(
            height: 20,
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextField(
                controller: discountController,
                decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "الرمز التروجي",
                    suffixIcon: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: kAppSecondColor,
                      ),
                      child: Center(
                          child: Text(
                        "تطبيق",
                        style: TextStyle(color: Colors.white),
                      )),
                      width: 100,
                    )),
              )),
          SizedBox(
            height: 20,
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("تفاصيل الطلب"),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "السعر",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("240 ريال",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "قسيمة الخصم",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text("240 ريال",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Container(
            padding: EdgeInsets.all(10),
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Checkbox(
                          value: false,
                          onChanged: (value) {},
                        ),
                        Text(
                          "ارغب باستخدام رصيد مكافئاتي",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Text("240 ريال",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, color: Colors.red)),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "العنوان",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Row(
            children: [
              Expanded(
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextField(
                      onTap: () {},
                      readOnly: true,
                      controller: discountController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "المدينة",
                        suffixIcon: Icon(Icons.arrow_drop_down),
                      ),
                    )),
              ),
              SizedBox(
                width: 10,
              ),
              Expanded(
                child: Container(
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.white),
                    child: TextField(
                      controller: phoneNumberController,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "رقم الجوال",
                      ),
                    )),
              ),
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Container(
              height: 50,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10), color: Colors.white),
              child: TextField(
                controller: addressController,
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "العنوان بالتفصيل",
                ),
              )),
          Row(
            children: [
              Checkbox(
                value: false,
                onChanged: (value) {},
              ),
              Text("حفظ العنوان")
            ],
          ),
          IntrinsicHeight(
            child: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15))),
              child: Column(
                children: [
                  Text(
                    "الاجمالي 120.00 ريال",
                    style: TextStyle(
                        color: kAppSecondColor,
                        fontSize: 15,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  customButton(
                      onPressed: () {
                        navigateTo(context: context, page: PaymentScreen.id);
                      },
                      text: "الدفع"),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Widget cartItem() => Card(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(Icons.favorite),
            Expanded(child: Image.asset("assets/images/product.png")),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Diurizone",
                  style: TextStyle(fontSize: 15),
                ),
                Text(
                  "120.00 ريال",
                  style: TextStyle(fontSize: 9, color: Color(0xffFE6833)),
                ),
                Row(
                  children: [
                    RatingBar.builder(
                      itemSize: 10,
                      initialRating: 0,
                      minRating: 1,
                      direction: Axis.horizontal,
                      allowHalfRating: false,
                      itemCount: 5,
                      itemBuilder: (context, _) => Icon(
                        Icons.star,
                        color: Colors.amber,
                      ),
                      onRatingUpdate: (rating) {
                        print(rating);
                      },
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Text(
                      "0.4",
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            )),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  children: [
                    FloatingActionButton(
                      onPressed: () {},
                      mini: true,
                      heroTag: '1',
                      backgroundColor: kAppSecondColor,
                      child: Icon(Icons.add),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "1",
                        style: TextStyle(
                            fontSize: 13, fontWeight: FontWeight.bold),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () {},
                      mini: true,
                      heroTag: '2',
                      backgroundColor: kGreyColor,
                      child: Icon(
                        Icons.remove,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                IconButton(onPressed: () {}, icon: Icon(Icons.delete_outline))
              ],
            ),
          ],
        ),
      );
}
