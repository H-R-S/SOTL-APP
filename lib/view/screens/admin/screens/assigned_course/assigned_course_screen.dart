import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../view_models/course/course_view_model.dart';
import '../../../../../view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/button/my_elevated_button.dart';
import '../../../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../../../widgets/search_drop_down/search_drop_down.dart';

class AssignedCourseScreen extends StatefulWidget {
  const AssignedCourseScreen({super.key});

  @override
  State<AssignedCourseScreen> createState() => _AssignedCourseScreenState();
}

class _AssignedCourseScreenState extends State<AssignedCourseScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final formKey = GlobalKey<FormState>();

  final TextEditingController facultyController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController slotController = TextEditingController();

  UserViewModel userViewModel = UserViewModel();
  CourseViewModel courseViewModel = CourseViewModel();

  @override
  void initState() {
    userViewModel.getAllUsers();
    courseViewModel.getAllCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const MyAppBar(isBack: true, title: "Assigned Course"),
        persistentFooterButtons: [
          Consumer<CourseViewModel>(builder: (context, value, child) {
            return MyElevatedButton(
                isLoading: value.loading,
                title: "Assigned Course",
                onTap: () {
                  value.assignedCourse(
                      context,
                      int.parse(facultyController.text),
                      [int.parse(slotController.text)]).then((value) {
                    facultyController.clear();
                    courseController.clear();
                    slotController.clear();
                  });
                });
          }),
        ],
        body: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(children: [
              ChangeNotifierProvider<UserViewModel>(
                  create: (context) => userViewModel,
                  child:
                      Consumer<UserViewModel>(builder: (context, value, child) {
                    switch (value.usersList.status) {
                      case Status.ERROR:
                        debugPrint(value.usersList.message);
                        return Container();

                      case Status.COMPLETED:
                        final faculty = value.usersList.data!
                            .where((user) => user.role == "Faculty")
                            .toList();

                        return FacultyDropDown(
                            items: faculty,
                            hint: "Search Faculty",
                            onChanged: (value) {
                              facultyController.value = facultyController.value
                                  .copyWith(text: value!.id.toString());
                            });

                      default:
                        return const MyLoadingIndicator();
                    }
                  })),
              const SizedBox(height: 20),
              ChangeNotifierProvider<CourseViewModel>(
                  create: (context) => courseViewModel,
                  child: Consumer<CourseViewModel>(
                      builder: (context, value, child) {
                    switch (value.courseList.status) {
                      case Status.ERROR:
                        debugPrint(value.courseList.message);
                        return Container();

                      case Status.COMPLETED:
                        final course = value.courseList.data!;

                        return Column(children: [
                          CourseDropDown(
                              items: course,
                              hint: "Search Course",
                              onChanged: (value) {
                                courseController.value = courseController.value
                                    .copyWith(text: value!.id.toString());

                                setState(() {});
                              }),
                          const SizedBox(height: 20),
                          if (courseController.text != "")
                            SlotDropDown(
                                items: course[0].slots!,
                                hint: "Select Slot",
                                onChanged: (value) {
                                  slotController.value = slotController.value
                                      .copyWith(text: value!.id.toString());
                                })
                        ]);

                      default:
                        return Container();
                    }
                  })),
              const SizedBox(height: 20),
            ])));
  }
}
