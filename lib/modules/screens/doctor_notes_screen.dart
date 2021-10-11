import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:se7a_7alalk/modules/screens/product_screen.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class DoctorNotesScreen extends StatelessWidget {
  static const String id = "DoctorNotesScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "ملاحظات الطبيب ",
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("ملاحظات الطبيب "),
          SizedBox(
            height: 30,
          ),
          Container(
            decoration: BoxDecoration(border: Border.all()),
            child: Text(
                "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى"),
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.amber,
                    borderRadius: BorderRadius.circular(20)),
                child: Icon(
                  Icons.shopping_cart,
                  color: Colors.white,
                ),
              ),
              SizedBox(
                width: 5,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "تمت اضافه الادويه المطلوبه لعربه التسوق الخاصه بك ",
                  ),
                  InkWell(
                      onTap: () {},
                      child: Text(
                        "الانتقال الى عربة التسوق",
                        style: TextStyle(color: Colors.red),
                      ))
                ],
              ),
            ],
          ),
          SizedBox(
            height: 50,
          ),
          buildNewSlider()
        ],
      ),
    );
  }

  Widget buildNewSlider() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "موصى بها",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            height: 180,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buildProductCard(context),
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: 3),
          )
        ],
      );

  Widget buildProductCard(BuildContext context) => AspectRatio(
        aspectRatio: 0.7,
        child: InkWell(
          onTap: () {
            navigateTo(context: context, page: ProductScreen.id);
          },
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Align(
                      alignment: Alignment.center,
                      child: Image.asset(
                        "assets/images/test.png",
                      ),
                    ),
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
                          style: TextStyle(
                              fontSize: 9, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 20),
                      color: kAppColor,
                      child: Text(
                        "اضف للسلة",
                        style: TextStyle(color: Colors.white, fontSize: 9),
                      ),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 1,
                  right: 1,
                  child: Icon(
                    Icons.favorite,
                    size: 20,
                    color: kGreyColor,
                  )),
              Positioned(
                  top: 1,
                  left: 1,
                  child: Container(
                    padding: EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffFE6833)),
                    child: Text(
                      "20%",
                      style: TextStyle(color: Colors.white, fontSize: 10),
                    ),
                  )),
            ],
          ),
        ),
      );
}
