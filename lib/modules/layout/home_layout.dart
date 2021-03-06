import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/shared/cubit/app_cubit.dart';
import 'package:se7a_7alalk/shared/cubit/app_states.dart';

class HomeLayout extends StatelessWidget {
  static const String id = "homeLayout";
  HomeLayout({this.selectedIndex});
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppStates>(
        listener: (context, AppStates state) {},
        builder: (context, AppStates state) {
          AppCubit cubit = AppCubit.get(context);
          return Scaffold(
            body: IndexedStack(
              children: cubit.homeScreens,
              index: cubit.selectedHomeIndex,
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
                    currentIndex: cubit.selectedHomeIndex,
                    type: BottomNavigationBarType.fixed,
                    onTap: (value) {
                      cubit.changeHomeNavBar(value);
                    },
                    elevation: 30,
                    unselectedFontSize: 13,
                    selectedFontSize: 13,
                    items: [
                      BottomNavigationBarItem(
                        icon: Icon(Icons.home_filled),
                        label: "NavigatorHome".tr(),
                      ),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.healing),
                          label: 'NavigatorImmunization'.tr()),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.volunteer_activism),
                          label: 'NavigatorMedicine'.tr()),
                      BottomNavigationBarItem(
                          icon: Icon(Icons.medical_services),
                          label: 'NavigatorServices'.tr()),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.access_time),
                        label: 'NavigatorClinicBooking'.tr(),
                      ),
                      BottomNavigationBarItem(
                        icon: Icon(Icons.menu),
                        label: 'NavigatorMore'.tr(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          );
        });
  }
}
