// ignore_for_file: deprecated_member_use
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:sotl/resources/constants/icons.dart';
import 'package:sotl/theme/theme.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme_provider.dart';
import 'screens/courses/courses_screen.dart';
import 'screens/dashboard/dashboard_screen.dart';
import 'screens/observation/observation_screen.dart';
import '../common/screens/settings/settings_screen.dart';
import 'screens/users/users_screen.dart';

class Admin extends StatefulWidget {
  const Admin({super.key});

  @override
  State<Admin> createState() => _AdminState();
}

class _AdminState extends State<Admin> {
  int selectedIndex = 0;

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      const DashboardScreen(),
      const UsersScreen(),
      const CoursesScreen(),
      const ObservationScreen(),
      const SettingsScreen()
    ];

    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Scaffold(
        backgroundColor: Colors.white,
        body: screens[selectedIndex],
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
              border: Border(
                  top: BorderSide(color: LightColorTheme.kBorderLightColor))),
          child: BottomNavigationBar(
              elevation: 0,
              backgroundColor: Colors.white,
              type: BottomNavigationBarType.fixed,
              showSelectedLabels: false,
              showUnselectedLabels: false,
              onTap: (value) {
                setState(() {
                  selectedIndex = value;
                });
              },
              iconSize: 30,
              selectedItemColor: isDark ? Colors.white : primary,
              unselectedItemColor: Colors.grey,
              currentIndex: selectedIndex,
              items: [
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(IconUtils.home),
                    activeIcon: SvgPicture.asset(IconUtils.homeActive,
                        color: LightColorTheme.kPrimary),
                    label: 'Admin'),
                BottomNavigationBarItem(
                    icon: SvgPicture.asset(IconUtils.user),
                    activeIcon: SvgPicture.asset(IconUtils.userActive,
                        color: LightColorTheme.kPrimary),
                    label: 'Users'),
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
              ]),
        ));
  }
}
