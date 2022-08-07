import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_cubit.dart';
import 'package:se7a_7alalk/cubits/home_cubit/app_states.dart';
import 'package:se7a_7alalk/cubits/store_cubit/store_cubit.dart';

import 'package:se7a_7alalk/modules/layout/home_layout_screens/cart_screen.dart';
import 'package:se7a_7alalk/modules/screens/categories_services_first_screen.dart';
import 'package:se7a_7alalk/modules/clinics_screens/countries_clinics.dart';
import 'package:se7a_7alalk/networks/local/cache_helper.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

import '../chat_bot_screen.dart';
import '../clinics_screens/clinic_countries_screen.dart';
import '../screens/categories_services_second_screen.dart';
import 'home_layout_screens/home_screen.dart';
import 'home_layout_screens/more_screen.dart';
import 'home_layout_screens/my_account_screen.dart';

class HomeLayout extends StatelessWidget {
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/images/home.png"),
        inactiveIcon: Image.asset("assets/images/home 2.png"),
        title: "NavigatorHome".tr(),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/images/appoinments.png"),
        inactiveIcon: Image.asset("assets/images/medical-report.png"),
        title: 'clinicReservation'.tr(),

      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/images/dog-food-and-bone.png"),
        inactiveIcon: Image.asset("assets/images/dog-food-and-bone 2.png"),
        title: 'veterinaryServices'.tr(),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/images/cart.png"),
        inactiveIcon: Image.asset("assets/images/Icon-cart.png"),
        title: 'cart'.tr(),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/images/user.png"),
        inactiveIcon: Image.asset("assets/images/Icon awesome-user.png"),
        title: 'myProfile'.tr(),
      ),
      PersistentBottomNavBarItem(
        icon: Image.asset("assets/images/more.png"),
        inactiveIcon: Image.asset("assets/images/more 2.png"),
        title: 'NavigatorMore'.tr(),
      ),
    ];
  }

  List<Widget> _homeScreens() {
    return [
      HomeScreen(),
      ClinicCountriesScreen(),
      CategoriesServicesSecondScreen(),
      CartScreen(),
      MyAccountScreen(),
      MoreScreen()
    ];
  }



  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppStates>(
      builder: (context ,states) {
        return Scaffold(
          floatingActionButton: Padding(
            padding: const EdgeInsets.symmetric(vertical: 100),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: (){
                   navigateTo(context: context,page: ChatBotScreen(key: UniqueKey(),));
                  },
                  child: Container(
                    height: 50,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    width: 50,
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage("assets/images/bot.jpg")
                        )
                    ),
                  ),
                ),
                InkWell(
                  onTap: (){
                    launchWhatsApp(CacheHelper.getData("appWhats") ?? "");
                  },
                  child: Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage("assets/images/whatsApp.jpeg")
                      )
                    ),
                  ),
                ),

              ],
            ),
          ),
          body:PersistentTabView(
            context,
            controller: _controller,
            screens: _homeScreens(),
            items: _navBarsItems(),
            confineInSafeArea: true,
            backgroundColor: Colors.white, // Default is Colors.white.
            handleAndroidBackButtonPress: true, // Default is true.
            resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
            stateManagement: false, // Default is true.
            hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
            decoration: NavBarDecoration(
              borderRadius: BorderRadius.circular(10.0),
              colorBehindNavBar: Colors.white,
            ),

            popAllScreensOnTapOfSelectedTab: false,
            popActionScreens: PopActionScreensType.all,
            navBarHeight: 80,
            margin: EdgeInsets.zero,
            padding: NavBarPadding.all(10),
            itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
              duration: Duration(milliseconds: 200),
              curve: Curves.bounceInOut
            ),
            screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
              animateTabTransition: true,
              curve: Curves.ease,
              duration: Duration(milliseconds: 200),
            ),
            navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
          ),
        );
      }
    );
  }

}
