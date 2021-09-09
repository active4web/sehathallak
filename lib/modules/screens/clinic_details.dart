import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class ClinicDetails extends StatelessWidget {
  static const String id = "ClinicDetails";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(context: context, title: "عيادة 1 "),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
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
            Text(
              "عيادة 1 ",
              style: TextStyle(color: kAppColor, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.location_on_outlined,
                      color: kGreyColor,
                    ),
                    Text(
                      "شارع 123 , المدينه",
                      style: TextStyle(color: kGreyColor),
                    )
                  ],
                ),
                TextButton(
                    onPressed: () {},
                    child: Text(
                      "شاهد الموقع على الخريطة",
                      style: TextStyle(color: Color(0xffE02020)),
                    ))
              ],
            ),
            Text(
              "الوصف",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "الخدمات",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى",
              style: TextStyle(fontSize: 14, color: Colors.grey),
            ),
            SizedBox(
              height: 10,
            ),

            Text(
              "أشهر الادوية والفيتامينات",
              style: TextStyle(color: kAppColor, fontWeight: FontWeight.bold),
            ),
            buildNewSlider(),
            Padding(
              padding: const EdgeInsets.all(20),
              child: customButton(onPressed: () {}, text: "طلب الخدمة"),
            )
          ],
        ),
      ),
    );
  }

  Widget buildNewSlider() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 180,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) => buildProductCard(),
                separatorBuilder: (context, index) => SizedBox(
                      width: 10,
                    ),
                itemCount: 3),
          )
        ],
      );

  Widget buildProductCard() => AspectRatio(
        aspectRatio: 0.7,
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
                        style:
                            TextStyle(fontSize: 9, fontWeight: FontWeight.bold),
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
      );
}
