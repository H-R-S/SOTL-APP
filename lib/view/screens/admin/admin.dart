import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
import 'screens/dashboard/dashboard_screen.dart';
import '../common/screens/observation/observation_screen.dart';
import '../common/screens/settings/settings_screen.dart';
import 'screens/users_list/users_list_screen.dart';

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
      UsersListScreen(title: "Search Faculty"),
      // UsersScreen(),
      ObservationScreen(),
      SettingsScreen()
    ];

    return Scaffold(
        // body: screens[selectedIndex],
        body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: controller,
            children: screens),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Styles.scaffoldBgColor,
          onTap: (index) {
            setState(() {
              selectedIndex = index;
            });
            controller.animateToPage(selectedIndex,
                duration: const Duration(milliseconds: 500),
                curve: Curves.easeOutQuad);
          },
          iconSize: 30,
          selectedItemColor: primary,
          unselectedItemColor: Colors.grey,
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: selectedIndex == 0
                    ? const Icon(Icons.home)
                    : const Icon(Icons.home_outlined),
                label: 'Admin'),
            const BottomNavigationBarItem(
                icon: Icon(Icons.search), label: 'Search'),
            const BottomNavigationBarItem(
                icon: Icon(
                  Icons.calendar_today_outlined,
                ),
                label: 'Observations'),
            BottomNavigationBarItem(
                icon: selectedIndex == 3
                    ? const Icon(Icons.settings)
                    : const Icon(Icons.settings_outlined),
                label: 'Settings'),
          ],
          // // barItems: [
          //   BarItem(icon: Icons.space_dashboard_outlined, title: 'Dashboard'),
          //   BarItem(icon: Icons.person_add_alt, title: 'Users'),
          //   BarItem(
          //       icon: Icons.calendar_today_outlined, title: 'Observations'),
          //   BarItem(
          //     icon: Icons.settings_outlined,
          //     title: 'Settings',
          //   )
          // ]
        )
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
