import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:se7a_7alalk/cubits/chat_cubit/chat_cubit.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';

import '../../cubits/chat_cubit/chat_states.dart';

class ChatDetailsScreen extends StatefulWidget {
  final int userId;

  const ChatDetailsScreen({Key key, this.userId}) : super(key: key);

  @override
  State<ChatDetailsScreen> createState() => _ChatDetailsScreenState();
}

class _ChatDetailsScreenState extends State<ChatDetailsScreen> {
  var textController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: GradientAppBar(
          title: "محادثة",
        ),
        body:Builder(
            builder: (context) {
              ChatCubit.get(context).getMessages(receiverId:widget.userId.toString());
              return BlocConsumer<ChatCubit, ChatStates>(
                listener: (context, state) {},
                builder: (context, state) {
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        Expanded(
                          child: ListView.separated(
                              itemBuilder: (context, index) {
                                if (CacheHelper.getData("userId").toString() ==
                                    ChatCubit.get(context)
                                        .messages[index]
                                        .senderId)
                                  return buildMyMessage(
                                      ChatCubit.get(context)
                                          .messages[index]);
                                return buildMessage(ChatCubit.get(context)
                                    .messages[index]);
                              },
                              separatorBuilder: (context, index) => SizedBox(
                                height: 15,
                              ),
                              itemCount:
                              ChatCubit.get(context).messages.length),
                        ),
                        Row(
                        children: [
                        // Icon(
                        // Icons.attach_file,
                        // size: 40,
                        // color: kAppSecondColor,
                        // ),
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
                  onPressed: () {
                    if(textController.text.isNotEmpty)
                    ChatCubit.get(context).sendMessage(receiverId: widget.userId.toString(), dateTime: DateTime.now().toString(), text: textController.text);
                    textController.clear();
                  },
                  minWidth: 1.0,
                  child: Icon(
                  Icons.send,
                  size: 16.0,
                  color: Colors.white,
                  ),
                  ),
                  ),
                  ],
                  ),),
                        )
                      ],
                    ),
                  ]
                  ));}
              );
  }));
  }
  Widget buildMessage(model) => Align(
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
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Text(
                   model.text,
                  ),
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(
                      model.dateTime.toString().substring(10,16),
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

  Widget buildMyMessage(model) => Align(
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                model.text,
              ),
              Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                    model.dateTime.toString().substring(10,16),
                ),
              ),
            ],
          ),
        ),
      );

}
