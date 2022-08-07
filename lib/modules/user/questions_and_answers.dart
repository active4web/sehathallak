import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_states.dart';
import 'package:se7a_7alalk/model/q_and_a_model.dart';
import 'package:se7a_7alalk/modules/user/add_question_screen.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class QuestionsAndAnswers extends StatelessWidget {
  static const String id = "/QuestionsAndAnswers";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "questionsAndAnswers".tr(), context: context),
      body: StreamBuilder<QAndAModel>(
        stream: AppCubit.get(context).getAllQuestions().asStream(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              snapshot != null) {
            return Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                children: [
                  Row(
                    textBaseline: TextBaseline.alphabetic,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    children: [
                      Text(
                        snapshot.data.faqs.length.toString(),
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 32),
                      ),
                      Text(
                        "inquiry".tr(),
                        style: TextStyle(color: kGreyColor, fontSize: 14),
                      )
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: const EdgeInsets.all(20),
                    child: customButton(
                        onPressed: () {
                          navigateTo(
                              context: context, page: AddQuestionScreen());
                        },
                        text: "doYouHaveAQuestion".tr()),
                  ),
                  Expanded(
                    child: ListView.separated(
                        itemBuilder: (context, index) =>
                            buildItem(snapshot, index, context),
                        separatorBuilder: (context, index) => SizedBox(
                              height: 10,
                            ),
                        itemCount: snapshot.data.faqs.length),
                  )
                ],
              ),
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
      ),
    );
  }

  Widget buildItem(snapshot, index, context) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            snapshot.data.faqs[index].question,
            style: TextStyle(fontSize: 13, color: kGreyColor),
          ),
          Text(
            "${"publishedAt".tr()} ${snapshot.data.faqs[index].createdAt.substring(0, 10)}",
            style: TextStyle(fontSize: 13, color: kGreyColor),
          ),
          Text.rich(TextSpan(
              text: "${"bestAnswer".tr()}   ",
              style: TextStyle(color: kAppSecondColor),
              children: [
                TextSpan(
                    text: snapshot.data.faqs[index].answer,
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
                  var result = await AppCubit.get(context)
                      .report(type: 2, itemId: snapshot.data.faqs[index].id);
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
}

Widget buildPressedButton({Function onPressed, String text, Color color}) =>
    TextButton(
      onPressed: onPressed,
      child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              border: Border.all(color: color)),
          child: Text(text, style: TextStyle(color: color))),
    );
