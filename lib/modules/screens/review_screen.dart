import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class ReviewScreen extends StatelessWidget {
  static const String id = "ReviewScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "التقييمات",
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          Row(
            children: [
              Text(
                "4.3",
                style: TextStyle(fontSize: 32),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 5,
                    itemSize: 20,
                    ignoreGestures: true,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Text(
                    "تقييم (27)",
                    style: TextStyle(fontSize: 14, color: kGreyColor),
                  ),
                ],
              )
            ],
          ),
          ratingBar(),
          ratingBar(),
          ratingBar(),
          ratingBar(),
          ratingBar(),
          customButton(onPressed: () {}, text: "اضف تقييمك"),
          ListView.separated(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => buildReviewItem(),
              separatorBuilder: (context, index) => SizedBox(),
              itemCount: 3)
        ],
      ),
    );
  }

  Widget ratingBar() => IntrinsicWidth(
        child: Row(
          children: [
            Text("84"),
            SfSlider(
              value: 0.1,
              showLabels: false,
              showTicks: false,
              enableTooltip: false,
              showDividers: false,
              onChanged: (value) {},
            ),
            RatingBar.builder(
              initialRating: 3,
              minRating: 1,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 15,
              ignoreGestures: true,
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                print(rating);
              },
            )
          ],
        ),
      );

  Widget buildReviewItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "سالم سعيد",
                style: TextStyle(color: kAppSecondColor, fontSize: 12),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "نشر في 1/1/2021",
                style: TextStyle(fontSize: 12),
              ),
              Spacer(),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating: 3,
                    minRating: 1,
                    direction: Axis.horizontal,
                    allowHalfRating: true,
                    itemCount: 1,
                    itemSize: 20,
                    ignoreGestures: true,
                    itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                    itemBuilder: (context, _) => Icon(
                      Icons.star,
                      color: Colors.amber,
                    ),
                    onRatingUpdate: (rating) {
                      print(rating);
                    },
                  ),
                  Text("5")
                ],
              )
            ],
          ),
          Text(
            "ممتاز",
            style: TextStyle(color: kGreyColor, fontSize: 12),
          ),
          Text(
            "ممتاز جدا لاحظت الفرق وقد نصحني به الطبيب",
            style: TextStyle(color: kGreyColor, fontSize: 12),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () {},
                  child: Text(
                    "ابلاغ عن اساءة",
                    style: TextStyle(color: Colors.red),
                  )),
              Spacer(),
              GestureDetector(
                child: Image.asset("assets/images/like.png"),
                onTap: () {},
              ),
              Text("(12)"),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                child: Image.asset("assets/images/dislike.png"),
                onTap: () {},
              ),
              Text("(12)"),
              IconButton(
                icon: Image.asset("assets/images/share.png"),
                onPressed: () {},
              ),
            ],
          )
        ],
      );
}
