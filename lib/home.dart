import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
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
      ObservationScreen(),
      SettingsScreen()
    ];

    return Scaffold(
        // body: screens[selectedIndex],
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: screens),
        bottomNavigationBar: SlidingClippedNavBar(
            backgroundColor: primary,
            onButtonPressed: (index) {
              setState(() {
                selectedIndex = index;
              });
              controller.animateToPage(selectedIndex,
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.easeOutQuad);
            },
            iconSize: 30,
            activeColor: Colors.white,
            selectedIndex: selectedIndex,
            barItems: [
              BarItem(icon: Icons.space_dashboard_outlined, title: 'Dashboard'),
              BarItem(icon: Icons.person_add_alt, title: 'Users'),
              BarItem(
                  icon: Icons.calendar_today_outlined, title: 'Observations'),
              BarItem(icon: Icons.settings_outlined, title: 'Settings')
            ])
        // bottomNavigationBar: BottomNavigationBar(
        //     elevation: 0,
        //     backgroundColor: primary,
        //     currentIndex: currentIndex,
        //     selectedItemColor: Colors.white,
        //     iconSize: 30,
        //     unselectedItemColor: Colors.white30,
        //     showSelectedLabels: false,
        //     showUnselectedLabels: false,
        //     type: BottomNavigationBarType.fixed,
        //     onTap: (value) {
        //       setState(() {
        //         currentIndex = value;
        //       });
        //     },
        //     items: const [
        //       BottomNavigationBarItem(icon: Icon(Icons.dashboard_outlined), label: "Dashboard"),
        //       BottomNavigationBarItem(
        //           icon: Icon(Icons.person_add_alt), label: "Users"),
        //       BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: "Observations"),
        //       BottomNavigationBarItem(

        //           icon: Icon(Icons.settings_outlined), label: "Settings")
        //     ])
        );
  }
}
