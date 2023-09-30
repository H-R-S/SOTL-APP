import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../data/enums/campus.dart';
import '../../../../../data/enums/departments.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../models/course/course_model.dart';
import '../../../../../models/user/user_model.dart';
import '../../../../../resources/validator/validator.dart';
import '../../../../../view_models/course/course_view_model.dart';
import '../../../../../view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/button/my_elevated_button.dart';
import '../../../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../../../widgets/search_drop_down/search_drop_down.dart';
import '../../../../widgets/text_field/my_text_field.dart';

class AddUserScreen extends StatefulWidget {
  final String? title;

  const AddUserScreen({super.key, this.title});

  @override
  State<AddUserScreen> createState() => _AddUserScreenState();
}

class _AddUserScreenState extends State<AddUserScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  CourseViewModel courseViewModel = CourseViewModel();

  final formKey = GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController campusController = TextEditingController();
  TextEditingController departmentController = TextEditingController();
  TextEditingController roleController = TextEditingController();
  TextEditingController courseIdController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
    courseViewModel.getAllCourses();
    super.initState();
  }

  List<int> courseIdList = [];

  bool isFaculty = false;

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
            appBar: const MyAppBar(title: "Create User", isBack: true),
            persistentFooterButtons: [
              MyElevatedButton(
                  isLoading: userViewModel.loading,
                  title: "Add Faculty",
                  onTap: () {
                    final isValidate = formKey.currentState!.validate();

                    if (isValidate) {
                      userViewModel
                          .createUser(
                              context,
                              UserModel(
                                  name: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  campus: campusController.text,
                                  department: Department(),
                                  role: roleController.text),
                              password: passwordController.text.trim(),
                              courseId: courseIdList)
                          .then((value) {
                        nameController.clear();
                        emailController.clear();
                        campusController.clear();
                        departmentController.clear();
                        roleController.clear();
                        courseIdController.clear();
                        passwordController.clear();
                        confirmPasswordController.clear();
                      });
                    }
                  }),
            ],
            body: SingleChildScrollView(
                child: Form(
                    key: formKey,
                    child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: ChangeNotifierProvider<CourseViewModel>(
                            create: (context) => courseViewModel,
                            child: Consumer<CourseViewModel>(
                                builder: (context, value, child) {
                              switch (value.courseList.status) {
                                case Status.ERROR:
                                  debugPrint(value.courseList.message);
                                  return Container();

                                case Status.COMPLETED:
                                  final course = value.courseList.data!;
                                  // .where((course) => course.slots!
                                  //     .every((slot) => slot.facultyId == null))
                                  // .toList();

                                  final slots = <Slots>[];

                                  return Column(children: [
                                    MyTextField(
                                        header: "Full Name",
                                        isRequired: true,
                                        validator: (value) =>
                                            Validator.validateForm(
                                                value, "Full Name"),
                                        controller: nameController,
                                        hint: "Full Name"),
                                    MyTextField(
                                        header: "Email",
                                        isRequired: true,
                                        validator: (value) =>
                                            Validator.validateEmail(value),
                                        controller: emailController,
                                        hint: "Email"),
                                    MyTextField(
                                        header: "Campus",
                                        isRequired: true,
                                        isReadable: true,
                                        dropDownList: Campus.values
                                            .map((i) =>
                                                i.toString().split('.').last)
                                            .toList(),
                                        validator: (value) =>
                                            Validator.validateForm(
                                                value, "Full Name"),
                                        controller: campusController,
                                        hint: "Campus"),
                                    MyTextField(
                                        header: "Department",
                                        isRequired: true,
                                        isReadable: true,
                                        dropDownList: Departments.values
                                            .map((i) =>
                                                i.toString().split('.').last)
                                            .toList(),
                                        validator: (value) =>
                                            Validator.validateForm(
                                                value, "Department"),
                                        controller: departmentController,
                                        hint: "Department"),
                                    MyTextField(
                                        header: "Role",
                                        isRequired: true,
                                        isReadable: true,
                                        onChanged: (newValue) {
                                          if (newValue == "Faculty") {
                                            value.setFaculty(true);
                                          } else {
                                            value.setFaculty(false);
                                          }
                                        },
                                        dropDownList: const [
                                          "Faculty",
                                          "Observer"
                                        ],
                                        validator: (value) =>
                                            Validator.validateForm(
                                                value, "Role"),
                                        controller: roleController,
                                        hint: "Role"),
                                    const SizedBox(height: 10),
                                    if (value.faculty) ...[
                                      CourseDropDown(
                                          header: "Courses",
                                          isRequired: true,
                                          items: course,
                                          hint: "Select Course",
                                          onChanged: (value) {
                                            slots.clear();
                                            slots.addAll(value!.slots!.where(
                                                (slot) =>
                                                    slot.facultyId == null));
                                            debugPrint(value.slots.toString());
                                          }),
                                      const SizedBox(height: 15),
                                      SlotDropDown(
                                          header: "Slots",
                                          isRequired: true,
                                          items: slots,
                                          hint: "Select Slots",
                                          onChanged: (value) {
                                            courseIdList.add(value!.id!);
                                          })
                                    ],
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
                                                value,
                                                passwordController.text.trim()),
                                        controller: confirmPasswordController,
                                        isPassword: true,
                                        isVisible: true,
                                        hint: "Confirm Password"),
                                    const SizedBox(height: 40),
                                  ]);

                                default:
                                  return const MyLoadingIndicator();
                              }
                            })))))));
  }
}
