import 'package:flutter/material.dart';
import 'package:sotl/view/screens/faculty/screens/observation/observation_screen.dart';
import 'package:sotl/view/screens/observer/screens/home/observer_home_screen.dart';
import '../../../resources/constants/style.dart';
import '../common/screens/settings/settings_screen.dart';

class Observer extends StatefulWidget {
  const Observer({super.key});

  @override
  State<Observer> createState() => _ObserverState();
}

class _ObserverState extends State<Observer> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      ObserverHomeScreen(),
      // Container(),
      FacultyObservationScreen(),
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
            // showSelectedLabels: false,
            // showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.dashboard_outlined), label: "Dashboard"),
              // BottomNavigationBarItem(
              //     icon: Icon(Icons.library_books_outlined), label: "Courses"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.calendar_month),
                  icon: Icon(Icons.calendar_today),
                  label: "Observations"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: "Settings")
            ]));
  }
}
