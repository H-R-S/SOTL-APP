import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:sotl/view/widgets/snack_bar/my_snack_bar.dart';

import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/text_field/my_text_field.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TextEditingController nameController =
      TextEditingController(text: "Dr. Fariha Hayat");
  TextEditingController emailController =
      TextEditingController(text: "fariha.hayat@iqra.edu.pk");
  TextEditingController phoneNoController = TextEditingController(text: "N/A");
  TextEditingController dobController = TextEditingController(text: "N/A");
  TextEditingController roleController =
      TextEditingController(text: "Director");

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          appBar:
              MyAppBar(scaffoldKey, context, title: "Profile", isBack: true),
          body: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(children: [
                MyTextField(
                    header: "Full Name",
                    controller: nameController,
                    hint: "Full Name"),
                MyTextField(
                    header: "Email",
                    controller: emailController,
                    hint: "Email"),
                MyTextField(
                    header: "Phone No.",
                    controller: phoneNoController,
                    hint: "Phone No."),
                MyTextField(
                    header: "DOB", controller: dobController, hint: "DOB"),
                MyTextField(
                    header: "Role", controller: roleController, hint: "Role"),
                const SizedBox(height: 20),
                MyElevatedButton(
                    title: "Update",
                    onTap: () {
                      MySnackBar(context, "Info Updated");
                    })
              ]))),
    );
  }
}
