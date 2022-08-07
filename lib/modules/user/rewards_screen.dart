import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/model/user_points_model.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';

class RewardsScreen extends StatelessWidget {
  static const String id = "/rewardsScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "rewards".tr(),
      ),
      body: FutureBuilder<UserPointsModel>(
        future: AppCubit.get(context).getUserPoints(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('doYouWantToEarnRewardsPoints'.tr()),
                    SizedBox(
                      height: 8,
                    ),
                    Text(
                        'youCanEarnRewardsCreditWhenPurchasing,CommentingAndEvaluatingProductsAndServices'
                            .tr()),

                    /// Card
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 5, vertical: 10),
                      padding: EdgeInsets.all(12),
                      height: MediaQuery.of(context).size.height * 0.25,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          color: Color(0xff4FC6E9)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${"rewardsBalanceIsCalculatedAsFollows".tr()} :',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'SAR/1000Points'.tr(),
                            style: TextStyle(color: Colors.white),
                          ),
                          Divider(
                            color: Colors.white,
                            thickness: 1,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${"theNumberOfPointsEarned".tr()} :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data.data.totalPoints.toString(),
                                style: TextStyle(
                                    fontSize: 26,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '${"deservedAmount".tr()} :',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold),
                              ),
                              Text(
                                snapshot.data.data.cost.toString(),
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Text(
                      'recordsOfPointsEarned'.tr(),
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    snapshot.data.data.hPoints.isNotEmpty
                        ? ListView.builder(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: snapshot.data.data.hPoints.length,
                            itemBuilder: (context, index) => Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(snapshot.data.data.hPoints[index].desc),
                                  Row(
                                    children: [
                                      Text(
                                        snapshot.data.data.hPoints[index]
                                            .pointsCount
                                            .toString(),
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Text('point'.tr())
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          )
                        : Text("لا يوجد نقاط")
                  ],
                ),
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            return Center(
              child: Text("لايوجد لديك نقاط"),
            );
          }
        },
      ),
    );
  }
}
