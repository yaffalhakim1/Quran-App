import 'package:flutter/material.dart';
import 'package:persistent_bottom_nav_bar_v2/persistent-tab-view.dart';
import 'package:quran_app/shared/themes.dart';

import 'bookmark_screen.dart';
import 'home_screen.dart';

class MainPage extends StatelessWidget {
  List<Widget> _buildScreens() {
    return [
      HomeScreen(),
      BookmarkScreen(),
      HomeScreen(),
      HomeScreen(),
      HomeScreen()
    ];
  }

  List<PersistentBottomNavBarItem> _navBarsItems() {
    return [
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/tab1.png'),
        ),
        // title: ("Home"),
        activeColorPrimary: kHighlightColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/ideas.png'),
        ),
        // title: ("Settings"),
        activeColorPrimary: kHighlightColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/prayer.png'),
        ),
        // title: ("Settings"),
        activeColorPrimary: kHighlightColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/doa.png'),
        ),
        // title: ("Settings"),
        activeColorPrimary: kHighlightColor,
        inactiveColorPrimary: Colors.grey,
      ),
      PersistentBottomNavBarItem(
        icon: ImageIcon(
          AssetImage('assets/bookmark.png'),
        ),
        // title: ("Settings"),
        activeColorPrimary: kHighlightColor,
        inactiveColorPrimary: Colors.grey,
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: PersistentTabController(initialIndex: 0),
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      backgroundColor: Color(0xff152451), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          true, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        colorBehindNavBar: Color(0xff152451),
      ),
      popAllScreensOnTapOfSelectedTab: false,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 200),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 200),
      ),
      navBarStyle:
          NavBarStyle.style6, // Choose the nav bar style with this property.
    );
  }
}
