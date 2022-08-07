import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_states.dart';
import 'package:se7a_7alalk/model/service_model.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/shared/components/custom_dropdown_menu.dart';
import 'package:se7a_7alalk/shared/components/custom_text_field.dart';
import 'package:se7a_7alalk/shared/components/location_screen.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

class SupervisionOfFarms extends StatelessWidget {
  final TextEditingController name =
  TextEditingController(text: CacheHelper.getData("userName"));
  final TextEditingController phoneNumber =
  TextEditingController(text: CacheHelper.getData("userPhone"));
  final TextEditingController cardNumber = TextEditingController();
  final TextEditingController accountNumber = TextEditingController(
      text: CacheHelper.getData("userAccountNumber").toString());
  int mainCategoryId;
  int subCategoryId;
  final TextEditingController animalsNumber = TextEditingController();
  int countryId;
  int regionId;
  double lat;
  double long;
  final TextEditingController surgeryTime = TextEditingController();
  final TextEditingController addressDetails =
  TextEditingController(text: CacheHelper.getData("userAddress"));
  final TextEditingController otherNotes = TextEditingController();
  List<SubCats> subCategory = [];
  List<Services> services = [];
  List<Clinics> clinics = [];
  @override
  Widget build(BuildContext context) {
    AppCubit cubit = AppCubit.get(context);
    cubit.mainCategory = null;
    cubit.subCategory = null;
    cubit.serviceId = null;
    cubit.regions = null;
    cubit.clinicId = null;
    cubit.animalType = null;
    return Scaffold(
      appBar: customAppBar(
          title:
              "خدمات جز الصوف / رش الثروة الحيوانية\n ومكافحة الحشرات الخارجية",
          context: context),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            textFieldWithTitle(
                title: "name".tr(),
                hintText: "يتم كتابة الاسم تلقائي في حالة الاشتراك المسبق ",
                controller: name),
            textFieldWithTitle(
                title: "phoneNumber".tr(),
                hintText: "يتم كتابة الموبيل تلقائي في حالة الاشتراك المسبق",
                controller: phoneNumber),
            textFieldWithTitle(
                title: "medicalCardNumber".tr(),
                hintText: "",
                controller: cardNumber),
            textFieldWithTitle(
                title: "appAccountNumber".tr(),
                hintText: "appAccountNumber".tr(),
                controller: accountNumber),
            BlocConsumer<AppCubit, AppStates>(
              builder: (context, state) {
                return AppCubit.get(context).animalsModel != null
                    ? dropDownMenuWithTitle(
                    hintText: "choose".tr(),
                    value: AppCubit.get(context).animalType,
                    title: "animalType".tr(),
                    items:
                    AppCubit.get(context).animalsModel.animals.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.name),
                        value: e.id,
                      );
                    }).toList(),
                    onChanged: (value) {
                      AppCubit.get(context).setAnimalTypeValue(value);
                    })
                    : null;
              },
              listener: (context, state) {},
            ),
            BlocConsumer<AppCubit, AppStates>(
              builder: (context, state) {
                return cubit.servicesModel != null
                    ? dropDownMenuWithTitle(
                    hintText: "selectMainCategory".tr(),
                    value: cubit.mainCategory,
                    title: "selectMainCategory".tr(),
                    items: cubit.servicesModel.data.cat.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.name),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (value) {
                      mainCategoryId = value.id;
                      subCategory.clear();
                      services.clear();
                      value.subCats.forEach((element) {
                        subCategory.add(element);
                      });
                      cubit.setMainCategoryValue(value);
                    })
                    : SizedBox();
              },
              listener: (context, state) {},
            ),
            BlocConsumer<AppCubit, AppStates>(
              builder: (context, state) {
                return dropDownMenuWithTitle(
                    hintText: "selectSubCategory".tr(),
                    value: cubit.subCategory,
                    title: "selectSubCategory".tr(),
                    items: subCategory.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.name),
                        value: e,
                      );
                    }).toList(),
                    onChanged: (value) {
                      subCategoryId = value.id;
                      services.clear();
                      value.services.forEach((element) {
                        services.add(element);
                      });
                      cubit.setSubCategoryValue(value: value);
                    });
              },
              listener: (context, state) {},
            ),
            BlocConsumer<AppCubit, AppStates>(
              builder: (context, state) {
                return dropDownMenuWithTitle(
                    hintText: "serviceType".tr(),
                    value: cubit.serviceId,
                    title: "serviceType".tr(),
                    items: services.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.name),
                        value: e.id,
                      );
                    }).toList(),
                    onChanged: (value) {
                      cubit.setServiceValue(value);
                    });
              },
              listener: (context, state) {},
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
                BlocConsumer<AppCubit, AppStates>(
                  builder: (context, state) {
                    return cubit.servicesModel != null
                        ? Expanded(
                      child: dropDownMenuWithTitle(
                          hintText: "City/Emirate".tr(),
                          value: cubit.regions,
                          title: "",
                          items:
                          cubit.servicesModel.data.regions.map((e) {
                            return DropdownMenuItem(
                              child: Text(e.name),
                              value: e,
                            );
                          }).toList(),
                          onChanged: (value) {
                            regionId = value.id;
                            clinics.clear();
                            value.clinics.forEach((element) {
                              clinics.add(element);
                            });
                            cubit.setRegionValue(value: value);
                          }),
                    )
                        : SizedBox();
                  },
                  listener: (context, state) {},
                )
              ],
            ),
            BlocConsumer<AppCubit, AppStates>(
              builder: (context, state) {
                return dropDownMenuWithTitle(
                    hintText: "clinic".tr(),
                    value: cubit.clinicId,
                    title: "clinic".tr(),
                    items: clinics.map((e) {
                      return DropdownMenuItem(
                        child: Text(e.name),
                        value: e.id,
                      );
                    }).toList(),
                    onChanged: (value) {
                      cubit.setClinicValue(value);
                    });
              },
              listener: (context, state) {},
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
                controller: addressDetails),
            TextButton(
              onPressed: () async {
                final result =
                await navigateTo(context: context, page: LocationScreen());
                addressDetails.text = result["address"];
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
            BlocConsumer<AppCubit, AppStates>(
              builder: (context, state) {
                if (state is! SetServiceLoadingState) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 30),
                    child: customButton(
                        text: "sendRequest".tr(),
                        onPressed: () async {
                          var result = await cubit.setService(
                              name: name.text,
                              address: addressDetails.text,
                              long: long,
                              lat: lat,
                              accountNumber: accountNumber.text,
                              categoryId: mainCategoryId,
                              clinicId: cubit.clinicId,
                              animalId: cubit.animalType,
                              animalNumber: animalsNumber.text,
                              describe: otherNotes.text,
                              regionsId: regionId,
                              serviceId: cubit.serviceId,
                              subCategoryId: subCategoryId,
                              time: surgeryTime.text,
                              countryId: CacheHelper.getData("userCountryId"),
                              phone: phoneNumber.text);
                          showToast(text: result["msg"]);
                        }),
                  );
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
              listener: (context, state) {},
            )
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
