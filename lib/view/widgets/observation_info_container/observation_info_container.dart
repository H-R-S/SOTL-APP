import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class ObservationInfoContainer extends StatelessWidget {
  final Color color;
  final String facultyName, observerName, status, obsPeriod;

  const ObservationInfoContainer(
      {super.key,
      this.color = Colors.white,
      required this.facultyName,
      required this.observerName,
      required this.status,
      required this.obsPeriod});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 16, color: primary);

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(boxShadow: const [
          BoxShadow(
              color: grey,
              spreadRadius: 1,
              blurRadius: 5,
              offset: Offset(0, 4)),
        ], borderRadius: BorderRadius.circular(10), color: color),
        child: FittedBox(
          child:
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text("Faculty", style: style.copyWith(fontSize: 14)),
              const SizedBox(height: 10),
              Text(facultyName,
                  style: style.copyWith(
                      fontSize: 24, fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
              Text("$observerName (Observer)", style: style)
            ]),
            const SizedBox(width: 20),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              const Text("Observation Period", style: style),
              Text(obsPeriod,
                  style: style.copyWith(fontWeight: FontWeight.bold)),
              const SizedBox(height: 20),
              Text("Status: $status", style: style.copyWith(fontSize: 18))
            ])
          ]),
        ));
  }
}
