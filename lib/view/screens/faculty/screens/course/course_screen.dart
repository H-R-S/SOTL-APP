import 'package:flutter/material.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/course_container/course_container.dart';

class FacultyCourseScreen extends StatelessWidget {
  FacultyCourseScreen({Key? key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Courses"),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              CourseContainer(
                  name: "FINAL YEAR PROJECT - II",
                  timings: "(Thursday 15:00:00 18:00:00)",
                  instructorName: "Shearaz Ahmed"),
              CourseContainer(
                  name: "PROBABILTY AND STATISTICS",
                  timings: "(Monday 15:00:00 18:00:00)",
                  instructorName: "Shearaz Ahmed")
            ])));
  }
}
