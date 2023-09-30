import 'package:flutter/material.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/button/my_elevated_button.dart';
import '../../../../widgets/snack_bar/my_snack_bar.dart';
import '../../../../widgets/text_field/my_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TextEditingController nameController =
      TextEditingController(text: "Sheraz Ahmed");

  TextEditingController emailController =
      TextEditingController(text: "sheraz.ahmed@iqra.edu.pk");

  TextEditingController phoneNoController = TextEditingController(text: "N/A");

  TextEditingController dobController = TextEditingController(text: "N/A");

  TextEditingController roleController =
      TextEditingController(text: "Head of Department");

  bool isEdit = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: const MyAppBar(
              title: "Profile",
              isBack: true,
            ),
            body: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              physics: const BouncingScrollPhysics(),
              children: [
                Column(children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.transparent,
                    ),
                    child: const Stack(fit: StackFit.loose, children: [
                      Positioned.fill(
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage('assets/images/profile_img.png'),
                        ),
                      ),
                      // Edit Button
                      // Positioned(
                      //   bottom: 0,
                      //   right: 0,
                      //   child: Container(
                      //     width: 40,
                      //     height: 40,
                      //     decoration: BoxDecoration(
                      //       shape: BoxShape.circle,
                      //       color: isEdit == true ? Colors.green : primary,
                      //     ),
                      //     child: IconButton(
                      //       icon: const Icon(Icons.edit),
                      //       color: Colors.white,
                      //       onPressed: () {},
                      //     ),
                      //   ),
                      // ),
                    ]),
                  ),
                  const SizedBox(height: 20),
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
                ]),
              ],
            )));
  }
}
