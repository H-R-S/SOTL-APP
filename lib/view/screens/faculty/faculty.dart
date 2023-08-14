import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
import '../common/screens/settings/settings_screen.dart';
import 'screens/course/course_screen.dart';
import 'screens/home/home_screen.dart';
import 'screens/observation/observation_screen.dart';

class Faculty extends StatefulWidget {
  const Faculty({super.key});

  @override
  State<Faculty> createState() => _FacultyState();
}

class _FacultyState extends State<Faculty> {
  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      FacultyHomeScreen(),
      const FacultyCourseScreen(),
      const FacultyObservationScreen(),
      const SettingsScreen()
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
              BottomNavigationBarItem(
                  icon: Icon(Icons.library_books_outlined), label: "Courses"),
              BottomNavigationBarItem(
                  activeIcon: Icon(Icons.calendar_month),
                  icon: Icon(Icons.calendar_today),
                  label: "Observations"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.settings_outlined), label: "Settings")
            ]));
  }
}
