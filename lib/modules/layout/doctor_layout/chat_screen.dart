import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/modules/screens/chat_details.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class ChatsScreen extends StatelessWidget {
  static const String id = "ChatsScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "conversation".tr(),
        canNavigate: false,
      ),
      body: ListView.separated(
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) => buildChatItem(context),
          separatorBuilder: (context, index) =>
              Divider(color: Colors.grey[300]),
          itemCount: 10),
    );
  }

  Widget buildChatItem(context) => InkWell(
        onTap: () {
          navigateTo(context: context, page: ChatDetailsScreen.id);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Row(
            children: [
              CircleAvatar(
                radius: 25.0,
                // backgroundImage: NetworkImage("${model.image}"),
                backgroundColor: kAppColor,
              ),
              SizedBox(
                width: 15.0,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'خالد الدوسري',
                          style: TextStyle(
                            height: 1.4,
                          ),
                        ),
                        Text(
                          '12:19',
                          style: TextStyle(
                            height: 1.4,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'السلام عليكم',
                          style: TextStyle(height: 1.4, color: kGreyColor),
                        ),
                        Container(
                          height: 25,
                          width: 25,
                          decoration: BoxDecoration(
                              color: Colors.red.shade400,
                              shape: BoxShape.circle),
                          child: Center(
                              child: Text(
                            "2",
                            style: TextStyle(color: Colors.white),
                          )),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
