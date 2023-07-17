import 'package:flutter/material.dart';
import '../../../../../data/enums/campus.dart';
import '../../../../../data/enums/departments.dart';
import '../../../../../resources/constants/style.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/button/my_elevated_button.dart';
import '../../../../widgets/text_field/my_text_field.dart';

class AddCourseScreen extends StatelessWidget {
  AddCourseScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final formKey = GlobalKey<FormState>();

  final TextEditingController courseNameController = TextEditingController();
  final TextEditingController courseCodeController = TextEditingController();
  final TextEditingController creditHoursController = TextEditingController();
  final TextEditingController departmentController = TextEditingController();
  final TextEditingController campusController = TextEditingController();
  final TextEditingController slotCodeController = TextEditingController();
  final TextEditingController slotDayController = TextEditingController();
  final TextEditingController slotTimingController = TextEditingController();
  final TextEditingController slotLocationController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar:
            MyAppBar(scaffoldKey, context, title: "Add Course", isBack: true),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Course Details", style: Styles.h2),
                      const SizedBox(height: 20),
                      MyTextField(
                          header: "Course Code",
                          isRequired: true,
                          controller: courseCodeController,
                          hint: "HUM-114"),
                      MyTextField(
                          header: "Course Name",
                          isRequired: true,
                          controller: courseNameController,
                          hint: "Functional English"),
                      MyTextField(
                          header: "Credit hourse",
                          isRequired: true,
                          controller: creditHoursController,
                          hint: "1, 2, 3"),
                      MyTextField(
                          header: "Department",
                          isRequired: true,
                          controller: departmentController,
                          dropDownList: Departments.values
                              .map((i) => i.toString().split('.').last)
                              .toList(),
                          hint: "Select Department"),
                      MyTextField(
                          header: "Campus",
                          isRequired: true,
                          controller: campusController,
                          dropDownList: Campus.values
                              .map((i) => i.toString().split('.').last)
                              .toList(),
                          hint: "Select Campus"),
                      const SizedBox(height: 20),
                      Text("Slot Details", style: Styles.h2),
                      const SizedBox(height: 20),
                      MyTextField(
                          header: "Slot Code",
                          isRequired: true,
                          controller: slotCodeController,
                          hint: "10200001"),
                      MyTextField(
                          header: "Slot Day",
                          isRequired: true,
                          controller: slotDayController,
                          hint: "Monday"),
                      MyTextField(
                          header: "Slot timing",
                          isRequired: true,
                          controller: slotTimingController,
                          hint: "11:45 (without am/pm) 24 hours"),
                      MyTextField(
                          header: "Slot location",
                          isRequired: true,
                          controller: slotLocationController,
                          hint: "E-201"),
                      const SizedBox(height: 20),
                      MyElevatedButton(title: "Add Course", onTap: () {}),
                      const SizedBox(height: 40)
                    ]))));
  }
}
