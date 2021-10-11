import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class QuestionsAndAnswers extends StatelessWidget {
  static const String id = "QuestionsAndAnswers";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: "سؤال وجواب", context: context),
        body: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                textBaseline: TextBaseline.alphabetic,
                crossAxisAlignment: CrossAxisAlignment.baseline,
                children: [
                  Text(
                    "130",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 32),
                  ),
                  Text(
                    "استفسار",
                    style: TextStyle(color: kGreyColor, fontSize: 14),
                  )
                ],
              ),
              Divider(),
              Padding(
                padding: const EdgeInsets.all(20),
                child: customButton(onPressed: () {}, text: "هل لديك سؤال"),
              ),
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) => buildItem(),
                    separatorBuilder: (context, index) => SizedBox(
                          height: 10,
                        ),
                    itemCount: 3),
              )
            ],
          ),
        ));
  }

  Widget buildItem() => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "هل معتمد من هيئة الدواء",
            style: TextStyle(fontSize: 13, color: kGreyColor),
          ),
          Text(
            "نشر في 1/1/2021",
            style: TextStyle(fontSize: 13, color: kGreyColor),
          ),
          Text.rich(TextSpan(
              text: "أفضل أجابة",
              style: TextStyle(color: kAppSecondColor),
              children: [
                TextSpan(
                    text: "        طيعا معتمد من هيئة الدواء",
                    style: TextStyle(color: Colors.black))
              ])),
          Text(
            "هل كانت الإجابة مفيدة لك  ؟",
            style: TextStyle(fontSize: 13, color: kGreyColor),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  buildPressedButton(
                      onPressed: () {}, color: kAppSecondColor, text: "نعم(3)"),
                  buildPressedButton(
                      onPressed: () {}, color: Colors.black, text: "لا(0)"),
                ],
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  "ابلاغ عن اساءة",
                  style: TextStyle(fontSize: 13, color: Color(0xffE02020)),
                ),
              ),
            ],
          )
        ],
      );

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
}

Widget buildItem() => Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "هل معتمد من هيئة الدواء",
          style: TextStyle(fontSize: 13, color: kGreyColor),
        ),
        Text(
          "نشر في 1/1/2021",
          style: TextStyle(fontSize: 13, color: kGreyColor),
        ),
        Text.rich(TextSpan(
            text: "أفضل أجابة",
            style: TextStyle(color: kAppSecondColor),
            children: [
              TextSpan(
                  text: "        طيعا معتمد من هيئة الدواء",
                  style: TextStyle(color: Colors.black))
            ])),
        Text(
          "هل كانت الإجابة مفيدة لك  ؟",
          style: TextStyle(fontSize: 13, color: kGreyColor),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                buildPressedButton(
                    onPressed: () {}, color: kAppSecondColor, text: "نعم(3)"),
                buildPressedButton(
                    onPressed: () {}, color: Colors.black, text: "لا(0)"),
              ],
            ),
            TextButton(
              onPressed: () {},
              child: Text(
                "ابلاغ عن اساءة",
                style: TextStyle(fontSize: 13, color: Color(0xffE02020)),
              ),
            ),
          ],
        )
      ],
    );

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
