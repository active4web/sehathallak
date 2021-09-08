import 'package:flutter/material.dart';
import 'package:se7a_7alalk/modules/forms/Book_a_vaccination_appointment_screen.dart';
import 'package:se7a_7alalk/modules/forms/book_appointment_screen.dart';
import 'package:se7a_7alalk/modules/forms/emergency_booking_screen.dart';
import 'package:se7a_7alalk/modules/forms/home_visit_screen.dart';
import 'package:se7a_7alalk/modules/forms/lab_analysis_appointment_screen.dart';
import 'package:se7a_7alalk/modules/forms/performing_surgeries_screen.dart';
import 'package:se7a_7alalk/modules/forms/request_treatment.dart';
import 'package:se7a_7alalk/modules/forms/supervision_of_farms.dart';
import 'package:se7a_7alalk/modules/forms/wool_shearing_services_screen.dart';
import 'package:se7a_7alalk/modules/layout/home_layout.dart';
import 'package:se7a_7alalk/modules/screens/add_review_screen.dart';
import 'package:se7a_7alalk/modules/screens/about_app.dart';
import 'package:se7a_7alalk/modules/screens/rewards_screen.dart';
import 'package:se7a_7alalk/modules/user/change_password_screen.dart';
import 'package:se7a_7alalk/modules/user/countries_screen.dart';
import 'package:se7a_7alalk/modules/user/login_screen.dart';
import 'package:se7a_7alalk/modules/user/more_screen.dart';
import 'package:se7a_7alalk/modules/user/onboarding_screen.dart';
import 'package:se7a_7alalk/modules/user/profile_screen.dart';
import 'package:se7a_7alalk/modules/user/register_screen.dart';
import 'package:se7a_7alalk/modules/user/settings_screen.dart';

Map<String, Widget Function(BuildContext)> routes = {
  LoginScreen.id: (context) => LoginScreen(),
  RegisterScreen.id: (context) => RegisterScreen(),
  HomeLayout.id: (context) => HomeLayout(),
  OnBoardingScreen.id: (context) => OnBoardingScreen(),
  ProfileScreen.id: (context) => ProfileScreen(),
  SettingsScreen.id: (context) => SettingsScreen(),
  ChangePasswordScreen.id: (context) => ChangePasswordScreen(),
  CountriesScreen.id: (context) => CountriesScreen(),
  PerformSurgery.id: (context) => PerformSurgery(),
  WoolShearingServices.id: (context) => WoolShearingServices(),
  SupervisionOfFarms.id: (context) => SupervisionOfFarms(),
  HomeVisit.id: (context) => HomeVisit(),
  AppointmentBooking.id: (context) => AppointmentBooking(),
  LapAnalysisAppointment.id: (context) => LapAnalysisAppointment(),
  EmergencyBooking.id: (context) => EmergencyBooking(),
  RequestTreatment.id: (context) => RequestTreatment(),
  VaccinationAppointmentBooking.id: (context) =>
      VaccinationAppointmentBooking(),
  AboutAppScreen.id: (context) => AboutAppScreen(),
  RewardsScreen.id: (context) => RewardsScreen(),
  AddReviewScreen.id: (context) => AddReviewScreen(),
  MoreScreen.id: (context) => MoreScreen(),
};
