import 'package:flutter/material.dart';
import 'package:se7a_7alalk/shared/components/custom_dropdown_menu.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class LapAnalysisAppointment extends StatelessWidget {
  static const String id = "lapAnalysisAppointment";
  final TextEditingController name = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController possessionNumber = TextEditingController();
  final String animalType = "";
  final String immunizationType = "";
  final TextEditingController animalsNumber = TextEditingController();
  final String country = "";
  final String serviceType = "";
  final TextEditingController surgeryTime = TextEditingController();
  final TextEditingController description = TextEditingController();
  final TextEditingController otherNotes = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: customAppBar(title: "طلب تحليل مخبري", context: context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            textFieldWithTitle(
                title: "الاسم",
                hintText: "يتم كتابة الاسم تلقائي في حالة الاشتراك المسبق ",
                controller: name),
            textFieldWithTitle(
                title: "رقم الموبيل",
                hintText: "يتم كتابة الموبيل تلقائي في حالة الاشتراك المسبق",
                controller: phoneNumber),
            textFieldWithTitle(
                title: "رقم البطاقة", hintText: "", controller: cardNumber),
            textFieldWithTitle(
                title: "رقم الحيازة",
                hintText: "رقم الحيازة",
                controller: possessionNumber),
            dropDownMenuWithTitle(
                hintText: "حدد",
                value: animalType,
                title: "نوع الحيوان / الطير ",
                items: [],
                onChanged: (value) {}),
            dropDownMenuWithTitle(
                hintText: "نوع التحليل المطلوب",
                value: immunizationType,
                title: "نوع التحليل المطلوب",
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
            ),
            textFieldWithTitle(
                title: "الموعد المناسب للتحليل",
                hintText: "الموعد المناسب للتحليل",
                suffixIcon: InkWell(
                    onTap: () {}, child: Icon(Icons.calendar_today_outlined)),
                controller: surgeryTime),
            textFieldWithTitle(
                title: "العنوان بالتفصيل",
                hintText: "العنوان بالتفصيل",
                controller: description),
            TextButton(
              onPressed: () {},
              child: Row(
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    color: kAppColor,
                  ),
                  Text(
                    "حدد العنوان على الخريطة",
                    style: TextStyle(color: kAppColor),
                  )
                ],
              ),
            ),
            textFieldWithTitle(
                title: "ملاحظات أخري",
                hintText: "الشكوي المرضية التي يعاني منها الحيوان",
                maxLines: 5,
                controller: otherNotes),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              child: customButton(text: "ارسال الطلب", onPressed: () {}),
            ),
          ],
        ),
      ),
    );
  }

  Widget textFieldWithTitle(
          {String title,
          String hintText,
          TextEditingController controller,
          int maxLines,
          Widget suffixIcon}) =>
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
            maxLines: maxLines,
            suffixIcon: suffixIcon,
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
          CustomDropDownMenu(
            hintText: hintText,
            value: value,
            items: items,
            onChange: onChanged,
          ),
        ],
      );
}
