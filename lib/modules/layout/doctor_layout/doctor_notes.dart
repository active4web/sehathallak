import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class DoctorsNotesScreen extends StatelessWidget {
  static const String id = "DoctorsNotesScreen";
  var notesController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "doctorNotes".tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("addNote".tr()),
            CustomTextField(
              maxLines: 5,
              controller: notesController,
              hintText: "writeYourCommentsAboutTheSituation".tr(),
            ),
            SizedBox(
              height: 10,
            ),
            customButton(text: "addMedicine".tr(), onPressed: () {}),
            SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                border: Border.all(color: kAppColor),
              ),
              child: Center(
                child: Text(
                  "addRecommendedProducts".tr(),
                  style: TextStyle(color: kAppColor),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            customButton(text: "save".tr(), onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
