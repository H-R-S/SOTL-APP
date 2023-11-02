import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:sotl/view/widgets/search_drop_down/search_drop_down.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';

// Faculty
class SelectSlotScreen extends StatelessWidget {
  final DetailObservationModel obs;

  SelectSlotScreen({super.key, required this.obs});

  final TextEditingController courseId = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final observationViewModel =
        Provider.of<ObservationViewModel>(context, listen: false);

    return Scaffold(
      appBar: const MyAppBar(
        isBack: true,
        title: "Select Slot",
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: MyElevatedButton(
              isLoading: observationViewModel.loading,
              title: "Update",
              onTap: () {
                debugPrint("fID: ${obs.facultyId!}");
                debugPrint("OID: ${obs.id!}");
                debugPrint("cID: ${courseId.text}");

                observationViewModel.updateFacultyTimeSlot(context,
                    slotIds: [
                      int.parse(obs.faculty!.courseSlots![0].id.toString())
                    ],
                    observationId: obs.id!,
                    facultyId: obs.facultyId!);
              }),
        ),
      ],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(children: [
          CourseSlotDropDown(
              items: obs.faculty!.courseSlots!,
              hint: "Select Course",
              onChanged: (value) {
                courseId.value =
                    courseId.value.copyWith(text: value!.id.toString());
                debugPrint("course: ${value.courseId}");
              }),
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
