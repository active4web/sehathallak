import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:se7a_7alalk/modules/user/questions_and_answers.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class ProductScreen extends StatelessWidget {
  static const String id = "ProductScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ListView(children: [
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Icon(
                              Icons.favorite,
                              color: Colors.redAccent,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Icon(
                              Icons.share,
                              color: Colors.blueAccent,
                            ),
                          ),
                        )
                      ],
                    ),
                    Image.asset(
                      "assets/images/medecine.png",
                      width: 250,
                    )
                  ],
                ),
              ),
              // indicator
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Diurizone",
                    style: TextStyle(
                        color: kAppSecondColor,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      Text(
                        "(4.9)",
                        style: TextStyle(
                            color: kGreyColor,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Text(
                        " 120.00 ريال",
                        style: TextStyle(
                            color: Color(0xffFE6833),
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Text(
                        " 120.00 ريال",
                        style: TextStyle(
                            color: kGreyColor,
                            fontSize: 14,
                            decoration: TextDecoration.lineThrough,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10,
                    ),
                    decoration: BoxDecoration(
                        color: Colors.red,
                        borderRadius: BorderRadius.circular(5)),
                    child: Text(
                      "%10-",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 13,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "غير متوفر",
                    style: TextStyle(
                        color: Color(0xffE02020),
                        fontSize: 13,
                        fontWeight: FontWeight.bold),
                  ),
                  Row(
                    children: [
                      Text(
                        "130",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "استفسار",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Text(
                "المواصفات",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                "زجاجة 55 مل",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Text(
                "تاريخ الصلاحية",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
              ),
              Text(
                "1/12022",
                style: TextStyle(
                  fontSize: 13,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "الكمية المطلوبه",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
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
                ],
              ),
              Text(
                "توصيل مجاني للطلب اكثر من 2500 ريال",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xffFA6400),
                  fontSize: 13,
                ),
              ),
              DefaultTabController(
                  length: 4,
                  child: Column(
                    children: [
                      TabBar(
                        isScrollable: true,
                        indicatorSize: TabBarIndicatorSize.tab,
                        labelColor: Colors.white,
                        unselectedLabelColor: kAppColor,
                        tabs: [
                          Tab(
                              icon: Text(
                            "لمحة عامه",
                          )),
                          Tab(
                              icon: Text(
                            "التفاصيل",
                          )),
                          Tab(
                              icon: Text(
                            "التقييمات",
                          )),
                          Tab(
                              icon: Text(
                            "سؤال وجواب",
                          )),
                        ],
                        indicator: BubbleTabIndicator(
                          indicatorHeight: 25.0,
                          indicatorColor: kAppSecondColor,
                          tabBarIndicatorSize: TabBarIndicatorSize.tab,
                        ),
                      ),
                      LimitedBox(
                        maxHeight: 200,
                        child: TabBarView(children: [
                          IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "الوصف",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى",
                                  style: TextStyle(
                                      fontSize: 14, color: kGreyColor),
                                ),
                              ],
                            ),
                          ),
                          IntrinsicHeight(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "طريقه الاستخدام",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى",
                                  style: TextStyle(
                                      fontSize: 14, color: kGreyColor),
                                ),
                              ],
                            ),
                          ),
                          IntrinsicHeight(
                            child: ListView(
                              children: [
                                Text(
                                  "طريقه الاستخدام",
                                  style: TextStyle(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى",
                                  style: TextStyle(
                                      fontSize: 14, color: kGreyColor),
                                ),
                              ],
                            ),
                          ),
                          IntrinsicHeight(
                            child: ListView(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: customButton(
                                      onPressed: () {}, text: "هل لديك سؤال"),
                                ),
                                Column(
                                  children:
                                      List.generate(3, (index) => buildItem()),
                                )
                              ],
                            ),
                          ),
                        ]),
                      ),
                    ],
                  )),
              SizedBox(
                height: 20,
              ),
              Text(
                "منتجات يتم طلبها مع هذا المنتج",
                style: TextStyle(fontSize: 17),
              ),
              buildNewSlider(),
              Text(
                "المنتجات التي تم شراؤها بشكل متكرر",
                style: TextStyle(fontSize: 17),
              ),
              buildNewSlider(),
              Text(
                "شاهد العملاء ايضا",
                style: TextStyle(fontSize: 17),
              ),
              buildNewSlider()
            ]),
            IntrinsicHeight(
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10))),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "الاجمالي 120.00 ريال",
                          style: TextStyle(
                              color: kAppSecondColor,
                              fontSize: 15,
                              fontWeight: FontWeight.bold),
                        ),
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
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
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Expanded(
                            child: customButton(
                                onPressed: () {}, text: "اضف للسلة")),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: kGreyColor,
                              borderRadius: BorderRadius.circular(20)),
                          child: Image.asset("assets/images/Help.png"),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ));
  }

  Widget buildNewSlider() => Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 180,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => buildProductCard(context),
            separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
            itemCount: 3),
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
