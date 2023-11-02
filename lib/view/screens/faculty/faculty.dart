// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:sotl/resources/constants/icons.dart';
import 'package:sotl/theme/theme.dart';
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
            showSelectedLabels: false,
            showUnselectedLabels: false,
            type: BottomNavigationBarType.fixed,
            onTap: (value) {
              setState(() {
                currentIndex = value;
              });
            },
            items: [
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(IconUtils.home),
                  activeIcon: SvgPicture.asset(IconUtils.homeActive,
                      color: LightColorTheme.kPrimary),
                  label: 'Dashboard'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(IconUtils.course),
                  activeIcon: SvgPicture.asset(IconUtils.courseActive,
                      color: LightColorTheme.kPrimary),
                  label: 'Course'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(IconUtils.observation),
                  activeIcon: SvgPicture.asset(IconUtils.observationActive,
                      color: LightColorTheme.kPrimary),
                  label: 'Observations'),
              BottomNavigationBarItem(
                  icon: SvgPicture.asset(IconUtils.settings),
                  activeIcon: SvgPicture.asset(IconUtils.settingsActive,
                      color: LightColorTheme.kPrimary),
                  label: 'Settings')
            ]));
  }
}
