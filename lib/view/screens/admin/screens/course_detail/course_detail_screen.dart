import 'package:flutter/material.dart';
import 'package:sotl/models/course/course_model.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';

class CourseDetailScreen extends StatelessWidget {
  final CourseModel course;

  CourseDetailScreen({super.key, required this.course});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(scaffoldKey, context, title: course.name),
      body: SingleChildScrollView(
        child: Padding(padding: const EdgeInsets.all(20), child: Column(
          children: [
            Container()
          ],
        )),
      )
    );
  }
}
