import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/view/widgets/course/course_bottom_sheet.dart';
import 'package:sotl/view/widgets/course_card/course_skeleton_card.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../view_models/course/course_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/course_card/course_card.dart';
import '../../../../widgets/search_bar/my_search_bar.dart';

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
        appBar: MyAppBar(
            title: "Courses",
            actionIcon: Icons.add,
            onTapAction: () => showCourseBottomSheet(context)),
        body: Column(children: [
          const SizedBox(
            height: 16,
          ),
          MySearchBar(
              hint: "Search Courses",
              controller: searchController,
              onChanged: (value) {}),
          const SizedBox(height: 6),
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
                                course: course,
                              );
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
        ]));
  }
}
