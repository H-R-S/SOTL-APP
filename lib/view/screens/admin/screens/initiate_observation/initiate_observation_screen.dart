import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../view_models/course/course_view_model.dart';
import '../../../../../view_models/observation/observation_view_model.dart';
import '../../../../../view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/button/my_elevated_button.dart';
import '../../../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../../../widgets/search_drop_down/search_drop_down.dart';

class InitiateObservationScreen extends StatefulWidget {
  const InitiateObservationScreen({super.key});

  @override
  State<InitiateObservationScreen> createState() =>
      _InitiateObservationScreenState();
}

class _InitiateObservationScreenState extends State<InitiateObservationScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController facultyController = TextEditingController();
  final TextEditingController observerController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  UserViewModel userViewModel = UserViewModel();
  CourseViewModel courseViewModel = CourseViewModel();

  List<int> facultyIdList = [];

  @override
  void initState() {
    userViewModel.getAllUsers();
    courseViewModel.getAllCourses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final observationViewModel = Provider.of<ObservationViewModel>(context);

    return Scaffold(
        appBar: MyAppBar(isBack: true, title: "Initiate Observation"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  ChangeNotifierProvider<UserViewModel>(
                      create: (context) => userViewModel,
                      child: Consumer<UserViewModel>(
                          builder: (context, value, child) {
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
                                    facultyController.value = facultyController
                                        .value
                                        .copyWith(text: value!.id.toString());
                                  }),
                              const SizedBox(height: 20),
                              FacultyDropDown(
                                  items: users
                                      .where((user) => user.role == "Observer")
                                      .toList(),
                                  hint: "Select Observer",
                                  onChanged: (value) {
                                    observerController.value =
                                        observerController.value.copyWith(
                                            text: value!.id.toString());
                                  }),
                              const SizedBox(height: 20)
                            ]);

                          default:
                            return const MyLoadingIndicator();
                        }
                      })),
                  SearchDropDown(
                      items: const ["Spring", "Summer", "Fall"],
                      hint: "Select Semester",
                      onChanged: (value) {
                        semesterController.value =
                            semesterController.value.copyWith(text: value);
                      }),
                  const SizedBox(height: 40),
                  MyElevatedButton(
                      isLoading: observationViewModel.loading,
                      title: "Initiate",
                      onTap: () {
                        observationViewModel
                            .initiateObservation(
                                context,
                                facultyController.text,
                                observerController.text,
                                semesterController.text)
                            .then((value) {
                          facultyController.clear();
                          observerController.clear();
                          semesterController.clear();
                        });
                      })
                ]))));
  }
}
