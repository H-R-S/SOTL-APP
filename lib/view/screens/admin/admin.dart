import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
      DashboardScreen(),
      UsersScreen(),
      CoursesScreen(),
      ObservationScreen(),
      SettingsScreen()
    ];

    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    return Scaffold(
        backgroundColor: light,
        // body: screens[selectedIndex],
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: screens),
        bottomNavigationBar: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: isDark ? dark : Styles.scaffoldBgColor,
            onTap: (index) {
              setState(() {
                selectedIndex = index;
              });
              controller.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutQuad);
            },
            iconSize: 30,
            selectedItemColor: isDark ? Colors.white : primary,
            unselectedItemColor: Colors.grey,
            currentIndex: selectedIndex,
            items: [
              BottomNavigationBarItem(
                  icon: selectedIndex == 0
                      ? const Icon(Icons.home)
                      : const Icon(Icons.home_outlined),
                  label: 'Admin'),
              BottomNavigationBarItem(
                  icon: Icon(selectedIndex == 1
                      ? Icons.person
                      : Icons.person_outlined),
                  label: 'Users'),
              BottomNavigationBarItem(
                  icon: Icon(selectedIndex == 2
                      ? Icons.file_copy
                      : Icons.file_copy_outlined),
                  label: 'Course'),
              BottomNavigationBarItem(
                  icon: Icon(selectedIndex == 3
                      ? Icons.calendar_month
                      : Icons.calendar_today_outlined),
                  label: 'Observations'),
              BottomNavigationBarItem(
                  icon: selectedIndex == 4
                      ? const Icon(Icons.settings)
                      : const Icon(Icons.settings_outlined),
                  label: 'Settings')
            ]));
  }
}
