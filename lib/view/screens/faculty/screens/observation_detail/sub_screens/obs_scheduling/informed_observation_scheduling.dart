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
  ObservationViewModel observationModel;

  InformedObservationScheduling(
      {super.key, required this.observationId, required this.observationModel});

  @override
  State<InformedObservationScheduling> createState() =>
      _InformedObservationSchedulingState();
}

class _InformedObservationSchedulingState
    extends State<InformedObservationScheduling> {
  final TextEditingController courseIdController = TextEditingController();

  // // Show Dialog after Delat
  // void _showAlertDialogDelayed(ObservationViewModel observationModel) {
  //   Future.delayed(const Duration(milliseconds: 1000), () {
  //     _showAlertDialog(context, observationModel);
  //   });
  // }

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
            Consumer<ObservationViewModel>(builder: (newContext, value, child) {
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
                      const SizedBox(height: 10),
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

                      if (userViewModel.userRole == "Observer")
                        getObserverView(
                          newContext: newContext,
                          obsDetail: obsDetail,
                          valueData: value,
                        )
                      else if (userViewModel.userRole == "Faculty")
                        if (obsDetail.obsRequest ==
                            null) // Observer not selected course
                          const Center(
                            child: Text(
                              "Course not selected by Observer",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.red,
                                  fontSize: 16),
                            ),
                          )
                        else if (obsDetail.obsRequest!.teachingPlan!.editedBy ==
                            null) // Faculty not completed teaching plan

                          TeachingPlanWidget(
                            teachingPlan: obsDetail.obsRequest!.teachingPlan!,
                            facultyId: obsDetail.facultyId!,
                            observationId: obsDetail.id!,
                            submitPlan: (List<Map<String, dynamic>> abc,
                                int templateId, int editedBy) {
                              value.submitTeachingPlan(context,
                                  obsId: obsDetail.id!,
                                  steps: abc,
                                  templateId: templateId,
                                  facultyId: editedBy);
                            },
                            hideTeachinPlan: null,
                          )
                        else
                          //
                          value.getshowTeachingPlan() == false
                              ? Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    const SizedBox(height: 30),
                                    Row(
                                      children: [
                                        const Text("View Teaching Plan: ",
                                            style: TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontSize: 16)),
                                        const SizedBox(width: 20),
                                        GestureDetector(
                                          onTap: () =>
                                              value.setshowTeachingPlan(),
                                          child: Container(
                                            decoration: const BoxDecoration(
                                                color: primary,
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(5))),
                                            padding: const EdgeInsets.all(5.0),
                                            height: 30,
                                            width: 40,
                                            child: const Icon(
                                              Icons.visibility,
                                              size: 20,
                                              color: Colors.white,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(height: 30),
                                    SelectSlotScreen(
                                      obsDetail: obsDetail,
                                      // observerSlots:
                                      //     obsDetail.obsRequest!.timeSlotsByFaculty ??
                                      //         [],
                                      // observationId: obsDetail.id!,
                                      // facultyId: obsDetail.facultyId!,
                                      // courses: obsDetail.faculty!.courseSlots!
                                    ),
                                  ],
                                )
                              : TeachingPlanWidget(
                                  teachingPlan:
                                      obsDetail.obsRequest!.teachingPlan!,
                                  facultyId: obsDetail.facultyId!,
                                  observationId: obsDetail.id!,
                                  submitPlan: null,
                                  hideTeachinPlan: () =>
                                      value.setshowTeachingPlan())
                    ]),
              );

            default:
              return const MyLoadingIndicator();
          }
        }),
        // ),
      ),
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

  _selectDateByObserver({required BuildContext context}) {
    return
        // showDialog(
        //     barrierDismissible: true,
        //     context: context,
        //     builder: (BuildContext context) {
        //       return AlertDialog(
        //         shape: RoundedRectangleBorder(
        //           borderRadius: BorderRadius.circular(10),
        //         ),
        //         title: const Text("Select Observation Date"),
        //         content:
        Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10.0),
        // SizedBox(
        //   height: 80,
        //   child:
        //   Scrollbar(
        //     child: ListView.builder(
        //       shrinkWrap: true,
        //       itemCount: 10,
        //       itemBuilder: (BuildContext context, int index) {
        //         return Row(
        //           mainAxisAlignment: MainAxisAlignment.center,
        //           children: [
        //             Container(
        //               margin: const EdgeInsets.symmetric(vertical: 5.0),
        //               padding: const EdgeInsets.symmetric(
        //                   vertical: 5.0, horizontal: 5.0),
        //               decoration: BoxDecoration(
        //                 border: Border.all(color: primary),
        //                 borderRadius: BorderRadius.circular(8),
        //               ),
        //               child: const Text("Wednesday | 8:30 | E601"),
        //             ),
        //           ],
        //         );
        //       },
        //     ),
        //   ),
        // ),
        const SizedBox(height: 20.0),
        const Text("Provide Date"),
        const SizedBox(height: 10.0),
        GestureDetector(
          onTap: () => widget.observationModel.selectDate(context),
          child: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 4.0, horizontal: 10.0),
            width: MediaQuery.of(context).size.width *
                0.7, // Change as per your requirement
            decoration: BoxDecoration(
              border: Border.all(color: primary),
            ),
            child: Text(
              widget.observationModel.datePicked,
              style: const TextStyle(fontSize: 16),
            ),
          ),
        )
      ],
    );
    // actions: [
    // ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //         shape: RoundedRectangleBorder(
    //             borderRadius: BorderRadius.circular(4)),
    //         backgroundColor: primary),
    //     onPressed: () {},
    //     child: const Text(
    //       'Start Scheduling',
    //       style: TextStyle(color: Colors.white),
    //     )),
    // ElevatedButton(
    //     style: ElevatedButton.styleFrom(
    //       shape: RoundedRectangleBorder(
    //           borderRadius: BorderRadius.circular(4)),
    //       backgroundColor: primary,
    //     ),
    //     onPressed: () {
    //       Navigator.pop(context);
    //     },
    //     child: const Text(
    //       'Cancel',
    //       style: TextStyle(color: Colors.white),
    //     )),
    // ],
    // );
    // });
  }

  // _showAlertDialog(context, ObservationViewModel observationViewModel) {
  //   // final providerObs =
  //   //     Provider.of<ObservationViewModel>(context, listen: false);

  //   return Future.delayed(const Duration(microseconds: 1000), () {
  //     showDialog(
  //         barrierDismissible: true,
  //         context: context,
  //         builder: (BuildContext context) {
  //           return AlertDialog(
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(10),
  //             ),
  //             title: const Text("Select Faculty course"),
  //             content: SizedBox(
  //               // Change as per your requirement
  //               width: MediaQuery.of(context).size.width *
  //                   0.7, // Change as per your requirement
  //               child: Scrollbar(
  //                 child: ListView.builder(
  //                   shrinkWrap: true,
  //                   itemCount: 20,
  //                   itemBuilder: (BuildContext context, int index) {
  //                     return Row(
  //                       children: [
  //                         Container(
  //                           margin: const EdgeInsets.symmetric(vertical: 10.0),
  //                           padding: const EdgeInsets.symmetric(
  //                               vertical: 10.0, horizontal: 10.0),
  //                           decoration: BoxDecoration(
  //                             border: Border.all(color: primary),
  //                             borderRadius: BorderRadius.circular(8),
  //                           ),
  //                           child: const Text("Embedded Systems"),
  //                         ),
  //                       ],
  //                     );
  //                   },
  //                 ),
  //               ),
  //             ),
  //             actions: [
  //               ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                       shape: RoundedRectangleBorder(
  //                           borderRadius: BorderRadius.circular(4)),
  //                       backgroundColor: primary),
  //                   onPressed: () {
  //                     observationViewModel.setCourseSelected(true);
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text(
  //                     'Start Scheduling',
  //                     style: TextStyle(color: Colors.white),
  //                   )),
  //               ElevatedButton(
  //                   style: ElevatedButton.styleFrom(
  //                     shape: RoundedRectangleBorder(
  //                         borderRadius: BorderRadius.circular(4)),
  //                     backgroundColor: primary,
  //                   ),
  //                   onPressed: () {
  //                     Navigator.pop(context);
  //                   },
  //                   child: const Text(
  //                     'Cancel',
  //                     style: TextStyle(color: Colors.white),
  //                   )),
  //             ],
  //           );
  //         });
  //   });
  // }

  Widget getObserverView(
      {required DetailObservationModel obsDetail,
      required ObservationViewModel valueData,
      required BuildContext newContext}) {
    return obsDetail.courseId != null // If Course Selected by Observer
        ? obsDetail.obsRequest!.timeSlotsByFaculty!
                .isNotEmpty // If Time Slot Selected by Faculty
            ? Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  obsDetail.obsRequest!.facultyAccepted == true
                      ? SizedBox(
                          width: 120,
                          child: MyElevatedButton(
                              isLoading: valueData.loading,
                              title: "Confirm",
                              onTap: () {
                                // value.updateObserverTimeSlot(
                                //   context,
                                //   slotId: [
                                //     int.parse(obsDetail
                                //         .obsRequest!.timeSlotsByFaculty![0].id
                                //         .toString())
                                //   ],
                                //   observationId: value.observationDetail.data!.id!,
                                // );
                                valueData.confirmObserverTimeSlot(
                                  context,
                                  observationId:
                                      valueData.observationDetail.data!.id!,
                                  // slotId: [
                                  //   int.parse(obsDetail
                                  //       .obsRequest!.timeSlotsByFaculty![0].id
                                  //       .toString())
                                  // ],
                                );
                              }),
                        )
                      : _selectDateByObserver(context: context),
                  const SizedBox(height: 20),
                  const Text(
                    "Time slot by faculty: ",
                    style: TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  ListView.builder(
                    shrinkWrap: true,
                    itemCount: obsDetail.obsRequest!.timeSlotsByFaculty!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      TimeSlotByFaculty data =
                          obsDetail.obsRequest!.timeSlotsByFaculty![index];
                      return Align(
                        alignment: Alignment.centerLeft,
                        child: FilterChip(
                          side: valueData.getSlotIndex() == index
                              ? null
                              : const BorderSide(color: Colors.black),
                          onSelected: (_) => valueData.setSlotIndex(index),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2),
                            side: const BorderSide(color: Colors.black),
                          ),
                          backgroundColor: valueData.getSlotIndex() == index
                              ? Colors.amber
                              : Colors.white,
                          label: Text(
                            "${data.day} | ${data.time} | ${data.location}",
                            style: const TextStyle(fontSize: 16),
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 50),
                  Align(
                    alignment: Alignment.center,
                    child: ElevatedButton(
                      onPressed: valueData.getSlotIndex() == -1 ||
                              valueData.datePicked == "dd/mm/yyyy"
                          ? null
                          : () {
                              debugPrint(
                                  "Get all timeslotbyFaculty: ${obsDetail.obsRequest!.timeSlotsByFaculty![0].id}");
                              valueData.updateObserverTimeSlot(
                                newContext,
                                slotId: [
                                  // Time Slot selected by Observer
                                  int.parse(obsDetail
                                      .obsRequest!
                                      .timeSlotsByFaculty![
                                          valueData.getSlotIndex()]
                                      .id
                                      .toString())
                                ],
                                observationId:
                                    valueData.observationDetail.data!.id!,
                              );
                            },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primary,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(
                              8), // Adjust the value as needed
                        ),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
                      ),
                      child: const Text(
                        'Update',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.white, // Set the text color
                        ),
                      ),
                    ),
                  ),
                  //  _showAlertDialog(context, value),
                ],
              )
            // If Time Slot Not Selected by Faculty
            : const Text("Faculty not provided any time slots yet...",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 16))
        : courseNotSelected(context, // If Course Not Selected by Observer
            courses: obsDetail.faculty!.courseSlots!,
            facultyId: obsDetail.facultyId!,
            observationId: obsDetail.id!);
  }
}
