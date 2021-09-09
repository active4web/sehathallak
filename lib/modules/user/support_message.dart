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
      appBar: customAppBar(title: "الدعم الفني", context: context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            CustomTextField(
              hintText: 'الاسم الكامل',
              controller: name,
            ),
            CustomTextField(
              hintText: 'البريد الالكتروني',
              controller: email,
            ),
            CustomTextField(
              hintText: 'رقم الطلب',
              controller: offerNumber,
            ),
            CustomTextField(
              hintText: 'موضوع',
              controller: subject,
            ),
            CustomTextField(
              hintText: 'رسالة',
              maxLines: 4,
              controller: message,
            ),
            buildImageContainer(
                onPressed: () {},
                title: "ارفاق ملفات",
                icon: Icons.attach_file),
            Padding(
              padding: const EdgeInsets.all(20),
              child: customButton(
                text: "اضف تقييمك",
                onPressed: () {},
              ),
            )
          ],
        ),
      ),
    );
  }
}
