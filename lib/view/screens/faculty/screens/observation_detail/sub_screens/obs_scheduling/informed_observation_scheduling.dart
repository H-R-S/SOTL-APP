import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/resources/constants/style.dart';
import 'package:sotl/view/screens/faculty/screens/observation_detail/sub_screens/obs_scheduling/teaching_plan.dart';
import 'package:sotl/view/screens/faculty/screens/observation_detail/sub_screens/select_slot_screen.dart';
import 'package:sotl/view/screens/faculty/screens/observation_detail/widgets/select_course_bottom_sheet.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:sotl/view/widgets/loading_indicator/my_loading_indicator.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';
import 'package:sotl/view_models/user/user_view_model.dart';

class InformedObservationScheduling extends StatefulWidget {
  final int observationId;
  ObservationViewModel observationModel = ObservationViewModel();

  InformedObservationScheduling(
      {super.key, required this.observationId, required this.observationModel});

  @override
  State<InformedObservationScheduling> createState() =>
      _InformedObservationSchedulingState();
}

class _InformedObservationSchedulingState
    extends State<InformedObservationScheduling> {
  final TextEditingController courseIdController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);
    return GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child:
              //  ChangeNotifierProvider<ObservationViewModel>(
              //   create: (context) => widget.observationModel,
              //   child:
              Consumer<ObservationViewModel>(builder: (context, value, child) {
            switch (value.observationDetail.status) {
              case Status.ERROR:
                debugPrint("err: ${value.observationDetail.message}");
                return Container();

              case Status.COMPLETED:
                final obsDetail = value.observationDetail.data!;
                debugPrint("courseId: ${obsDetail.courseId.toString()}");

                return SingleChildScrollView(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          "INFORMED OBSERVATION SCHEDULING",
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 20),
                        // const Row(
                        //   children: [
                        //     Text(
                        //       "Slot By Observer: ",
                        //       style: TextStyle(fontSize: 16),
                        //     ),
                        //     Text(
                        //       "Slot By Observer: ",
                        //       style: TextStyle(fontSize: 16),
                        //     ),
                        //   ],
                        // ),
                        // const Row(
                        //   children: [
                        //     Text(
                        //       "Slot By Observer: ",
                        //       style: TextStyle(fontSize: 16),
                        //     ),
                        //     Text(
                        //       "Slot By Observer: ",
                        //       style: TextStyle(fontSize: 16),
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   children: [
                        //     const Text(
                        //       "Teaching Plan: ",
                        //       style: TextStyle(fontSize: 16),
                        //     ),
                        //     GestureDetector(
                        //       onTap: () {
                        //         print('Text Tapped!');
                        //       },
                        //       child: const Text(
                        //         "Download",
                        //         style: TextStyle(
                        //           color: Colors.blue,
                        //           decoration: TextDecoration.underline,
                        //           fontSize: 16,
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        const SizedBox(height: 20),
                        if (userViewModel.userRole == "Observer")
                          obsDetail.courseId != null
                              ? obsDetail.obsRequest!.timeSlotsByFaculty!
                                      .isNotEmpty
                                  ? Column(
                                      children: [
                                        ListView.builder(
                                          shrinkWrap: true,
                                          itemCount: obsDetail.obsRequest!
                                              .timeSlotsByFaculty!.length,
                                          itemBuilder: (context, index) {
                                            TimeSlotByFaculty data = obsDetail
                                                .obsRequest!
                                                .timeSlotsByFaculty![index];
                                            return Text(
                                              "Time slot by faculty: ${data.day} | ${data.time} | ${data.location}",
                                              style:
                                                  const TextStyle(fontSize: 16),
                                            );
                                          },
                                        ),
                                        const SizedBox(height: 20),
                                        SizedBox(
                                          width: 120,
                                          child: MyElevatedButton(
                                              isLoading: value.loading,
                                              title: "Confirm",
                                              onTap: () {
                                                // debugPrint("fID: $facultyId");
                                                // debugPrint("OID: $observationId");
                                                // debugPrint("cID: ${courseId.text}");

                                                value.updateObserverTimeSlot(
                                                  context,
                                                  slotId: [
                                                    int.parse(obsDetail
                                                        .obsRequest!
                                                        .timeSlotsByFaculty![0]
                                                        .id
                                                        .toString())
                                                  ],
                                                  observationId: value
                                                      .observationDetail
                                                      .data!
                                                      .id!,
                                                );
                                              }),
                                        ),
                                      ],
                                    )
                                  : const Text(
                                      "The Teaching Plan not submitted by Faculty yet!",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.red,
                                          fontSize: 16))
                              : courseNotSelected(context,
                                  courses: obsDetail.faculty!.courseSlots!,
                                  facultyId: obsDetail.facultyId!,
                                  observationId: obsDetail.id!)
                        else if (obsDetail
                                .obsRequest!.teachingPlan![0].editedBy !=
                            null)
                          SelectSlotScreen(
                              observerSlots:
                                  obsDetail.obsRequest!.timeSlotsByFaculty ??
                                      [],
                              observationId: obsDetail.id!,
                              facultyId: obsDetail.facultyId!,
                              courses: obsDetail.faculty!.courseSlots!)
                        else
                          TeachingPlanWidget(
                              teachingPlan:
                                  obsDetail.obsRequest!.teachingPlan![0])
                      ]),
                );

              default:
                return const MyLoadingIndicator();
            }
          }),
        )
        // ),
        );
  }

  Widget courseNotSelected(context,
      {required List<CourseSlots> courses,
      required int facultyId,
      required int observationId}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          const Text('Observation not started',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 16)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              showModalBottomSheet(
                  context: context,
                  builder: (context) => SelectCourseBottomSheet(
                      courses: courses,
                      observationId: observationId,
                      facultyId: facultyId));
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Adjust the value as needed
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: const Text(
              'Select Course',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white, // Set the text color
              ),
            ),
          ),
        ]),
      ],
    );
  }

  void _showAlertDialog(context) {
    final providerObs =
        Provider.of<ObservationViewModel>(context, listen: false);

    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text("Select Faculty course"),
            content: SizedBox(
              // Change as per your requirement
              width: MediaQuery.of(context).size.width *
                  0.7, // Change as per your requirement
              child: Scrollbar(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: const Text("Embedded Systems"),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      backgroundColor: primary),
                  onPressed: () {
                    providerObs.setCourseSelected(true);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Start Scheduling',
                    style: TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    backgroundColor: primary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          );
        });
  }
}
