import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/view/widgets/all_users_card/all_user_skeleton_card.dart';
import 'package:sotl/view/widgets/course_card/course_skeleton_card.dart';
import 'package:sotl/view/widgets/observation_card/observation_skeleton_card.dart';
import 'package:sotl/view_models/course/course_view_model.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';
import '../../../../../../data/enums/status.dart';
import '../../../../../../view_models/user/user_view_model.dart';
import '../../../../../widgets/all_users_card/all_users_card.dart';

class UserRecords extends StatefulWidget {
  const UserRecords({super.key});

  @override
  State<UserRecords> createState() => _UserRecordsState();
}

class _UserRecordsState extends State<UserRecords> {
  UserViewModel userViewModel = UserViewModel();
  CourseViewModel courseViewModel = CourseViewModel();
  ObservationViewModel observationViewModel = ObservationViewModel();

  bool isAdmin = false;
  bool isCampusDirector = false;
  bool isHOD = false;
  bool isDean = false;
  bool isObserver = false;
  bool isFaculty = false;
  int saveUserId = 0;

  @override
  void initState() {
    observationViewModel.getAllObservations();
    userViewModel.getAllUsers();
    userViewModel.getUser().then((value) {
      saveUserId = value.id!;
      switch (value.role) {
        case "Head_of_Department":
          return isHOD = true;
        case "Faculty":
          observationViewModel.getAllObservations();
          courseViewModel.getAllCourses();
          return isFaculty = true;

        default:
          null;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChangeNotifierProvider<UserViewModel>(
            create: (context) => userViewModel,
            child: Consumer<UserViewModel>(builder: (context, value, child) {
              switch (value.usersList.status) {
                case Status.ERROR:
                  return Container();

                case Status.COMPLETED:
                  final users = value.usersList.data!;

                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: [
                      AllUsersCard(
                        title: "Observer(s)",
                        value: users
                            .where((user) => user.role == "Observer")
                            .length,
                        onTap: () {},
                      ),
                      AllUsersCard(
                        title: "Faculty(s)",
                        value: users
                            .where((user) => user.role == "Faculty")
                            .length,
                        onTap: () {},
                      ),
                      AllUsersCard(
                        title: "Observation(s)",
                        value: observationViewModel.observationsList.data
                                ?.where((obs) => obs.hodId == value.userId)
                                .length ??
                            0,
                        onTap: () {},
                      ),
                    ],
                  );

                default:
                  return GridView.count(
                    shrinkWrap: true,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    crossAxisCount: 2,
                    children: const [
                      AllUsersSkeletonCard(),
                      AllUsersSkeletonCard(),
                      AllUsersSkeletonCard(),
                    ],
                  );
              }
            })),
      ],
    );
  }
}

class RecordsForFaculty extends StatelessWidget {
  const RecordsForFaculty({
    super.key,
    required this.courseViewModel,
    required this.saveUserId,
    required this.observationViewModel,
  });

  final CourseViewModel courseViewModel;
  final int saveUserId;
  final ObservationViewModel observationViewModel;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CourseViewModel>(
        create: (context) => courseViewModel,
        child: Consumer<CourseViewModel>(builder: (context, value2, child) {
          switch (value2.courseList.status) {
            case Status.ERROR:
              debugPrint(value2.courseList.message);
              return Center(
                child: Text("Error: ${value2.courseList.message}"),
              );
            case Status.COMPLETED:
              final filteredCourses = value2.courseList.data!.where((course) {
                return course.slots!.any(
                  (slot) => slot.facultyId == saveUserId,
                );
              }).toList();
              debugPrint("Filtered Courses: ${filteredCourses.length}");

              return ChangeNotifierProvider<ObservationViewModel>(
                  create: (context) => observationViewModel,
                  child: Consumer<ObservationViewModel>(
                      builder: (context, value3, child) {
                    switch (value3.observationsList.status) {
                      case Status.ERROR:
                        debugPrint(value3.observationsList.message);
                        return Container();

                      case Status.COMPLETED:
                        final observation = value3.observationsList.data!
                            .where((obs) => obs.facultyId == saveUserId)
                            .toList();

                        List<Map<String, dynamic>> recordData = [
                          {
                            "title": "Observations",
                            "value": observation.length
                          },
                          {
                            "title": "Assigned Courses",
                            "value": filteredCourses.length
                          }
                        ];
                        return GridView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 150,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              crossAxisCount: 2,
                            ),
                            itemCount: recordData.length,
                            itemBuilder: (context, index) {
                              return AllUsersCard(
                                title: recordData[index]["title"],
                                value: recordData[index]["value"],
                                onTap: () {
                                  // Navigator.push(
                                  //   context,
                                  //   MaterialPageRoute(
                                  //       builder: (context) =>
                                  //           const AddUserScreen(
                                  //               title:
                                  //                   "Facult")),
                                  // );
                                },
                              );
                            });
                      default:
                        return ListView.separated(
                          shrinkWrap: true,
                          itemCount: 5,
                          itemBuilder: (context, index) =>
                              const ObservationSkeletonCard(),
                          separatorBuilder: (context, index) =>
                              const SizedBox(height: 30),
                        );
                    }
                  }));

            default:
              return ListView.separated(
                shrinkWrap: true,
                itemCount: 5,
                itemBuilder: (context, index) => const CourseSkeletonCard(),
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 30),
              );
          }
        }));
  }
}
