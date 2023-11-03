import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/theme/theme.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';

class ObserverSelectSlotScreen extends StatelessWidget {
  final DetailObservationModel obs;

  ObserverSelectSlotScreen({super.key, required this.obs});

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
        if (obs.obsRequest!.facultyAccepted!) ...[
          Padding(
            padding: const EdgeInsets.all(10),
            child: MyElevatedButton(
              isLoading: observationViewModel.loading,
              title: "Confirm",
              onTap: () {
                observationViewModel.confirmObserverTimeSlot(
                  context,
                  observationId: obs.id!,
                );
              },
            ),
          ),
        ] else ...[
          Padding(
            padding: const EdgeInsets.all(10),
            child: MyElevatedButton(
              isLoading: observationViewModel.loading,
              title: "Update",
              onTap: () {
                debugPrint(
                    "Get all timeslotbyFaculty: ${obs.obsRequest!.timeSlotsByFaculty![0].id}");
                observationViewModel.updateObserverTimeSlot(
                  context,
                  slotId: [
                    // Time Slot selected by Observer
                    int.parse(obs
                        .obsRequest!
                        .timeSlotsByFaculty![
                            observationViewModel.getSlotIndex()]
                        .id
                        .toString())
                  ],
                  observationId: obs.id!,
                );
              },
            ),
          ),
        ],
      ],
      body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              if (obs.obsRequest!.facultyAccepted!) ...[
                const SizedBox(height: 20),
                Row(
                  children: [
                    const Text(
                      "*",
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                    Text(
                      "FACULTY ACCEPTED DAY AND SLOT",
                      style: TextStyle(
                          color: LightColorTheme.kPrimary,
                          fontWeight: FontWeight.w600,
                          fontSize: 16),
                    ),
                  ],
                ),
              ],
              const SizedBox(height: 20),
              const Text(
                "Time slot by faculty: ",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              const SizedBox(height: 10),
              if (obs.obsRequest!.timeSlotsByFaculty != null) ...[
                ListView.builder(
                  shrinkWrap: true,
                  itemCount: obs.obsRequest!.timeSlotsByFaculty!.length,
                  physics: const NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    TimeSlotByFaculty data =
                        obs.obsRequest!.timeSlotsByFaculty![index];
                    return Consumer<ObservationViewModel>(
                      builder: (context, value, child) {
                        return Align(
                          alignment: Alignment.centerLeft,
                          child: FilterChip(
                            side: value.getSlotIndex() == index
                                ? null
                                : const BorderSide(color: Colors.black),
                            onSelected: (_) => value.setSlotIndex(index),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5),
                              side: const BorderSide(color: Colors.black),
                            ),
                            backgroundColor: value.getSlotIndex() == index
                                ? LightColorTheme.kPrimary
                                : Colors.white,
                            label: Text(
                              "${data.day} | ${data.time} | ${data.location}",
                              style: TextStyle(
                                  color: value.getSlotIndex() == index
                                      ? Colors.white
                                      : null,
                                  fontSize: 16),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
                const SizedBox(height: 20.0),
                const Text(
                  "Provide Date",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
                ),
                const SizedBox(height: 10.0),
                Consumer<ObservationViewModel>(
                  builder: (context, value, child) {
                    return GestureDetector(
                      onTap: () => value.selectDate(context),
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 10.0),
                        width: MediaQuery.of(context).size.width *
                            0.7, // Change as per your requirement
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(
                              color: LightColorTheme.kBorderLightColor),
                        ),
                        child: Text(
                          value.datePicked,
                          style: const TextStyle(fontSize: 16),
                        ),
                      ),
                    );
                  },
                ),
              ] else ...[
                const Text("Faculty not provided any time slots yet...",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.red,
                        fontSize: 16))
              ]
            ],
          )),
    );
  }
}
