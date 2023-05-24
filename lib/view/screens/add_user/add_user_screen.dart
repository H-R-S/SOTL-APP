import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/departments.dart';
import 'package:sotl/data/enums/roles.dart';
import 'package:sotl/view_models/course/course_view_model.dart';
import 'package:sotl/view_models/user/user_view_model.dart';
import '../../../data/enums/campus.dart';
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
    final userViewModel = Provider.of<UserViewModel>(context);

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
                          isReadable: true,
                          dropDownList: Campus.values
                              .map((i) => i.toString().split('.').last)
                              .toList(),
                          validator: (value) =>
                              Validator.validateForm(value, "Full Name"),
                          controller: emailController,
                          hint: "Campus"),
                      MyTextField(
                          header: "Department",
                          isRequired: true,
                          isReadable: true,
                          dropDownList: Departments.values
                              .map((i) => i.toString().split('.').last)
                              .toList(),
                          validator: (value) =>
                              Validator.validateForm(value, "Department"),
                          controller: departmentController,
                          hint: "Department"),
                      MyTextField(
                          header: "Role",
                          isRequired: true,
                          isReadable: true,
                          dropDownList: Roles.values
                              .map((i) => i.toString().split('.').last)
                              .toList(),
                          validator: (value) =>
                              Validator.validateForm(value, "Role"),
                          controller: roleController,
                          hint: "Role"),
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
                        isLoading: userViewModel.loading,
                          title: "Add ${widget.title}",
                          onTap: () {
                            final isValidate = formKey.currentState!.validate();

                            if (isValidate) {
                              // userViewModel.createUser(
                              //     context,
                              //     UserModel(
                              //         name: nameController.text.trim(),
                              //         email: emailController.text.trim(),
                              //         campus: campusController.text,
                              //         department: departmentController.text,
                              //         role: roleController.text),
                              //     passwordController.text.trim(),
                              //     courseId: []);
                            }
                          })
                    ])))));
  }
}
