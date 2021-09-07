import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/modules/screens/home_screen.dart';
import 'package:se7a_7alalk/shared/cubit/app_states.dart';

class AppCubit extends Cubit<AppStates>{
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  List<Widget> screens = [
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
    Scaffold(
      body: Center(child: Text('المزيد')),
    ),
  ];

  int selectedIndex = 0;
  void changeNavBar(int value) {
    selectedIndex = value;
    emit(ChangeNavBarState());
  }

}