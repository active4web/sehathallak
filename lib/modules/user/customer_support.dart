import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/model/q_and_a_model.dart';
import 'package:se7a_7alalk/modules/user/support_message.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class CustomerSupport extends StatelessWidget {
  static const String id = "/CustomerSupport";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: customAppBar(title: "customerSupport".tr(), context: context),
        body: FutureBuilder<QAndAModel>(
          future: AppCubit.get(context).getAllSupportQuestions(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: customButton(
                          text: "addQuestion".tr(),
                          onPressed: () {
                            navigateTo(
                                context: context, page: SupportMessage());
                          },
                        ),
                      ),
                      Expanded(
                        child: ListView.separated(
                            itemBuilder: (context, index) {
                              if (snapshot.data.faqs.length > 0) {
                                return buildExpansionTile(
                                    snapshot: snapshot, index: index);
                              } else {
                                return Center(
                                  child: Text("noQuestions".tr()),
                                );
                              }
                            },
                            separatorBuilder: (context, index) => SizedBox(
                                  height: 10,
                                ),
                            itemCount: snapshot.data.faqs.length),
                      )
                    ],
                  ));
            } else if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              return Center(child: Text("noInternetConnection".tr()));
            }
          },
        ));
  }

  StatefulBuilder buildExpansionTile(
      {AsyncSnapshot<QAndAModel> snapshot, index}) {
    return StatefulBuilder(
      builder: (context, setState) => ExpansionTile(
        title: Text(
          snapshot.data.faqs[index].question,
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
        ),
        children: [Text(snapshot.data.faqs[index].answer)],
      ),
    );
  }
}
