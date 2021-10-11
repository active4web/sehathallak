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
import 'package:se7a_7alalk/modules/layout/doctor_layout.dart';
import 'package:se7a_7alalk/modules/layout/doctor_layout/chat_screen.dart';
import 'package:se7a_7alalk/modules/layout/doctor_layout/doctor_notes.dart';
import 'package:se7a_7alalk/modules/layout/doctor_layout/order_screen.dart';
import 'package:se7a_7alalk/modules/layout/home_layout.dart';
import 'package:se7a_7alalk/modules/layout/layout_screens/home_screen.dart';
import 'package:se7a_7alalk/modules/screens/add_review_screen.dart';
import 'package:se7a_7alalk/modules/screens/cart_screen.dart';
import 'package:se7a_7alalk/modules/screens/chat_details.dart';
import 'package:se7a_7alalk/modules/screens/chat_payment.dart';
import 'package:se7a_7alalk/modules/screens/clinic_details.dart';
import 'package:se7a_7alalk/modules/screens/clinics.dart';
import 'package:se7a_7alalk/modules/screens/completed_order.dart';
import 'package:se7a_7alalk/modules/screens/doctor_notes_screen.dart';
import 'package:se7a_7alalk/modules/screens/home_visit_services.dart';
import 'package:se7a_7alalk/modules/screens/order_details.dart';
import 'package:se7a_7alalk/modules/screens/package_payment.dart';
import 'package:se7a_7alalk/modules/screens/package_subscription_screen.dart';
import 'package:se7a_7alalk/modules/screens/payment_screen.dart';
import 'package:se7a_7alalk/modules/screens/product_screen.dart';
import 'package:se7a_7alalk/modules/screens/reservation_of_specialty_clinics.dart';
import 'package:se7a_7alalk/modules/screens/review_screen.dart';
import 'package:se7a_7alalk/modules/user/about_app.dart';
import 'package:se7a_7alalk/modules/user/customer_support.dart';
import 'package:se7a_7alalk/modules/user/my_orders_screen.dart';
import 'package:se7a_7alalk/modules/user/notification_settings.dart';
import 'package:se7a_7alalk/modules/user/questions_and_answers.dart';
import 'package:se7a_7alalk/modules/user/rewards_screen.dart';
import 'package:se7a_7alalk/modules/store/medicine.dart';
import 'package:se7a_7alalk/modules/store/selling_animal_feed.dart';
import 'package:se7a_7alalk/modules/store/veterinary_fortifications.dart';
import 'package:se7a_7alalk/modules/store/veterinary_medicine_screen.dart';
import 'package:se7a_7alalk/modules/store/veterinary_supplies.dart';
import 'package:se7a_7alalk/modules/user/change_password_screen.dart';
import 'package:se7a_7alalk/modules/user/countries_screen.dart';
import 'package:se7a_7alalk/modules/user/login_screen.dart';
import 'package:se7a_7alalk/modules/layout/layout_screens/more_screen.dart';
import 'package:se7a_7alalk/modules/user/my_offers_screen.dart';
import 'package:se7a_7alalk/modules/user/onboarding_screen.dart';
import 'package:se7a_7alalk/modules/user/profile_screen.dart';
import 'package:se7a_7alalk/modules/user/register_screen.dart';
import 'package:se7a_7alalk/modules/user/settings_screen.dart';
import 'package:se7a_7alalk/modules/user/support_message.dart';

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
  HomeScreen.id: (context) => HomeScreen(),
  MyOffersScreen.id: (context) => MyOffersScreen(),
  VeterinaryMedicine.id: (context) => VeterinaryMedicine(),
  VeterinaryFortifications.id: (context) => VeterinaryFortifications(),
  VeterinarySupplies.id: (context) => VeterinarySupplies(),
  SellingAnimalFeed.id: (context) => SellingAnimalFeed(),
  Medicine.id: (context) => Medicine(),
  Clinics.id: (context) => Clinics(),
  ClinicDetails.id: (context) => ClinicDetails(),
  HomeVisitServices.id: (context) => HomeVisitServices(),
  SupportMessage.id: (context) => SupportMessage(),
  CustomerSupport.id: (context) => CustomerSupport(),
  NotificationSettings.id: (context) => NotificationSettings(),
  QuestionsAndAnswers.id: (context) => QuestionsAndAnswers(),
  ProductScreen.id: (context) => ProductScreen(),
  MyOrdersScreen.id: (context) => MyOrdersScreen(),
  DoctorNotesScreen.id: (context) => DoctorNotesScreen(),
  CartScreen.id: (context) => CartScreen(),
  PaymentScreen.id: (context) => PaymentScreen(),
  CompletedOrder.id: (context) => CompletedOrder(),
  OrderDetails.id: (context) => OrderDetails(),
  ReviewScreen.id: (context) => ReviewScreen(),
  PackageSubscription.id: (context) => PackageSubscription(),
  PackagePaymentScreen.id: (context) => PackagePaymentScreen(),
  ChatPayment.id: (context) => ChatPayment(),
  ChatDetailsScreen.id: (context) => ChatDetailsScreen(),
  DoctorsNotesScreen.id: (context) => DoctorsNotesScreen(),
  ChatsScreen.id: (context) => ChatsScreen(),
  DoctorLayout.id: (context) => DoctorLayout(),
  DoctorOrdersScreen.id: (context) => DoctorOrdersScreen(),
  ReservationOfSpecialtyClinics.id: (context) =>
      ReservationOfSpecialtyClinics(),
};
