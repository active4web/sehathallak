import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:se7a_7alalk/cubits/cart_cubit/cart_cubit.dart';
import 'package:se7a_7alalk/cubits/chat_cubit/chat_cubit.dart';
import 'package:se7a_7alalk/cubits/doctor_cubit/doctor_cubit.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/modules/layout/doctor_layout.dart';
import 'package:se7a_7alalk/modules/layout/home_layout.dart';
import 'package:se7a_7alalk/modules/user/onboarding_screen.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/networks/remote/dio_helper.dart';
import 'package:se7a_7alalk/shared/constants.dart';
import 'package:se7a_7alalk/shared/widgets/bloc_observer.dart';
import 'cubits/auth_cubit/auth_cubit.dart';
import 'cubits/clinic_cubit/clinic_cubit.dart';
import 'cubits/service_cubit/service_cubit.dart';
import 'cubits/store_cubit/store_cubit.dart';
import 'modules/auth_screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  Bloc.observer = MyBlocObserver();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool showOnBoard = CacheHelper.getData("onBoard") ?? false;
  String googleToken = CacheHelper.getData("googleToken") ?? "";
  String apiToken = CacheHelper.getData("apiToken") ?? "";
  Widget mainScreen;
  if (showOnBoard) {
    if (googleToken != "" || apiToken != "") {
      mainScreen = CacheHelper.getData("userType") == "user"
          ? HomeLayout()
          : DoctorLayout();
    } else {
      mainScreen = AuthScreen();
    }
  } else {
    mainScreen = OnBoardingScreen();
  }
  runApp(EasyLocalization(
    path: "assets/language",
    saveLocale: true,
    startLocale: Locale(
      'ar',
    ),
    fallbackLocale: Locale(
      'en',
    ),
    supportedLocales: [
      const Locale('en', ''),
      const Locale('ar', ''),
    ],
    child: Phoenix(
      child: MyApp(
        mainScreen: mainScreen,
      ),
    ),
  ));
}

class MyApp extends StatelessWidget {
  Widget mainScreen;
  MyApp({this.mainScreen});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AuthCubit()..fetchData(),
        ),
        BlocProvider(create: (context) => AppCubit()..fetchData()),
        BlocProvider(create: (context) => ClinicCubit()),
        BlocProvider(create: (context) => ChatCubit()),
        BlocProvider(create: (context) => StoreCubit()..getPackageTypes()),
        BlocProvider(create: (context) => CartCubit()),
        BlocProvider(create: (context) => DoctorCubit()),
        BlocProvider(create: (context) => ServicesCubit()),
      ],
      child: MaterialApp(
        home: mainScreen,
        title: 'Seha Hlalk',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color(0xffd8f1ff),
            fontFamily: 'Cairo'),
      ),
    );
  }
}
