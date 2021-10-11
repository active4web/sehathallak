import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class SupportMessage extends StatelessWidget {
  static const String id = "SupportMessage";
  final TextEditingController name = TextEditingController();
  final TextEditingController email = TextEditingController();
  final TextEditingController offerNumber = TextEditingController();
  final TextEditingController subject = TextEditingController();
  final TextEditingController message = TextEditingController();
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
              controller: offerNumber,
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
                onPressed: () {},
                title: "attachFile".tr(),
                icon: Icons.attach_file),
            Padding(
              padding: const EdgeInsets.all(20),
              child: customButton(
                text: "addAReview".tr(),
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
