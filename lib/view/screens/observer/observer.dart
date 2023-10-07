import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../../resources/constants/icons.dart';
import '../../../resources/constants/style.dart';
import '../../../theme/theme.dart';
import '../../../theme/theme_provider.dart';
import '../common/screens/settings/settings_screen.dart';
import 'screens/home/observer_home_screen.dart';
import 'screens/observation/observer_observation_screen.dart';

class Observer extends StatefulWidget {
  const Observer({super.key});

  @override
  State<Observer> createState() => _ObserverState();
}

class _ObserverState extends State<Observer> {
  int selectedIndex = 0;

  PageController controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Widget> screens = [
      ObserverHomeScreen(),
      const ObserverObservationScreen(),
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
