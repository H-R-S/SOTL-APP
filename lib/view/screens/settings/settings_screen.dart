import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
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
    return Scaffold(
        appBar:
            MyAppBar(scaffoldKey, context, title: "Settings"),
        body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              // const HeaderTag(title: "Settings"),
              // const SizedBox(height: 20),
              // UserInfoContainer(
              //     onTap: () {
              //       Navigator.pushNamed(context, RoutesName.profile);
              //     },
              //     name: "Dr. Fariha Hayat",
              //     email: "fariha.hayat@iqra.edu.pk",
              //     role: "Instructor"),
              // Container(
              //   height: 200,
              //   color: primary,
              //   child: Padding(
              //     padding: const EdgeInsets.all(20),
              //     child: UserInfoContainer(
              //       onTap: () {
              //         Navigator.pushNamed(context, RoutesName.profile);
              //       },
              //       name: "Dr. Fariha Hayat",
              //       email: "fariha.hayat@iqra.edu.pk",
              //       role: "Instructor"),
              //   ),
              // ),
              SettingsContainer(
                  icon: Icons.visibility_outlined,
                  title: "Change Password",
                  onTap: () {}),
              SettingsContainer(
                  isSwitch: true,
                  title: "Dark Mode",
                  icon: Icons.dark_mode_outlined,
                  onTap: () {}),
              SettingsContainer(
                  title: "FeedBack",
                  icon: Icons.message_outlined,
                  onTap: () {}),
              SettingsContainer(
                  icon: Icons.logout,
                  title: "Logout",
                  onTap: () {
                    MySnackBar(context, "Logout");
                    Navigator.pushReplacementNamed(context, RoutesName.login);
                  })
            ])));
  }
}
