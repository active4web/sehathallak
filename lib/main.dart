import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/modules/layout/home_layout.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/networks/remote/dio_helper.dart';
import 'package:se7a_7alalk/shared/components/app_routes.dart';
import 'package:se7a_7alalk/shared/cubit/app_cubit.dart';

import 'modules/layout/doctor_layout.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  DioHelper.init();
  await CacheHelper.init();
  bool showOnBoard = CacheHelper.getData("onBoarding") ?? false;
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
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: MaterialApp(
        initialRoute: HomeLayout.id,
        routes: routes,
        title: 'Seha Hlalk',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color(0xffF9F9F9),
            fontFamily: 'Cairo'),
        // builder: (context, child) {
        //   return Directionality(textDirection: TextDirection.rtl, child: child);
        // },
      ),
    );
  }
}
