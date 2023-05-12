import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../routes/routes_name.dart';
import '../../../view_models/auth/auth_view_model.dart';
import '../../../view_models/user/user_view_model.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/settings_container/settings_container.dart';
import '../../widgets/user_info_container/user_info_container.dart';

class SettingsScreen extends StatefulWidget {
  SettingsScreen({super.key});

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
        body: Padding(
            padding: const EdgeInsets.only(top: 20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              UserInfoContainer(
                  onTap: () {
                    Navigator.pushNamed(context, RoutesName.profile);
                  },
                  name: nameController.text,
                  email: emailController.text,
                  role: roleController.text),
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
                    authViewModel.logOut().then((value) {
                      Navigator.of(context, rootNavigator: true)
                          .pushReplacementNamed(RoutesName.login);
                    });
                  })
            ])));
  }
}
