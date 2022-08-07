
import 'package:easy_localization/src/public_ext.dart';
import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar/persistent-tab-view.dart';
import 'package:se7a_7alalk/cubits/auth_cubit/auth_cubit.dart';
import 'package:se7a_7alalk/modules/account_screens/profile_screen.dart';
import 'package:se7a_7alalk/modules/auth_screens/auth_screen.dart';
import 'package:se7a_7alalk/shared/widgets/components.dart';

import 'doctor_layout_screens/chat_screen.dart';
import 'doctor_layout_screens/order_screen.dart';


class DoctorLayout extends StatelessWidget {
  PersistentTabController _controller = PersistentTabController(initialIndex: 0);

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon:  Image.asset("assets/images/chat.png"),
        inactiveIcon:  Image.asset("assets/images/chat.png"),
        title: "TalksAndConsultations".tr(),
      ),
      PersistentBottomNavBarItem(
          icon: Image.asset("assets/images/order.png"),
          inactiveIcon: Image.asset("assets/images/order.png"),
          title: 'orders'.tr()
      ),
      PersistentBottomNavBarItem(
          icon: Image.asset("assets/images/user.png"),
          inactiveIcon: Image.asset("assets/images/user.png"),
          title: 'profile'.tr()
      ),
      PersistentBottomNavBarItem(
          icon: Image.asset("assets/images/exit.png"),
          inactiveIcon: Image.asset("assets/images/exit.png"),
          title: 'Exit'.tr()
      ),
    ];
  }

  List<Widget> _homeScreens() {
    return [
      ChatsScreen(),
      DoctorOrdersScreen(),
      ProfileScreen(),
      SizedBox(),
    ];
  }
  @override
  Widget build(BuildContext context) {
    return  PersistentTabView(
      context,
      controller: _controller,
      onItemSelected: (value) async{
        if (value == 3) {
          var result = await AuthCubit.get(context).logout();
          showToast(text: result["msg"]);
          Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (BuildContext context) {
                return AuthScreen();
              },
            ),
                (_) => false,);
        }
      },
      screens: _homeScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Colors.white, // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset: true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows: true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties( // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation( // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarHeight: 80,
      navBarStyle: NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
