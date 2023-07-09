import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/view/widgets/loading_indicator/my_loading_indicator.dart';
import 'package:sotl/view_models/course/course_view_model.dart';
import 'package:sotl/view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/course_container/course_container.dart';

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
                builder: (context, snapshot) {
                  return Consumer<CourseViewModel>(
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

                              return CourseContainer(
                                  name: course.name ?? "",
                                  timings:
                                      "${course.slots![0].location} (${course.slots![0].time})",
                                  instructorName:
                                      course.slots![0].faculty!.name ?? "");
                            });

                      default:
                        return const MyLoadingIndicator();
                    }
                  });
                })));
  }
}
