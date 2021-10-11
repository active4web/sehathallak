import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';

class ChatDetailsScreen extends StatelessWidget {
  static const String id = "ChatDetailsScreen";
  var textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: "محادثة",
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                    itemBuilder: (context, index) {
                      if (index == 1) return buildMessage(context);
                      return buildMyMessage(context);
                    },
                    separatorBuilder: (context, index) => SizedBox(
                          height: 15,
                        ),
                    itemCount: 3),
              ),
              Row(
                children: [
                  Icon(
                    Icons.attach_file,
                    size: 40,
                    color: kAppSecondColor,
                  ),
                  Expanded(
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey[300],
                          width: 1.0,
                        ),
                        borderRadius: BorderRadius.circular(
                          15.0,
                        ),
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      child: Row(
                        children: [
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 15.0,
                              ),
                              child: TextFormField(
                                controller: textController,
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: 'Start Chat |',
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: 55.0,
                            color: kAppSecondColor,
                            child: MaterialButton(
                              onPressed: () {},
                              minWidth: 1.0,
                              child: Icon(
                                Icons.send,
                                size: 16.0,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  Widget buildMessage(context) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Row(
          children: [
            Container(
              width: MediaQuery.of(context).size.width * 0.6,
              decoration: BoxDecoration(
                color: kAppSecondColor,
                borderRadius: BorderRadiusDirectional.only(
                  bottomEnd: Radius.circular(
                    10.0,
                  ),
                  topStart: Radius.circular(
                    10.0,
                  ),
                  topEnd: Radius.circular(
                    10.0,
                  ),
                ),
              ),
              padding: EdgeInsets.symmetric(
                vertical: 5.0,
                horizontal: 10.0,
              ),
              child: Column(
                children: [
                  Text(
                    "بالتأكيد ، رقم الطلب من فضلك",
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      "4:03PM ",
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Image.asset(
              "assets/images/logo.png",
              width: 40,
            ),
          ],
        ),
      );
  Widget buildMyMessage(context) => Align(
        alignment: AlignmentDirectional.centerEnd,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.7,
          decoration: BoxDecoration(
            color: kGreyColor,
            borderRadius: BorderRadiusDirectional.only(
              bottomStart: Radius.circular(
                10.0,
              ),
              topStart: Radius.circular(
                10.0,
              ),
              topEnd: Radius.circular(
                10.0,
              ),
            ),
          ),
          padding: EdgeInsets.symmetric(
            vertical: 5.0,
            horizontal: 10.0,
          ),
          child: Column(
            children: [
              Text(
                "مرحبًا ، لدي مشكلة مع طلبي هل يمكنك المساعدة من فضلك",
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  "4:03PM ",
                ),
              ),
            ],
          ),
        ),
      );
}
