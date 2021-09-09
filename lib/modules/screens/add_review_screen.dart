import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/custom_arrow_back.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class AddReviewScreen extends StatelessWidget {
  static const String id = "addReviewScreen";
  final TextEditingController ratingLocation = TextEditingController();
  final TextEditingController moreRating = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: "إضافة تقييم", context: context),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/product.png'))),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Product Name',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                    ),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: RatingBar.builder(
                        initialRating: 0,
                        minRating: 1,
                        direction: Axis.horizontal,
                        allowHalfRating: false,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          print(rating);
                        },
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            CustomTextField(
              hintText: 'عنوان التقييم',
              controller: ratingLocation,
            ),
            SizedBox(
              height: 22,
            ),
            CustomTextField(
              hintText: 'اخبرنا بالمزيد',
              maxLines: 4,
              controller: moreRating,
            ),
            buildImageContainer(
                onPressed: () {},
                title: "تحميل صورة",
                icon: Icons.camera_alt_outlined),
            Padding(
              padding: const EdgeInsets.all(20),
              child: customButton(
                text: 'اضف تقييمك',
              ),
            )
          ],
        ),
      ),
    );
  }
}
