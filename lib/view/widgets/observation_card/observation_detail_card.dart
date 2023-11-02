import 'package:flutter/material.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/theme/theme.dart';

class ObservationDetailCard extends StatelessWidget {
  final DetailObservationModel obs;
  final String title;
  final bool isNotStarted;

  const ObservationDetailCard(
      {super.key,
      required this.obs,
      required this.title,
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
          Container(
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
          if (isNotStarted) ...[
            const Padding(
              padding: EdgeInsets.all(10),
              child: Text("Not Started",
                  textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
            ),
          ] else ...[
            Column(
              children: [
                customWidget(
                    title: "Slot By Observer", value: "Tuesday 11:45"),
                customWidget(
                    title: "Slot By Faculty", value: "Tuesday 11:45"),
                customWidget(title: "Teaching Plan", isView: true),
                customWidget(
                    title: "Status",
                    value: obs.observationStatus ?? "Incompleted"),
              ],
            )
          ]
        ],
      ),
    );
  }

  Widget customWidget(
      {required String title,
      String? value,
      bool isView = false,
      Color? textColor}) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
          if (isView) ...[
            Icon(
              Icons.visibility_outlined,
              color: LightColorTheme.kPrimary,
            )
          ] else ...[
            Text(value!,
                style:
                    const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
          ]
        ],
      ),
    );
  }
}
