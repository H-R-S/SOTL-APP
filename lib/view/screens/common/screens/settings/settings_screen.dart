import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/theme/theme_provider.dart';
import '../../../../../resources/constants/style.dart';
import '../../../../../routes/routes_name.dart';
import '../../../../../view_models/auth/auth_view_model.dart';
import '../../../../../view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/settings_container/settings_container.dart';
import '../../../../widgets/user_info_container/user_info_container.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TextEditingController nameController = TextEditingController(text: "Name");
  TextEditingController emailController = TextEditingController(text: "Email");
  TextEditingController roleController = TextEditingController(text: "Role");

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    userViewModel.getUser().then((value) {
      setState(() {
        nameController.value = nameController.value.copyWith(text: value.name);
        emailController.value =
            emailController.value.copyWith(text: value.email);
        roleController.value = roleController.value
            .copyWith(text: value.role!.replaceAll("_", " "));
      });
    });

    final authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Settings"),
        body: ListView(physics: const BouncingScrollPhysics(), children: [
          UserInfoContainer(
              onTap: () {
                Navigator.pushNamed(context, RoutesName.profile);
              },
              name: nameController.text,
              email: emailController.text,
              role: roleController.text),
          headingText("General"),
          SettingsContainer(
              icon: Icons.person_outline,
              title: "Profile",
              onTap: () {
                Navigator.pushNamed(context, RoutesName.profile);
              }),
          SettingsContainer(
              icon: Icons.lock_outline, title: "Change Password", onTap: () {}),
          SettingsContainer(
              title: "Notifications",
              icon: Icons.notifications_none_outlined,
              onTap: () {}),
          Consumer<ThemeProvider>(builder: (context, value, child) {
            final isDark = value.currentTheme == ThemeData.dark();

            return SettingsContainer(
              isSwitch: true,
              title: "${isDark ? "Light" : "Dark"} Mode",
              icon:
                  isDark ? Icons.dark_mode_outlined : Icons.dark_mode_outlined,
              // onTap: value.toggleTheme
            );
          }),
          const SizedBox(height: 10),
          headingText("Support"),
          SettingsContainer(
              title: "Rate & Review", icon: Icons.star_border, onTap: () {}),
          SettingsContainer(
              title: "Help", icon: Icons.help_outline_outlined, onTap: () {}),
          SettingsContainer(
              icon: Icons.logout,
              title: "Logout",
              trailingIcon: false,
              onTap: () {
                authViewModel.logOut().then((value) {
                  Navigator.of(context, rootNavigator: true)
                      .pushReplacementNamed(RoutesName.login);
                });
              })
        ]));
  }

  Widget headingText(String text) {
    return Padding(
        padding: const EdgeInsets.only(top: 20.0),
        child: Row(children: [
          Text(text,
              textScaleFactor: 1.1,
              style: TextStyle(
                  fontSize: 16,
                  color: Styles.fontColor,
                  fontWeight: FontWeight.bold))
        ]));
  }
}
