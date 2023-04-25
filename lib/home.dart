import 'package:flutter/material.dart';
import 'resources/constants/style.dart';
import 'view/screens/dashboard/dashboard_screen.dart';
import 'view/screens/observation/observation_screen.dart';
import 'view/screens/settings/settings_screen.dart';
import 'view/screens/users/users_screen.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      DashboardScreen(),
      UsersScreen(),
      ObservationScreen(),
      SettingsScreen()
    ];

    return Scaffold(
        body: screens[currentIndex],
        bottomNavigationBar: BottomNavigationBar(
            elevation: 0,
            backgroundColor: Colors.white,
            currentIndex: currentIndex,
            selectedItemColor: primary,
            iconSize: 30,
            unselectedItemColor: primary.withOpacity(.4),
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: "Dashboard"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.person_add_alt), label: "Users"),
              BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Observations"),
              BottomNavigationBarItem(
                  
                  icon: Icon(Icons.settings_outlined), label: "Settings")
            ]));
  }
}
