import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/view/widgets/course_card/course_skeleton_card.dart';
import 'package:sotl/view_models/course/course_view_model.dart';
import 'package:sotl/view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/course_card/course_card.dart';

class FacultyCourseScreen extends StatefulWidget {
  const FacultyCourseScreen({super.key});

  @override
  State<FacultyCourseScreen> createState() => _FacultyCourseScreenState();
}

class _FacultyCourseScreenState extends State<FacultyCourseScreen> {
  CourseViewModel courseViewModel = CourseViewModel();

  @override
  void initState() {
    courseViewModel.getAllCourses();
    super.initState();
  }

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    userViewModel.getUser().then((value) {
      debugPrint("uid:${value.id.toString()}");
    });

    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Courses"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: ChangeNotifierProvider<CourseViewModel>(
                create: (context) => courseViewModel,
                child:
                    Consumer<CourseViewModel>(builder: (context, value, child) {
                  switch (value.courseList.status) {
                    case Status.ERROR:
                      debugPrint(value.courseList.message);
                      return Container();

                    case Status.COMPLETED:
                      final filteredCourses =
                          value.courseList.data!.where((course) {
                        return course.slots!.any(
                          (slot) => slot.facultyId == userViewModel.userId,
                        );
                      }).toList();

                      debugPrint(userViewModel.userId.toString());
                      debugPrint(
                          "Filtered  ${filteredCourses.length.toString()}");

                      return ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: filteredCourses.length,
                          itemBuilder: (context, index) {
                            final course = filteredCourses[index];

                            return CourseCard(
                                onTap: () {},
                                name: course.name ?? "",
                                timings:
                                    "${course.slots![0].location} (${course.slots![0].time})",
                                instructorName:
                                    course.slots![0].faculty!.name ?? "");
                          });

                    default:
                      return ListView.separated(
                        shrinkWrap: true,
                        itemCount: 5,
                        itemBuilder: (context, index) =>
                            const CourseSkeletonCard(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 30),
                      );
                  }
                }))));
  }
}
