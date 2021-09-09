import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';

class MyOffersScreen extends StatelessWidget {
  static const String id = "myOffers";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "عروض خاصة",
        actions: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "عدد العروض(4)",
                  style: TextStyle(color: kAppColor),
                ),
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.filter_alt_outlined,
                      color: kAppColor,
                    ))
              ],
            ),
          ),
          Expanded(
            child: GridView.count(
              padding: EdgeInsets.all(20),
              crossAxisCount: 2,
              crossAxisSpacing: 20,
              childAspectRatio: 0.9,
              mainAxisSpacing: 20,
              children: List.generate(4, (index) => buildProductCard()),
            ),
          )
        ],
      ),
    );
  }

  Widget buildProductCard() => Stack(
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
                      style:
                          TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Container(
                  width: double.infinity,
                  color: kAppColor,
                  margin: EdgeInsets.symmetric(horizontal: 10),
                  child: Text(
                    "اضف للسلة",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 9),
                  ),
                )
              ],
            ),
          ),
          Positioned(
              top: 5,
              right: 5,
              child: Icon(
                Icons.favorite,
                size: 20,
                color: kGreyColor,
              )),
          Positioned(
              top: 5,
              left: 5,
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
      );
}
