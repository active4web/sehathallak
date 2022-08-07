import 'dart:math';

import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/model/packageTypesModel.dart';
import 'package:se7a_7alalk/modules/screens/package_payment.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/shared/components/custom_dropdown_menu.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:se7a_7alalk/shared/components/gradient_app_bar.dart';
import 'package:se7a_7alalk/shared/components/location_screen.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class PackageSubscription extends StatefulWidget {
  final List<Packages> packages ;
  const PackageSubscription({Key key, this.packages}) : super(key: key);

  @override
  State<PackageSubscription> createState() => _PackageSubscriptionState();
}

class _PackageSubscriptionState extends State<PackageSubscription> {
  final TextEditingController farmName =
      TextEditingController(text: CacheHelper.getData("userName"));

  final TextEditingController phoneNumber =
      TextEditingController(text: CacheHelper.getData("userPhone"));

  final TextEditingController accountNumber = TextEditingController(
      text: CacheHelper.getData("userAccountNumber").toString());

  int animalType;

  final TextEditingController animalsNumber = TextEditingController();

  int region;

  int packageSubscription;

  final TextEditingController otherNotes = TextEditingController();

  final TextEditingController surgeryTime = TextEditingController();

  final TextEditingController address =
      TextEditingController(text: CacheHelper.getData("userAddress"));
  int currentIndex = 0;
  double lat = 0;
  double long = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        title: "subscribeToPackages".tr(),
      ),
      body: ListView(
        padding: EdgeInsets.all(10),
        children: [
          textFieldWithTitle(
              title: "farmOwnerName".tr(),
              hintText: "يتم كتابة الاسم تلقائي في حالة الاشتراك المسبق ",
              controller: farmName),
          textFieldWithTitle(
              title: "phoneNumber".tr(),
              hintText: "يتم كتابة الموبيل تلقائي في حالة الاشتراك المسبق",
              controller: phoneNumber),
          textFieldWithTitle(
              title: "appAccountNumber".tr(),
              hintText: "يتم كتابة رقم الحساب تلقائي في حالة الاشتراك المسبق",
              controller: accountNumber),
          StatefulBuilder(
            builder: (context, setState) {
              return dropDownMenuWithTitle(
                  hintText: "choose".tr(),
                  value: animalType,
                  title: "animalType".tr(),
                  items: AppCubit.get(context).animalsModel.animals.map((e) {
                    return DropdownMenuItem(
                      child: Text(e.name),
                      value: e.id,
                    );
                  }).toList(),
                  onChanged: (value) {
                    animalType = value;
                    setState(() {});
                  });
            },
          ),
          Row(
            children: [
              Expanded(
                child: textFieldWithTitle(
                    title: "animalsNumber".tr(),
                    hintText: "addNumber".tr(),
                    controller: animalsNumber),
              ),
              SizedBox(
                width: 10,
              ),
              StatefulBuilder(
                builder: (context, setState) {
                  return Expanded(
                    child: dropDownMenuWithTitle(
                        hintText: "City/Emirate".tr(),
                        value: region,
                        title: "",
                        items:
                            AppCubit.get(context).regionsModel.regions.map((e) {
                          return DropdownMenuItem(
                            child: Text(e.name),
                            value: e.id,
                          );
                        }).toList(),
                        onChanged: (value) {
                          region = value;
                          setState(() {});
                        }),
                  );
                },
              )
            ],
          ),
          StatefulBuilder(
            builder: (context, setState) {
              return dropDownMenuWithTitle(
                  hintText: "monthly".tr(),
                  value: packageSubscription,
                  title: "thePackageYouWantToSubscribeTo".tr(),
                  items: widget.packages.map((e) {
                    return DropdownMenuItem(child: Text(e.name), value: e.id);
                  }).toList(),
                  onChanged: (value) {
                    packageSubscription = value;
                    print(packageSubscription);
                    setState(() {});
                  });
            },
          ),
          textFieldWithTitle(
              title: "theAppropriateTimeForDetection".tr(),
              hintText: "theAppropriateTimeForDetection".tr(),
              suffixIcon: InkWell(
                  onTap: () {
                    showDatePicker(
                            context: context,
                            initialDate: DateTime.now(),
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2050))
                        .then((value) {
                      if (value.toString().isNotEmpty) {
                        surgeryTime.text = value.toString().substring(0, 10);
                      } else {
                        surgeryTime.text = "";
                      }
                    });
                  },
                  child: Icon(Icons.calendar_today_outlined)),
              controller: surgeryTime),
          textFieldWithTitle(
              title: "addressInDetails".tr(),
              hintText: "addressInDetails".tr(),
              controller: address),
          TextButton(
            onPressed: () async {
              final result =
                  await navigateTo(context: context, page: LocationScreen());
              address.text = result["address"];
              lat = result["lat"];
              long = result["long"];
            },
            child: Row(
              children: [
                Icon(
                  Icons.location_on_outlined,
                  color: kAppColor,
                ),
                Text(
                  "showInMap".tr(),
                  style: TextStyle(color: kAppColor),
                )
              ],
            ),
          ),
          textFieldWithTitle(
              title: "otherNotes".tr(),
              hintText: "diseaseComplaintsSufferedByTheAnimal".tr(),
              maxLines: 5,
              controller: otherNotes),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
            child: customButton(
                text: "completePayment".tr(),
                onPressed: () {
                  navigateTo(
                      context: context,
                      page: PackagePaymentScreen(packageId: packageSubscription, packagePrice: widget
                          .packages[currentIndex]
                          .price,),);
                }),
          ),
        ],
      ),
    );
  }

  Widget buildItem(context, int index) => IntrinsicHeight(
        child: Container(
          width: 80,
          height: 60,
          decoration: BoxDecoration(
              color: kAppSecondColor.withOpacity(0.5),
              border: currentIndex == index
                  ? Border.all(color: Colors.black, width: 2)
                  : null,
              borderRadius: BorderRadius.circular(10)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(AppCubit.get(context).packagesModel.packages[index].name),
              Text(
                AppCubit.get(context)
                    .packagesModel
                    .packages[index]
                    .price
                    .toString(),
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
