import 'package:flutter/material.dart';
import 'package:nearme_app/Features/Notifications/Screens/general_notifications.dart';
import 'package:nearme_app/Features/Settings/screens/settings_screen.dart';
import 'package:nearme_app/components/bottom_bar.dart';

import '../Features/Home/Home/Screens/home_screen.dart';
import '../Features/User_Profile/screens/user_profile_screen.dart';

// Create a RouteObserver
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class MainScaffold extends StatefulWidget {
  @override
  _MainScaffoldState createState() => _MainScaffoldState();
  static String mainScaffoldKey = '/MainScaffold';
}

class _MainScaffoldState extends State<MainScaffold> with RouteAware {
  int _selectedIndex = 0; // Home icon is selected by default
  bool _showBottomBar = true;

  // Reorder the pages so HomeScreen is at index 0
  final List<Widget> _pages = [
    HomeScreen(), // Index 0: Home
    UserProfileScreen(), // Index 1: User Profile
    const GeneralNotifications(
        title:
            'Notifications'), // Index 2: Notifications (assuming this is for notifications)
    SettingsScreen(), // Index 3: Settings
  ];

  void _onIconPressed(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context)! as PageRoute);
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  void didPush() {
    _updateBottomBarVisibility();
  }

  @override
  void didPopNext() {
    _updateBottomBarVisibility();
  }

  // void _updateBottomBarVisibility() {
  //   final currentRoute = ModalRoute.of(context)?.settings.name;
  //   setState(() {
  //     _showBottomBar =
  //         !(currentRoute == '/signin' || currentRoute == '/signup');
  //   });
  // }
  void _updateBottomBarVisibility() {
    final currentRoute = ModalRoute.of(context)?.settings.name;
    setState(() {
      _showBottomBar = currentRoute == MainScaffold.mainScaffoldKey ||
          currentRoute == HomeScreen.homeScreenKey ||
          currentRoute == UserProfileScreen.userProfileScreenKey ||
          currentRoute == GeneralNotifications.generalNotificationsKey ||
          currentRoute == SettingsScreen.settingsScreenKey;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex], // Display the current page
      bottomNavigationBar: _showBottomBar
          ? BottomContainerWithIcons(
              selectedIndex: _selectedIndex,
              onIconPressed: _onIconPressed,
            )
          : null,
    );
  }
}
