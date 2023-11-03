import 'package:flutter/material.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/services/formatter/date_formatter.dart';
import 'package:sotl/theme/theme.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';

class ObservationDetailCard extends StatelessWidget {
  final DetailObservationModel obs;
  final String title;
  final bool isNotStarted, isDisabled, isButton, isScheduling;
  final Function()? onTap, onTapPlan;

  const ObservationDetailCard(
      {super.key,
      required this.obs,
      required this.title,
      this.onTapPlan,
      this.onTap,
      this.isScheduling = true,
      this.isButton = false,
      this.isDisabled = false,
      this.isNotStarted = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          InkWell(
            onTap: !isDisabled ? onTap : null,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                  color: LightColorTheme.kPrimary,
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(10),
                      topRight: Radius.circular(10))),
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: const TextStyle(
                    fontSize: 20,
                    color: Colors.white,
                    fontWeight: FontWeight.w600),
              ),
            ),
          ),
          if (isNotStarted) ...[
            Padding(
              padding: const EdgeInsets.all(20),
              child: Text("Not Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: Colors.grey.shade700,
                      fontSize: 18,
                      fontWeight: FontWeight.w600)),
            ),
            if (isButton) ...[
              SizedBox(
                  width: 200,
                  child: MyElevatedButton(
                      buttonColor: LightColorTheme.kPrimary,
                      title: "SELECT COURSE",
                      onTap: onTap)),
              const SizedBox(
                height: 20,
              ),
            ]
          ] else ...[
            if (isScheduling) ...[
              Column(
                children: [
                  customWidget(context,
                      title: "Slot By Observer",
                      value: obs.obsRequest?.timeSlotByObserver != null &&
                              obs.obsRequest!.timeSlotByObserver!.isNotEmpty
                          ? "${obs.obsRequest?.timeSlotByObserver?[0].day} ${obs.obsRequest?.timeSlotByObserver?[0].time}"
                          : "---"),
                  customWidget(context,
                      title: "Slot By Faculty",
                      value: obs.obsRequest?.timeSlotsByFaculty != null &&
                              obs.obsRequest!.timeSlotsByFaculty!.isNotEmpty
                          ? "${obs.obsRequest?.timeSlotsByFaculty?[0].day} ${obs.obsRequest?.timeSlotsByFaculty?[0].time}"
                          : "---"),
                  customWidget(context,
                      title: "Teaching Plan", isView: true, onTap: onTapPlan),
                  customWidget(context,
                      title: "Status",
                      value: obs.obsRequest?.status ?? "Incompleted",
                      textColor: obs.obsRequest!.status! == "Completed"
                          ? Colors.green
                          : obs.obsRequest!.status! == "Ongoing"
                              ? Colors.blue
                              : null),
                ],
              )
            ] else ...[
              customWidget(context,
                  title: "Rubrics Score (avg. observer and faculty)",
                  value:
                      "${obs.meetings!.informedObservation!.facultyScore!.toDouble() + obs.meetings!.informedObservation!.observerScore!.toDouble()} / 80.0"),
              customWidget(context,
                  title: "Schedule on",
                  value: DateFormatter.dateFormatter(
                      obs.obsRequest!.scheduledOn!)),
              customWidget(context,
                  title: "Status",
                  value: obs.meetings!.informedObservation!.status ??
                      "Incompleted",
                  textColor: obs.meetings!.informedObservation!.status ==
                          "Completed"
                      ? Colors.green
                      : obs.meetings!.informedObservation!.status == "Ongoing"
                          ? Colors.blue
                          : null),
            ]
          ]
        ],
      ),
    );
  }

  Widget customWidget(context,
      {required String title,
      String? value,
      bool isView = false,
      Function()? onTap,
      Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: MediaQuery.sizeOf(context).width * 0.4,
            child: Text(title,
                style: TextStyle(
                    color: Colors.grey.shade700,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ),
          if (isView) ...[
            InkWell(
              onTap: onTap,
              child: Icon(
                Icons.visibility_outlined,
                color: onTap != null ? LightColorTheme.kPrimary : Colors.grey,
              ),
            )
          ] else ...[
            Text(value!,
                style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w600)),
          ]
        ],
      ),
    );
  }
}
