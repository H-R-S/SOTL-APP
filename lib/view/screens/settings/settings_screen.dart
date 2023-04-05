import 'package:flutter/material.dart';
import '../../../routes/routes_name.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/settings_container/settings_container.dart';
import '../../widgets/snack_bar/my_snack_bar.dart';
import '../../widgets/user_info_container/user_info_container.dart';

class SettingsScreen extends StatelessWidget {
  SettingsScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: MyAppBar(scaffoldKey, context, title: "Settings"),
            body: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      UserInfoContainer(
                          onTap: () {
                            Navigator.pushNamed(context, RoutesName.profile);
                          },
                          name: "Dr. Fariha Hayat",
                          email: "fariha.hayat@iqra.edu.pk",
                          role: "Director"),
                      const SizedBox(height: 20),
                      const Divider(),
                      SettingsContainer(
                          icon: Icons.logout,
                          title: "Logout",
                          onTap: () {
                            MySnackBar(context, "Logout");
                            Navigator.pushReplacementNamed(
                                context, RoutesName.login);
                          }),
                      const SizedBox(height: 20),
                      const Text("General Settings",
                          style: TextStyle(
                              fontSize: 24, fontWeight: FontWeight.bold)),
                      const SizedBox(height: 20),
                      SettingsContainer(
                          isSwitch: true,
                          title: "Dark Mode",
                          icon: Icons.dark_mode_outlined,
                          onTap: () {}),
                      SettingsContainer(
                          title: "Term's & Condition",
                          icon: Icons.feed_outlined,
                          onTap: () {}),
                      SettingsContainer(
                          title: "Prvacy Policy",
                          icon: Icons.security,
                          onTap: () {})
                    ]))));
  }
}
