import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:se7a_7alalk/cubits/store_cubit/store_cubit.dart';
import 'package:se7a_7alalk/cubits/store_cubit/store_states.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class AddReviewScreen extends StatelessWidget {
  final int productId;
  final String productName;
  final String productImage;
  static const String id = "/addReviewScreen";
  final TextEditingController ratingTitle = TextEditingController();
  final TextEditingController ratingDesc = TextEditingController();
  int starNumber;
  XFile file;
  AddReviewScreen({Key key, this.productId, this.productName, this.productImage}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: customAppBar(title: "addReview".tr(), context: context),
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
                          image: NetworkImage(productImage))),
                ),
                SizedBox(
                  width: 20,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      productName,
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
                        itemSize: 24,
                        itemCount: 5,
                        itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
                        itemBuilder: (context, _) => Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),
                        onRatingUpdate: (rating) {
                          starNumber = rating.round();
                          print(starNumber);
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
              hintText: 'ratingTitle'.tr(),
              controller: ratingTitle,
            ),
            SizedBox(
              height: 22,
            ),
            CustomTextField(
              hintText: 'tellUsMore'.tr(),
              maxLines: 4,
              controller: ratingDesc,
            ),
            BlocConsumer<StoreCubit, StoreStates>(
              builder: (context, state) {
                return buildImageContainer(
                    onPressed: () async {
                      file = await StoreCubit.get(context).pickImage(file: file);
                    },
                    title: "uploadPhoto".tr(),
                    icon: Icons.camera_alt_outlined);
              },
              listener: (context, state) {},
            ),
            BlocConsumer<StoreCubit, StoreStates>(
              builder: (context, state) {
                return state is! AddReviewLoadingState
                    ? Padding(
                        padding: const EdgeInsets.all(20),
                        child: customButton(
                            text: 'addYourReview'.tr(),
                            onPressed: () async {
                              var result = await StoreCubit.get(context)
                                  .addAReview(
                                      productId: productId,
                                      file: file,
                                      ratingDesc: ratingDesc.text,
                                      ratingTitle: ratingTitle.text,
                                      starNum: starNumber);
                              showToast(text: result["msg"]);
                            }),
                      )
                    : Center(
                        child: CircularProgressIndicator(),
                      );
              },
              listener: (context, state) {},
            )
          ],
        ),
      ),
    );
  }
}
