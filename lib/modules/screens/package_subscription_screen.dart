import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/screens/package_payment.dart';
import 'package:se7a_7alalk/shared/components/custom_dropdown_menu.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class PackageSubscription extends StatelessWidget {
  static const String id = "PackageSubscription";
  final TextEditingController farmName = TextEditingController();
  final TextEditingController phoneNumber = TextEditingController();
  final TextEditingController accountNumber = TextEditingController();
  final String animalType = "";
  final TextEditingController animalsNumber = TextEditingController();
  final String country = "";
  final String packageSubscription = "";
  final TextEditingController otherNotes = TextEditingController();
  final TextEditingController surgeryTime = TextEditingController();
  final TextEditingController description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "الاشتراك بالباقات",
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          Text(
            " نبذة عن الخدمة والمزايا التي سيتم تقديمها",
            style: TextStyle(
                color: kAppColor, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Container(
              height: 80,
              child: ListView.separated(
                itemBuilder: (context, index) => buildItem(),
                separatorBuilder: (context, index) => SizedBox(
                  width: 10,
                ),
                itemCount: 5,
                scrollDirection: Axis.horizontal,
              )),
          Text(
            "الباقة الشهرية",
            style: TextStyle(
                color: kAppColor, fontSize: 15, fontWeight: FontWeight.bold),
          ),
          Text(
            "هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التى يولدها التطبيق",
            style: TextStyle(
              fontSize: 15,
            ),
          ),
          Text(
            "الاشتراك بالباقة",
            style: TextStyle(
                color: kAppColor, fontSize: 15, fontWeight: FontWeight.bold),
          ),
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
          ),
          dropDownMenuWithTitle(
              hintText: "شهري",
              value: packageSubscription,
              title: "الباقة المراد الاشتراك فيها ",
              items: [],
              onChanged: (value) {}),
          textFieldWithTitle(
              title: "الموعد المناسب للكشف",
              hintText: "الموعد المناسب للكشف",
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
            child: customButton(
                text: "اتمام عمليه الدفع",
                onPressed: () {
                  navigateTo(context: context, page: PackagePaymentScreen.id);
                }),
          ),
        ],
      ),
    );
  }

  Widget buildItem() => IntrinsicHeight(
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
              color: Colors.red.shade600,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Text("باقة شهرية"),
              Text(
                "5000 ريال",
                style: TextStyle(
                    color: kAppColor,
                    fontSize: 15,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      );

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
