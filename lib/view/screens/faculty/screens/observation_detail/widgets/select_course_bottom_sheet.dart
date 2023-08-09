import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:sotl/view/widgets/search_drop_down/search_drop_down.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';

class SelectCourseBottomSheet extends StatelessWidget {
  final int facultyId;
  final int observationId;
  final List<CourseSlots> courses;

  SelectCourseBottomSheet(
      {super.key,
      required this.courses,
      required this.observationId,
      required this.facultyId});

  final TextEditingController courseId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final observationViewModel = Provider.of<ObservationViewModel>(context);
    return Padding(
      padding: const EdgeInsets.all(20).copyWith(top: 40),
      child: Column(
        children: [
          CourseSlotDropDown(
              items: courses,
              hint: "Select Course",
              onChanged: (value) {
                courseId.value =
                    courseId.value.copyWith(text: value!.courseId.toString());
                print("course: ${value.courseId}");
              }),
          const SizedBox(height: 40),
          MyElevatedButton(
              isLoading: observationViewModel.loading,
              title: "Confirm",
              onTap: () {
                debugPrint("fID: $facultyId");
                debugPrint("OID: $observationId");
                debugPrint("cID: ${courseId.text}");
                observationViewModel.startScheduling(context,
                    observationId: observationId,
                    facultyId: facultyId,
                    courseId: int.parse(courseId.text));
              }),
          const SizedBox(height: 40)
        ],
      ),
    );
  }
}
