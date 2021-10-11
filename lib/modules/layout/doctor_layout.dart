import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/cubit/app_cubit.dart';
import 'package:se7a_7alalk/shared/cubit/app_states.dart';

class DoctorLayout extends StatelessWidget {
  static const String id = "DoctorLayout";
  DoctorLayout({this.selectedIndex});
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, AppStates state) {},
        builder: (context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: IndexedStack(
              children: cubit.doctorScreens,
              index: cubit.selectedDoctorIndex,
            ),
            bottomNavigationBar: Container(
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black12,
                    blurRadius: 5,
                  ),
                ],
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(16.0),
                  topRight: Radius.circular(16.0),
                ),
                child: Container(
                  height: 70,
                  child: BottomNavigationBar(
                    backgroundColor: Colors.white,
                    currentIndex: cubit.selectedDoctorIndex,
                    type: BottomNavigationBarType.fixed,
                    selectedIconTheme: IconThemeData(color: kAppSecondColor),
                    selectedItemColor: kAppSecondColor,
                    onTap: (value) {
                      cubit.changeDoctorNavBar(value);
                    },
                    elevation: 30,
                    unselectedFontSize: 13,
                    selectedFontSize: 13,
                    items: [
                      BottomNavigationBarItem(
                        icon: Image.asset("assets/images/chat.png"),
                        label: "TalksAndConsultations".tr(),
                      ),
                      BottomNavigationBarItem(
                          icon: Image.asset("assets/images/order.png"),
                          label: 'Orders'.tr()),
                      BottomNavigationBarItem(
                          icon: Image.asset("assets/images/user.png"),
                          label: 'Profile'.tr()),
                      BottomNavigationBarItem(
                          icon: Image.asset("assets/images/exit.png"),
                          label: 'Exit'.tr()),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
