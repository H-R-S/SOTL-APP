import 'package:flutter/material.dart';
import '../../../../../data/enums/campus.dart';
import '../../../../../data/enums/departments.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/button/my_elevated_button.dart';
import '../../../../widgets/text_field/my_text_field.dart';

class AddCourseScreen extends StatelessWidget {
  AddCourseScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            MyAppBar(scaffoldKey, context, title: "Add Course", isBack: true),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  MyTextField(
                      header: "Name",
                      isRequired: true,
                      controller: nameController,
                      hint: "Course Name"),
                  MyTextField(
                      header: "Code",
                      isRequired: true,
                      controller: nameController,
                      hint: "Course Code"),
                  MyTextField(
                      header: "Department",
                      isRequired: true,
                      controller: nameController,
                      dropDownList: Departments.values
                          .map((i) => i.toString().split('.').last)
                          .toList(),
                      hint: "Select Department"),
                  MyTextField(
                      header: "Campus",
                      isRequired: true,
                      controller: nameController,
                      dropDownList: Campus.values
                          .map((i) => i.toString().split('.').last)
                          .toList(),
                      hint: "Select Campus"),
                  const SizedBox(height: 20),
                  MyElevatedButton(title: "Add Course", onTap: () {}),
                  const SizedBox(height: 40)
                ]))));
  }
}
