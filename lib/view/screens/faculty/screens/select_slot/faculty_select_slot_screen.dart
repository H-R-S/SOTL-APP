import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/services/formatter/date_formatter.dart';
import 'package:sotl/theme/theme.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:sotl/view/widgets/search_drop_down/search_drop_down.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';

class FacultySelectSlotScreen extends StatelessWidget {
  final DetailObservationModel obs;

  FacultySelectSlotScreen({super.key, required this.obs});

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
        Column(
          children: [
            if (obs.obsRequest!.timeSlotByObserver != null &&
                obs.obsRequest!.timeSlotByObserver!.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.all(10),
                child: MyElevatedButton(
                    // isLoading: observationViewModel.loading,
                    title: "Done",
                    contentColor: LightColorTheme.kPrimary,
                    buttonColor: Colors.white,
                    onTap: () {
                      debugPrint("OID: ${obs.id!}");

                      observationViewModel.confirmFacultyTimeSlot(context,
                          observationId: obs.id!);
                    }),
              ),
            ],
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
        )
      ],
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          const Text(
            "Select slot: ",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
          ),
          CourseSlotDropDown(
              items: obs.faculty!.courseSlots!,
              hint: "Select Course",
              onChanged: (value) {
                courseId.value =
                    courseId.value.copyWith(text: value!.id.toString());
                debugPrint("course: ${value.courseId}");
              }),
          if (obs.obsRequest!.timeSlotByObserver != null &&
              obs.obsRequest!.timeSlotByObserver!.isNotEmpty) ...[
            const SizedBox(
              height: 20,
            ),
            const Text(
              "Slot(s) Selected by Observer: ",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
            ),
            ListView.builder(
              shrinkWrap: true,
              itemCount: obs.obsRequest!.timeSlotsByFaculty!.length,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                TimeSlotByObserver data =
                    obs.obsRequest!.timeSlotByObserver![index];
                return Consumer<ObservationViewModel>(
                  builder: (context, value, child) {
                    return Align(
                      alignment: Alignment.centerLeft,
                      child: FilterChip(
                        onSelected: (value) {},
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: BorderSide(color: LightColorTheme.kPrimary),
                        ),
                        backgroundColor: LightColorTheme.kPrimary,
                        label: Text(
                          "${data.day} | ${data.time} | ${data.location}, ${DateFormatter.dateFormatter(obs.obsRequest!.scheduledOn!)}",
                          style: const TextStyle(
                              color: Colors.white, fontSize: 16),
                        ),
                      ),
                    );
                  },
                );
              },
            ),
          ],
          const SizedBox(height: 40),
        ]),
      ),
    );
  }
}
