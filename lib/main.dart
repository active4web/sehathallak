import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:se7a_7alalk/modules/layout/home_layout.dart';
import 'package:se7a_7alalk/modules/screens/add_review_screen.dart';
import 'package:se7a_7alalk/modules/screens/home_screen.dart';
import 'package:se7a_7alalk/modules/screens/rewards_screen.dart';
import 'package:se7a_7alalk/modules/user/countries_screen.dart';
import 'package:se7a_7alalk/shared/cubit/app_cubit.dart';
import 'modules/forms/performing_surgeries_screen.dart';
import 'modules/user/change_password_screen.dart';
import 'modules/user/login_screen.dart';
import 'modules/user/onboarding_screen.dart';
import 'modules/user/profile_screen.dart';
import 'modules/user/register_screen.dart';
import 'modules/user/settings_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AppCubit()),
      ],
      child: MaterialApp(
        initialRoute: AddReviewScreen.id,
        routes: {
          LoginScreen.id: (context) => LoginScreen(),
          RegisterScreen.id: (context) => RegisterScreen(),
          HomeLayout.id: (context) => HomeLayout(),
          OnBoardingScreen.id: (context) => OnBoardingScreen(),
          ProfileScreen.id: (context) => ProfileScreen(),
          SettingsScreen.id: (context) => SettingsScreen(),
          ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
          CountriesScreen.id: (context) => CountriesScreen(),
          PerformSurgery.id: (context) => PerformSurgery(),
          HomeScreen.id: (context) => HomeScreen(),
          RewardsScreen.id:(context) => RewardsScreen(),
          AddReviewScreen.id: (context) => AddReviewScreen(),
        },
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          scaffoldBackgroundColor: Color(0xffF9F9F9),
          fontFamily: 'Cairo'
        ),
        builder: (context, child) {
          return Directionality(textDirection: TextDirection.rtl, child: child);
        },
      ),
    );
  }
}
