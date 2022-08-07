import 'package:bubble_tab_indicator/bubble_tab_indicator.dart';
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_share/flutter_share.dart';
import 'package:se7a_7alalk/cubits/cart_cubit/cart_cubit.dart';
import 'package:se7a_7alalk/cubits/cart_cubit/cart_states.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/cubits/service_cubit/service_cubit.dart';
import 'package:se7a_7alalk/cubits/store_cubit/store_cubit.dart';
import 'package:se7a_7alalk/cubits/store_cubit/store_states.dart';
import 'package:se7a_7alalk/model/product_details_model.dart';
import 'package:se7a_7alalk/modules/auth_screens/auth_screen.dart';
import 'package:se7a_7alalk/modules/layout/home_layout_screens/home_screen.dart';
import 'package:se7a_7alalk/modules/user/add_question_screen.dart';
import 'package:se7a_7alalk/modules/user/questions_and_answers.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

import 'add_review_screen.dart';

class ProductScreen extends StatelessWidget {
  final int productId;

  const ProductScreen({Key key, this.productId}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<ProductsDetailsModel>(
      future: StoreCubit.get(context).getProductDetails(productId),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          CartCubit.get(context).productFinalPrice =
              snapshot.data.data.product[0].price;
          CartCubit.get(context).productQuantity = 1;
          return Stack(
            alignment: Alignment.bottomCenter,
            children: [
              ListView(
                  children: [
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white),
                            child: Icon(
                              Icons.favorite,
                              color: snapshot.data.data.product[0].fav == 1
                                  ? Colors.redAccent
                                  : kGreyColor,
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await FlutterShare.share(
                                  title: snapshot.data.data.product[0].shareLink,
                                  text: snapshot.data.data.product[0].shareLink,
                                  linkUrl: snapshot.data.data.product[0].shareLink,

                              );
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
                      Image.network(
                        snapshot.data.data.product[0].images[0],
                        width: 250,
                      )
                    ],
                  ),
                ),
                // indicator
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            snapshot.data.data.product[0].name,
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
                                "${double.parse(snapshot.data.data.product[0].rating)}",
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
                                "${snapshot.data.data.product[0].price} ريال",
                                style: TextStyle(
                                    color: Color(0xffFE6833),
                                    fontSize: 14,
                                    fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 3,
                              ),
                              Text(
                                "${snapshot.data.data.product[0].price} ريال",
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
                              "%${snapshot.data.data.product[0].offer}-",
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
                            snapshot.data.data.product[0].status == 0
                                ? "notAvailable".tr()
                                : "available".tr(),
                            style: TextStyle(
                                color: Color(0xffE02020),
                                fontSize: 13,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            children: [
                              Text(
                                snapshot.data.data.faqs.length.toString(),
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                              Text(
                                "inquiry".tr(),
                                style: TextStyle(
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        "specifications".tr(),
                        style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        snapshot.data.data.product[0].shortDesc,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      Text(
                        "expirationDate".tr(),
                        style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      Text(
                        snapshot.data.data.product[0].endDate,
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "requiredQuantity".tr(),
                            style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
                          ),
                          BlocBuilder<CartCubit, CartStates>(
                            builder: (context, state) {
                              return Row(
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      CartCubit.get(context).productQuantityIncrement(
                                          snapshot.data.data.product[0].price);
                                    },
                                    mini: true,
                                    heroTag: null,
                                    backgroundColor: kAppSecondColor,
                                    child: Icon(Icons.add),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      CartCubit.get(context)
                                          .productQuantity
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 13, fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      CartCubit.get(context).productQuantityDecrement(
                                          snapshot.data.data.product[0].price);
                                    },
                                    mini: true,
                                    heroTag: null,
                                    backgroundColor: kGreyColor,
                                    child: Icon(
                                      Icons.remove,
                                      color: Colors.black,
                                    ),
                                  ),
                                ],
                              );
                            },
                          ),
                        ],
                      ),
                      if(snapshot.data.data.product[0].priceDeleveryFree != null)
                      Align(
                        alignment: Alignment.center,
                        child: Text(
                          "${"freeDeliveryForOrdersMoreThan".tr()}${snapshot.data.data.product[0].priceDeleveryFree} ريال",
                          style: TextStyle(
                            color: Color(0xffFA6400),
                            fontSize: 13,
                          ),
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
                                    "overview".tr(),

                                  )),
                                  Tab(
                                      icon: Text(
                                    "details".tr(),
                                  )),
                                  Tab(
                                      icon: Text(
                                    "reviews".tr(),
                                  )),
                                  Tab(
                                      icon: Text(
                                    "questionAndAnswer".tr(),
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
                                          "description".tr(),
                                          style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),

                                        ),
                                        Text(
                                          snapshot.data.data.product[0].longDesc,
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
                                          "howToUse".tr(),
                                          style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),

                                        ),
                                        Text(
                                          snapshot.data.data.product[0].howUsed,
                                          style: TextStyle(
                                              fontSize: 14, color: kGreyColor),
                                        ),
                                      ],
                                    ),
                                  ),
                                  IntrinsicHeight(
                                    child: ListView(
                                      children: [
                                        if(CacheHelper.getData("apiToken") != "")
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: customButton(
                                              onPressed: () {
                                                navigateTo(
                                                    page: AddReviewScreen(productId: snapshot
                                                        .data.data.product[0].id,productName: snapshot
                                                        .data.data.product[0].name,productImage: snapshot.data
                                                        .data.product[0].images[0],),
                                                    context: context,);
                                              },
                                              text: "addYourReview".tr()),
                                        ),
                                        Column(
                                          children: List.generate(
                                              snapshot.data.data.reviews.length,
                                              (index) {
                                            if (snapshot.data.data.reviews.length >
                                                0) {
                                              return buildReviewItem(
                                                  snapshot, index, context);
                                            } else {
                                              return Center(
                                                child: Text("noReviews".tr()),
                                              );
                                            }
                                          }),
                                        )
                                      ],
                                    ),
                                  ),
                                  IntrinsicHeight(
                                    child: ListView(
                                      children: [
                                        if(CacheHelper.getData("apiToken") != "")
                                        Padding(
                                          padding: const EdgeInsets.all(20),
                                          child: customButton(
                                              onPressed: () {
                                                navigateTo(
                                                    page: AddQuestionScreen(),
                                                    context: context,
                                                    );
                                              },
                                              text: "doYouHaveAQuestion".tr()),
                                        ),
                                        Column(
                                          children: List.generate(
                                              snapshot.data.data.faqs.length,
                                              (index) {
                                            if (snapshot.data.data.faqs.length > 0) {
                                              return buildFaqItem(
                                                  snapshot, index, context);
                                            } else {
                                              return Text("noQuestions".tr());
                                            }
                                          }),
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
                        "productsOrderedWithThisProduct".tr(),
                        style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      buildProductInOrderNewSlider(snapshot),
                      Text(
                        "frequentlyPurchasedProducts".tr(),
                        style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      buildProductFrequentlyNewSlider(snapshot),
                      Text(
                        "clientsAlsoSee".tr(),
                        style: TextStyle(fontSize: 22,color: Colors.black,fontWeight: FontWeight.bold),
                      ),
                      buildClientsNewSlider(snapshot),
                      SizedBox(
                        height: 100,
                      ),
                    ],
                  ),
                ),
                    SizedBox(height: 50,)
              ]),
              BlocBuilder<CartCubit, CartStates>(
                builder: (context, state) {
                  return IntrinsicHeight(
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
                                "${"total".tr()}${CartCubit.get(context).productFinalPrice}",
                                style: TextStyle(
                                    color: kAppSecondColor,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                              Row(
                                children: [
                                  FloatingActionButton(
                                    onPressed: () {
                                      CartCubit.get(context)
                                          .productQuantityIncrement(snapshot
                                              .data.data.product[0].price);
                                    },
                                    mini: true,
                                    heroTag: null,
                                    backgroundColor: kAppSecondColor,
                                    child: Icon(Icons.add),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: Text(
                                      CartCubit.get(context)
                                          .productQuantity
                                          .toString(),
                                      style: TextStyle(
                                          fontSize: 13,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                  FloatingActionButton(
                                    onPressed: () {
                                      CartCubit.get(context)
                                          .productQuantityDecrement(snapshot
                                              .data.data.product[0].price);
                                    },
                                    mini: true,
                                    heroTag: null,
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
                              state is! AddToCartLoadingState
                                  ? Expanded(
                                      child: customButton(
                                          onPressed: () async {
                                           if(CacheHelper.getData("apiToken") != ""){
                                             var result =
                                             await CartCubit.get(context)
                                                 .addToCart(
                                                 snapshot.data.data
                                                     .product[0].id,
                                                 CartCubit.get(context)
                                                     .productQuantity);
                                             showToast(text: result["msg"]);
                                           }else{
                                             showToast(text: "يجب تسجيل الدخول");
                                           }
                                          },
                                          text: "addToCart".tr()))
                                  : Expanded(
                                      child: Center(
                                        child: CircularProgressIndicator(),
                                      ),
                                    ),
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
                  );
                },
              )
            ],
          );
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Center(
            child: CircularProgressIndicator(),
          );
        } else {
          return Center(
            child: Text("تاكد من الانترنت"),
          );
        }
      },
    ));
  }

  Widget buildClientsNewSlider(AsyncSnapshot<ProductsDetailsModel> snapshot) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 250,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                buildProductCard(context, snapshot.data.data.productsViewClients[index]),
            separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
            itemCount: snapshot.data.data.productsViewClients.length),
      );



  Widget buildProductInOrderNewSlider(
          AsyncSnapshot<ProductsDetailsModel> snapshot) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 250,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                buildProductCard(context, snapshot.data.data.productsInOrder[index]),
            separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
            itemCount: snapshot.data.data.productsInOrder.length),
      );



  Widget buildProductFrequentlyNewSlider(
          AsyncSnapshot<ProductsDetailsModel> snapshot) =>
      Container(
        margin: EdgeInsets.symmetric(vertical: 10),
        height: 250,
        child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) =>
                buildProductCard(context, snapshot.data.data.productsSaleLoop[index]),
            separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
            itemCount: snapshot.data.data.productsSaleLoop.length),
      );



  Widget buildFaqItem(
          AsyncSnapshot<ProductsDetailsModel> snapshot, index, context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            snapshot.data.data.faqs[index].question,
            style: TextStyle(fontSize: 13, color: kGreyColor),
          ),
          Text(
            "${"publishedAt".tr()} ${snapshot.data.data.faqs[index].createdAt.substring(0, 10)}",
            style: TextStyle(fontSize: 13, color: kGreyColor),
          ),
          Text.rich(TextSpan(
              text: "${"bestAnswer".tr()}   ",
              style: TextStyle(color: kAppSecondColor),
              children: [
                TextSpan(
                    text: snapshot.data.data.faqs[index].answer,
                    style: TextStyle(color: Colors.black))
              ])),
          Text(
            "wasTheAnswerHelpfulToYou".tr(),
            style: TextStyle(fontSize: 13, color: kGreyColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  buildPressedButton(
                      onPressed: () {},
                      color: kAppSecondColor,
                      text: "${"yes".tr()}(3)"),
                  buildPressedButton(
                      onPressed: () {},
                      color: Colors.black,
                      text: "${"no".tr()}(0)"),
                ],
              ),
              TextButton(
                onPressed: () async {
                  var result = await AppCubit.get(context).report(
                      type: 2, itemId: snapshot.data.data.faqs[index].id);
                  showToast(text: result["msg"]);
                },
                child: Text(
                  "report".tr(),
                  style: TextStyle(fontSize: 13, color: Color(0xffE02020)),
                ),
              ),
            ],
          )
        ],
      );

  Widget buildReviewItem(
          AsyncSnapshot<ProductsDetailsModel> snapshot, index, context) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                snapshot.data.data.reviews[index].userName,
                style: TextStyle(color: kAppSecondColor, fontSize: 12),
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                "نشر في ${snapshot.data.data.reviews[index].createdAt.substring(0, 10)}",
                style: TextStyle(fontSize: 12),
              ),
              Spacer(),
              Row(
                children: [
                  RatingBar.builder(
                    initialRating:
                        snapshot.data.data.reviews[index].starNum.toDouble(),
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
                  Text(snapshot.data.data.reviews[index].starNum.toString())
                ],
              )
            ],
          ),
          Text(
            snapshot.data.data.reviews[index].title,
            style: TextStyle(color: kGreyColor, fontSize: 12),
          ),
          Text(
            snapshot.data.data.reviews[index].desc,
            style: TextStyle(color: kGreyColor, fontSize: 12),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () async {
                    var result = await AppCubit.get(context).report(
                        type: 1, itemId: snapshot.data.data.reviews[index].id);
                    showToast(text: result["msg"]);
                  },
                  child: Text(
                    "ابلاغ عن اساءة",
                    style: TextStyle(color: Colors.red),
                  )),
              Spacer(),
              GestureDetector(
                child: Image.asset("assets/images/like.png"),
                onTap: () {},
              ),
              Text("(${snapshot.data.data.reviews[index].likeNum})"),
              SizedBox(
                width: 5,
              ),
              GestureDetector(
                child: Image.asset("assets/images/dislike.png"),
                onTap: () {},
              ),
              Text("(${snapshot.data.data.reviews[index].dislikeNum})"),
              // IconButton(
              //   icon: Image.asset("assets/images/share.png"),
              //   onPressed: () {},
              // ),
            ],
          )
        ],
      );
}
