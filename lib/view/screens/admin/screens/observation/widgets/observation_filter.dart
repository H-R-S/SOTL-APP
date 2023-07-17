import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:sotl/view/widgets/loading_indicator/my_loading_indicator.dart';
import 'package:sotl/view/widgets/search_drop_down/search_drop_down.dart';
import 'package:sotl/view_models/course/course_view_model.dart';

import '../../../../../../view_models/user/user_view_model.dart';

class ObservationFilter extends StatefulWidget {
  final TextEditingController course;
  final TextEditingController faculty;
  final TextEditingController observer;

  const ObservationFilter(
      {super.key,
      required this.course,
      required this.faculty,
      required this.observer});

  @override
  State<ObservationFilter> createState() => _ObservationFilterState();
}

class _ObservationFilterState extends State<ObservationFilter> {
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
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        ChangeNotifierProvider<CourseViewModel>(
            create: (context) => courseViewModel,
            child: Consumer<CourseViewModel>(builder: (context, value, child) {
              switch (value.courseList.status) {
                case Status.ERROR:
                  debugPrint(value.courseList.message);
                  return Container();

                case Status.COMPLETED:
                  final courses = value.courseList.data!;

                  return CourseDropDown(
                      items: courses,
                      hint: "Select Course",
                      onChanged: (value) {
                        widget.course.value = widget.course.value
                            .copyWith(text: value!.id.toString());
                      });

                default:
                  return const MyLoadingIndicator();
              }
            })),
        const SizedBox(height: 20),
        ChangeNotifierProvider<UserViewModel>(
            create: (context) => userViewModel,
            child: Consumer<UserViewModel>(builder: (context, value, child) {
              switch (value.usersList.status) {
                case Status.ERROR:
                  debugPrint(value.usersList.message);
                  return Container();

                case Status.COMPLETED:
                  final users = value.usersList.data!;

                  return Column(children: [
                    FacultyDropDown(
                        items: users
                            .where((user) => user.role == "Faculty")
                            .toList(),
                        hint: "Select Faculty",
                        onChanged: (value) {
                          widget.faculty.value = widget.faculty.value
                              .copyWith(text: value!.id.toString());
                        }),
                    const SizedBox(height: 20),
                    FacultyDropDown(
                        items: users
                            .where((user) => user.role == "Observer")
                            .toList(),
                        hint: "Select Observer",
                        onChanged: (value) {
                          widget.observer.value = widget.observer.value
                              .copyWith(text: value!.id.toString());
                        }),
                    const SizedBox(height: 20)
                  ]);

                default:
                  return Container();
              }
            })),
        const SizedBox(height: 20),
        MyElevatedButton(
            title: "Apply",
            onTap: () {
              Navigator.pop(context);
            }),
        const SizedBox(height: 20),
      ]),
    );
  }
}
