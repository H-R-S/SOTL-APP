import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/models/course/course_model.dart';
import 'package:sotl/resources/constants/style.dart';
import 'package:sotl/view/widgets/search_drop_down/search_drop_down.dart';
import 'package:sotl/view_models/course/course_view_model.dart';
import '../../../resources/validator/validator.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/button/my_elevated_button.dart';
import '../../widgets/text_field/my_text_field.dart';

class AddUserScreen extends StatefulWidget {
  final String title;

  const AddUserScreen({super.key, required this.title});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final formKey = GlobalKey<FormState>();

  CourseViewModel courseViewModel = CourseViewModel();

  @override
  void initState() {
    courseViewModel.getAllCourses();
    super.initState();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController campusController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController courseController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Add ${widget.title}"),
        body: Form(
            key: formKey,
            child: SingleChildScrollView(
                child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(children: [
                      MyTextField(
                          header: "Full Name",
                          isRequired: true,
                          validator: (value) =>
                              Validator.validateForm(value, "Full Name"),
                          controller: nameController,
                          hint: "Full Name"),
                      MyTextField(
                          header: "Campus",
                          isRequired: true,
                          dropDownList: [],
                          validator: (value) =>
                              Validator.validateForm(value, "Full Name"),
                          controller: emailController,
                          hint: "Campus"),
                      MyTextField(
                          header: "Department",
                          isRequired: true,
                          validator: (value) =>
                              Validator.validateForm(value, "Department"),
                          controller: departmentController,
                          hint: "Department"),
                      MyTextField(
                          header: "Role",
                          isRequired: true,
                          validator: (value) =>
                              Validator.validateForm(value, "Role"),
                          controller: roleController,
                          hint: "Role"),
                      ChangeNotifierProvider<CourseViewModel>(
                          create: (context) => courseViewModel,
                          child: Consumer<CourseViewModel>(
                              builder: (context, value, child) {
                            switch (value.courseList.status) {
                              case Status.ERROR:
                                if (kDebugMode) {
                                  print(value.courseList.message);
                                }
                                return Container();

                              case Status.COMPLETED:
                                return CourseDropDown(
                                    header: "Courses",
                                    isRequired: true,
                                    items: value.courseList.data ?? [],
                                    hint: "Select Course",
                                    onChanged: (value) {});

                              default:
                                return Container();
                            }
                          })),
                      MyTextField(
                          header: "Password",
                          isRequired: true,
                          validator: (value) =>
                              Validator.validatePassword(value),
                          controller: passwordController,
                          isPassword: true,
                          isVisible: true,
                          hint: "Password"),
                      MyTextField(
                          header: "Confirm Password",
                          isRequired: true,
                          validator: (value) =>
                              Validator.validateConfirmPassword(
                                  value, passwordController.text.trim()),
                          controller: confirmPasswordController,
                          isPassword: true,
                          isVisible: true,
                          hint: "Confirm Password"),
                      const SizedBox(height: 40),
                      MyElevatedButton(
                          title: "Add ${widget.title}",
                          onTap: () {
                            final isValidate = formKey.currentState!.validate();

                            if (isValidate) {
                              print("User added");
                            }
                          })
                    ])))));
  }
}
