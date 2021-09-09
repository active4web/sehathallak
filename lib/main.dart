import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:se7a_7alalk/modules/user/onboarding_screen.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/networks/remote/dio_helper.dart';
import 'package:se7a_7alalk/shared/components/app_routes.dart';
import 'package:se7a_7alalk/shared/cubit/app_cubit.dart';

import 'modules/user/customer_support.dart';

void main() async {
  runApp(MyApp());
  DioHelper.init();
  await CacheHelper.init();
  bool showOnBoard = CacheHelper.getData("onBoarding") ?? false;
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: MaterialApp(
        initialRoute: OnBoardingScreen.id,
        routes: routes,
        title: 'Seha Hlalk',
        debugShowCheckedModeBanner: false,
        localizationsDelegates: [
          AppLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('en', ''),
          const Locale('ar', ''),
        ],
        // onGenerateTitle: (context) {
        //   return AppLocalizations.of(context).appTitle;
        // },
        theme: ThemeData(
            primarySwatch: Colors.blue,
            scaffoldBackgroundColor: Color(0xffF9F9F9),
            fontFamily: 'Cairo'),
        builder: (context, child) {
          print(AppLocalizations.of(context).appTitle);
          return Directionality(textDirection: TextDirection.rtl, child: child);
        },
      ),
    );
  }
}
