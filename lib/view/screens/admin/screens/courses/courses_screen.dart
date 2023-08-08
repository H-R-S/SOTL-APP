import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/view/widgets/course_card/course_skeleton_card.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../view_models/course/course_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/button/my_elevated_button.dart';
import '../../../../widgets/course_card/course_card.dart';
import '../../../../widgets/search_bar/my_search_bar.dart';
import '../add_course/add_course_screen.dart';
import '../assigned_course/assigned_course_screen.dart';

class CoursesScreen extends StatefulWidget {
  const CoursesScreen({super.key});

  @override
  State<CoursesScreen> createState() => _CoursesScreenState();
}

class _CoursesScreenState extends State<CoursesScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  final TextEditingController searchController = TextEditingController();

  CourseViewModel courseViewModel = CourseViewModel();

  @override
  void initState() {
    courseViewModel.getAllCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context,
            title: "Courses", actionIcon: Icons.add, onTapAction: () {
          showModalBottomSheet(
              context: context,
              builder: (context) => Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(mainAxisSize: MainAxisSize.min, children: [
                    MyElevatedButton(
                        title: "Add Course",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => AddCourseScreen()));
                        }),
                    const SizedBox(height: 20),
                    MyElevatedButton(
                        title: "Assigned Course",
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AssignedCourseScreen()));
                        }),
                    const SizedBox(height: 40)
                  ])));
        }),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              MySearchBar(
                  hint: "Search Courses",
                  controller: searchController,
                  onChanged: (value) {}),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: ChangeNotifierProvider<CourseViewModel>(
                      create: (context) => courseViewModel,
                      child: Consumer<CourseViewModel>(
                          builder: (context, value, child) {
                        switch (value.courseList.status) {
                          case Status.ERROR:
                            debugPrint(value.courseList.message);
                            return Container();

                          case Status.COMPLETED:
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: value.courseList.data!.length,
                                itemBuilder: (context, index) {
                                  final course = value.courseList.data![index];

                                  return CourseCard(
                                      onTap: () {},
                                      name: course.name ?? "",
                                      timings:
                                          "${course.slots![0].location} (${course.slots![0].time})",
                                      instructorName:
                                          course.slots![0].faculty?.name ?? "");
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
                      })),
                ),
              )
            ])));
  }
}
