import 'package:flutter/material.dart';
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
            maxLines: maxLines,
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

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  int maxLines = 1;
  CustomTextField({this.controller, this.hintText, this.maxLines});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: TextField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(fontSize: 12, color: kScaffoldColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(color: kScaffoldColor)),
        ),
      ),
    );
  }
}

class CustomDropDownMenu extends StatelessWidget {
  final dynamic value;
  final String hintText;
  final Function onChange;
  final List<DropdownMenuItem> items;
  const CustomDropDownMenu(
      {this.value, this.hintText, this.onChange, this.items});

  @override
  Widget build(BuildContext context) {
    return InputDecorator(
      decoration: InputDecoration(
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(5)),
      ),
      child: DropdownButtonHideUnderline(
        child: Container(
          height: 50,
          child: DropdownButton(
              itemHeight: 50,
              value: value,
              isDense: true,
              hint: Text(
                hintText,
                style: TextStyle(fontSize: 12, color: kScaffoldColor),
              ),
              onChanged: onChange,
              items: items),
        ),
      ),
    );
  }
}
