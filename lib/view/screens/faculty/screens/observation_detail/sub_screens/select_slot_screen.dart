import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:sotl/view/widgets/search_drop_down/search_drop_down.dart';
import 'package:sotl/view/widgets/text_field/my_text_field.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';

// Faculty
class SelectSlotScreen extends StatelessWidget {
  final List<TimeSlotByFaculty> observerSlots;
  final List<CourseSlots> courses;
  final int facultyId;
  final int observationId;

  SelectSlotScreen(
      {super.key,
      required this.observerSlots,
      required this.courses,
      required this.facultyId,
      required this.observationId});

  final TextEditingController courseId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final observationViewModel =
        Provider.of<ObservationViewModel>(context, listen: false);

    return Column(children: [
      // if (courses.isNotEmpty != null)
      //   MyTextField(
      //     isReadable: true,
      //     controller: courseId,
      //     header: "Observer Slot",
      //     hint: observerSlots[0].courseId.toString(),
      //   )
      // else
      CourseSlotDropDown(
          items: courses,
          hint: "Select Course",
          onChanged: (value) {
            courseId.value =
                courseId.value.copyWith(text: value!.id.toString());
            debugPrint("course: ${value.courseId}");
          }),
      const SizedBox(height: 40),
      MyElevatedButton(
          isLoading: observationViewModel.loading,
          title: "Confirm",
          onTap: () {
            debugPrint("fID: $facultyId");
            debugPrint("OID: $observationId");
            debugPrint("cID: ${courseId.text}");

            observationViewModel.updateFacultyTimeSlot(context,
                slotIds: [int.parse(courses[0].id.toString())],
                observationId: observationId,
                facultyId: facultyId);
          }),
      const SizedBox(height: 40)
    ]);
  }
}
