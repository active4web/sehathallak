import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:se7a_7alalk/modules/forms/book_appointment_screen.dart';
import 'package:se7a_7alalk/modules/forms/emergency_booking_screen.dart';
import 'package:se7a_7alalk/modules/screens/product_screen.dart';
import 'package:se7a_7alalk/shared/components/custom_search_text_field.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class HomeScreen extends StatelessWidget {
  static const String id = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Image.asset(
                  "assets/images/logo.png",
                  width: 50,
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: CustomSearchTextField(),
                )
              ],
            ),
          ),
          Container(
            color: kAppSecondColor.withOpacity(0.3),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton.icon(
                    onPressed: () {},
                    icon: Icon(Icons.location_on_outlined),
                    label: Text("التوصيل : السعودية")),
                Directionality(
                  textDirection: TextDirection.ltr,
                  child: TextButton.icon(
                      onPressed: () {},
                      icon: Icon(Icons.circle),
                      label: Text("AR")),
                ),
              ],
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                // CarouselSlider(
                //   items: AppCubit.get(context)
                //       .homeData
                //       .result
                //       .mainOffers
                //       .map((e) => InkWell(
                //             onTap: () {},
                //             child: Container(
                //               margin: EdgeInsets.symmetric(horizontal: 5),
                //               decoration: BoxDecoration(
                //                 borderRadius: BorderRadius.circular(10),
                //                 image: DecorationImage(
                //                     image: NetworkImage(e.image),
                //                     // image: AssetImage("assets/images/test.png"),
                //                     fit: BoxFit.cover),
                //               ),
                //             ),
                //           ))
                //       .toList(),
                //   options: CarouselOptions(
                //       autoPlay: true,
                //       // aspectRatio: 15 / 15,
                //       height: 200,
                //       onPageChanged: (index, reason) {
                //         AppCubit.get(context)
                //             .changeCarouselIndicator(index, reason);
                //       }),
                // ),
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.center,
                //     children: List.generate(
                //         AppCubit.get(context).homeData.result.mainOffers.length,
                //         (index) => Container(
                //               width: 8.0,
                //               height: 8.0,
                //               margin: EdgeInsets.symmetric(
                //                   vertical: 10.0, horizontal: 2.0),
                //               decoration: BoxDecoration(
                //                   shape: BoxShape.circle,
                //                   color:
                //                       AppCubit.get(context).currentIndex == index
                //                           ? Color(0xffEAC77A)
                //                           : Color.fromRGBO(0, 0, 0, 0.4)),
                //             ))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildRowItem(
                        title: "استشارة بيطرية عامة\n( محادثة كتابية )",
                        onPressed: () {},
                        image: "assets/images/icon 2.png"),
                    buildRowItem(
                        title: "حجز موعد كشف\n( حالات عادية )",
                        onPressed: () {
                          navigateTo(
                              context: context, page: AppointmentBooking.id);
                        },
                        image: "assets/images/icon 1.png"),
                    buildRowItem(
                        title: "حجز موعد كشف\n(حالات طارئة )",
                        onPressed: () {
                          navigateTo(
                              context: context, page: EmergencyBooking.id);
                        },
                        image: "assets/images/icon 3.png"),
                  ],
                ),
                buildCategorySlider(),
                buildCategorySlider(),
                buildCategorySlider(),
                buildCategorySlider(),
                buildCategorySlider(),
                buildNewSlider(),
                buildNewSlider()
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget buildRowItem({String image, String title, Function onPressed}) =>
      InkWell(
        onTap: onPressed,
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(5),
              ),
              child: Image.asset(image),
            ),
            Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 12),
            )
          ],
        ),
      );

  Widget buildCategorySlider() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "التحصينات البيطرية",
              style: TextStyle(fontSize: 14),
            ),
          ),
          Container(
            height: 100,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => AspectRatio(
                      aspectRatio: 2,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(15),
                        ),
                        child: Row(
                          children: [
                            Image.asset("assets/images/test.png"),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                              child: Text(
                                "تحصين الحيوانات الاليفة",
                                style: TextStyle(color: kAppColor),
                                textAlign: TextAlign.center,
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: 3),
          )
        ],
      );

  Widget buildNewSlider() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Text(
              "التحصينات البيطرية",
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
