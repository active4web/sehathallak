import 'dart:io';

import 'package:easy_localization/src/public_ext.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_states.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class SupportMessage extends StatelessWidget {
  static const String id = "/SupportMessage";
  final TextEditingController name =
      TextEditingController(text: CacheHelper.getData("userName"));
  final TextEditingController email =
      TextEditingController(text: CacheHelper.getData("userEmail"));
  final TextEditingController orderNumber = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController message = TextEditingController();
  File file;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "technicalSupport".tr(), context: context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CustomTextField(
              hintText: 'fullName'.tr(),
              controller: name,
            ),
            CustomTextField(
              hintText: 'emailAddress'.tr(),
              controller: email,
            ),
            CustomTextField(
              hintText: 'orderNumber'.tr(),
              controller: orderNumber,
            ),
            CustomTextField(
              hintText: 'subject'.tr(),
              controller: subject,
            ),
            CustomTextField(
              hintText: 'message'.tr(),
              maxLines: 4,
              controller: message,
            ),
            buildImageContainer(
                onPressed: () {
                  pickFile();
                },
                title: "attachFile".tr(),
                icon: Icons.attach_file),
            BlocConsumer<AppCubit, AppStates>(
              builder: (context, state) {
                return state is! SendSupportMessageLoadingState
                    ? Padding(
                        padding: const EdgeInsets.all(20),
                        child: customButton(
                          text: "addQuestion".tr(),
                          onPressed: () async {
                            if(CacheHelper.getData("apiToken") != "") {
                              var result = await AppCubit.get(context)
                                  .sendSupportMessage(
                                  email.text,
                                  name.text,
                                  orderNumber.text,
                                  subject.text,
                                  message.text,
                                  file);
                              showToast(text: result["msg"]);
                            }else{
                              showToast(text: "يجب تسجبل الدخول");
                            }

                          }
                        ),
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

  void pickFile() async {
    FilePickerResult result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = File(result.files.single.path);
      print(file);
      showToast(text: "تم الاختيار");
    } else {
      showToast(text: "تم الالغاء");
    }
  }
}
