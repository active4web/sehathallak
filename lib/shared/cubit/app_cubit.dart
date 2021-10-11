import 'package:bloc/bloc.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/modules/layout/doctor_layout/chat_screen.dart';
import 'package:se7a_7alalk/modules/layout/doctor_layout/order_screen.dart';
import 'package:se7a_7alalk/modules/layout/layout_screens/home_screen.dart';
import 'package:se7a_7alalk/modules/layout/layout_screens/more_screen.dart';
import 'package:se7a_7alalk/modules/user/profile_screen.dart';
import 'package:se7a_7alalk/shared/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> homeScreens = [
    HomeScreen(),
    Scaffold(
      body: Center(child: Text('تحصين')),
    ),
    Scaffold(
      body: Center(child: Text('أدوية')),
    ),
    Scaffold(
      body: Center(child: Text('خدمات')),
    ),
    Scaffold(
      body: Center(child: Text('حجز عيادات')),
    ),
    MoreScreen()
  ];

  List<Widget> doctorScreens = [
    ChatsScreen(),
    DoctorOrdersScreen(),
    ProfileScreen(),
  ];
  int selectedHomeIndex = 0;
  void changeHomeNavBar(int value) {
    selectedHomeIndex = value;
    if (value == 4) {}
    emit(ChangeNavBarState());
  }

  int selectedDoctorIndex = 0;
  void changeDoctorNavBar(int value) {
    selectedDoctorIndex = value;
    if (value == 4) {}
    emit(ChangeNavBarState());
  }

  String language = "ar";
  void changeLanguage(BuildContext context, {value}) {
    language = value;
    EasyLocalization.of(context).setLocale(Locale(value));
    emit(ChangeLanguageState());
  }
}
