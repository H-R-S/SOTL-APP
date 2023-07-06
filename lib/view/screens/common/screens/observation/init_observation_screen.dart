// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../../../../../models/user/observer_model.dart';
import '../../../../../models/user/user_model.dart';
import '../../../../../resources/constants/style.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';

class InitiateObservation extends StatelessWidget {
  InitiateObservation({super.key});

  final formKey = GlobalKey<FormState>();
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // Controllers
  final TextEditingController observerController = TextEditingController();
  final TextEditingController facultyController = TextEditingController();
  final TextEditingController courseController = TextEditingController();
  final TextEditingController semesterController = TextEditingController();

  // Faculty List Demo
  List<ObserverModel> observers = [
    ObserverModel(name: "Dr. A"),
    ObserverModel(name: "Dr. B"),
    ObserverModel(name: "Dr. C")
  ];

  List<UserModel> faculties = [
    UserModel(name: "Faculty A"),
    UserModel(name: "Faculty B"),
    UserModel(name: "Faculty C")
  ];

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        appBar: MyAppBar(scaffoldKey, context,
            title: "Initiate Observation", isBack: true),
        body: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 25, vertical: 10.0),
                child:
                    //  ChangeNotifierProvider<CourseViewModel>(
                    //     create: (context) => courseViewModel,
                    //     child:
                    //         Consumer<CourseViewModel>(builder: (context, value, child) {
                    //       switch (value.courseList.status) {
                    //         case Status.ERROR:
                    //           if (kDebugMode) {
                    //             print(value.courseList.message);
                    //           }
                    //           return Container();

                    //         case Status.COMPLETED:
                    //           final course = value.courseList.data!;
                    //           // .where((course) => course.slots!
                    //           //     .every((slot) => slot.facultyId == null))
                    //           // .toList();

                    //           final slots = <Slots>[];

                    // return
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                      Text(
                        "Provide Observation Details",
                        style: TextStyle(
                          fontSize: 18,
                          decorationThickness: 2,
                          fontWeight: FontWeight.w600,
                          decoration: TextDecoration.underline,
                          color: Colors.transparent,
                          decorationColor: Styles.fontColor,
                          shadows: [
                            Shadow(
                                color: Styles.fontColor,
                                offset: Offset(0, -5))
                          ],
                        ),
                      ),

                      // CourseDropDown(
                      //     header: "Courses",
                      //     isRequired: true,
                      //     items: course,
                      //     hint: "Select Course",
                      //     onChanged: (value) {
                      //       slots.clear();
                      //       slots.addAll(value!.slots!
                      //           .where((slot) => slot.facultyId == null));
                      //       print(value.slots);
                      //     }),

                      const SizedBox(height: 10),
                      // CourseDropDown(
                      //     header: "Courses",
                      //     isRequired: true,
                      //     items: course,
                      //     hint: "Select Course",
                      //     onChanged: (value) {
                      //       slots.clear();
                      //       slots.addAll(value!.slots!
                      //           .where((slot) => slot.facultyId == null));
                      //       print(value.slots);
                      //     }),
                      const SizedBox(height: 15),
                      // SlotDropDown(
                      //     header: "Slots",
                      //     isRequired: true,
                      //     items: slots,
                      //     hint: "Select Slots",
                      //     onChanged: (value) {
                      //       courseIdList.add(value!.id.toString());
                      //     }),

                      const SizedBox(height: 40),
                      // MyElevatedButton(
                      //     isLoading: userViewModel.loading,
                      //     title: "Add Faculty",
                      //     onTap: () {
                      // final isValidate =
                      //     formKey.currentState!.validate();

                      // if (isValidate) {
                      // userViewModel
                      //     .createUser(
                      //         context,
                      //         UserModel(
                      //             name: nameController.text.trim(),
                      //             email: emailController.text.trim(),
                      //             campus: campusController.text,
                      //             department: departmentController.text,
                      //             role: roleController.text),
                      //         password: passwordController.text.trim(),
                      //         courseId: courseIdList)
                      //     .then((value) {

                      // });
                      // }
                      // }),
                      const SizedBox(height: 40)
                    ])
                // ;

                //   default:
                //     return const Center(
                //         child: CircularProgressIndicator(color: primary));
                // }
                // })
                ),
          ),
        ),
        // ),
      ),
    );
  }
}
