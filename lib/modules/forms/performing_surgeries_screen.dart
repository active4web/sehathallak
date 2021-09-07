import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/custom_dropdown_menu.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class PerformSurgery extends StatelessWidget {
  static const String id = "performSurgery";
  @override
  Widget build(BuildContext context) {
    TextEditingController farmName = TextEditingController();
    TextEditingController phoneNumber = TextEditingController();
    TextEditingController accountNumber = TextEditingController();
    String animalType;
    TextEditingController animalsNumber = TextEditingController();
    String country;
    TextEditingController surgeryType = TextEditingController();
    TextEditingController surgeryTime = TextEditingController();
    TextEditingController description = TextEditingController();
    TextEditingController examinationPurpose = TextEditingController();
    TextEditingController otherNotes = TextEditingController();
    return Scaffold(
      appBar: customAppBar(title: "اجراء العمليات الجراحية "),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            textFieldWithTitle(
                title: "اسم صاحب المزرعة",
                hintText: "يتم كتابة الاسم تلقائي في حالة الاشتراك المسبق ",
                controller: farmName),
            textFieldWithTitle(
                title: "رقم الموبيل",
                hintText: "يتم كتابة الموبيل تلقائي في حالة الاشتراك المسبق",
                controller: phoneNumber),
            textFieldWithTitle(
                title: "رقم  حساب صحة حلالك",
                hintText: "يتم كتابة رقم الحساب تلقائي في حالة الاشتراك المسبق",
                controller: accountNumber),
            dropDownMenuWithTitle(
                hintText: "حدد",
                value: animalType,
                title: "نوع الحيوان / الطير ",
                items: [],
                onChanged: (value) {}),
            Row(
              children: [
                Expanded(
                  child: textFieldWithTitle(
                      title: "عدد الحيوانات ",
                      hintText: "اضف العدد",
                      controller: animalsNumber),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: dropDownMenuWithTitle(
                      hintText: "المدينة/ الامارة",
                      value: country,
                      title: "",
                      items: [],
                      onChanged: (value) {}),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget textFieldWithTitle({
    String title,
    String hintText,
    TextEditingController controller,
    int maxLines,
  }) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          CustomTextField(
            controller: controller,
            hintText: hintText,
            minLines: maxLines,
          )
        ],
      );

  Widget dropDownMenuWithTitle(
          {dynamic value,
          String hintText,
          Function onChanged,
          List<DropdownMenuItem> items,
          String title}) =>
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Container(
            height: 50,
            child: CustomDropDownMenu(
              hintText: hintText,
              value: value,
              items: items,
              onChange: onChanged,
            ),
          ),
        ],
      );
}



