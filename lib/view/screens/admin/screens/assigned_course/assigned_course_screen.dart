import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../resources/constants/style.dart';
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

  final TextEditingController nameController = TextEditingController();

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
      backgroundColor: light,
        appBar: MyAppBar(scaffoldKey, context,
            isBack: true, title: "Assigned Course"),
        body: Padding(
            padding: const EdgeInsets.all(20),
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
                            onChanged: (value) {});

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

                        return CourseDropDown(
                            items: course,
                            hint: "Search Course",
                            onChanged: (value) {});

                      default:
                        return Container();
                    }
                  })),
              const SizedBox(height: 20),
              MyElevatedButton(title: "Assigned Course", onTap: () {}),
              const SizedBox(height: 40),
            ])));
  }
}
