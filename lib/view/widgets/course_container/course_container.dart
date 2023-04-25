import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class CourseContainer extends StatelessWidget {
  final String name, timings, instructorName;

  const CourseContainer(
      {super.key,
      required this.name,
      required this.timings,
      required this.instructorName});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 20, fontWeight: FontWeight.bold);

    return Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: secondary)),
        child: Row(children: [
          const CircleAvatar(
              backgroundColor: primary,
              radius: 30,
              child: Icon(Icons.person, size: 40, color: Colors.white)),
          const SizedBox(width: 10),
          Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(name, style: style),
            const SizedBox(height: 5),
            Text(timings, style: style),
            const SizedBox(height: 5),
            Text(instructorName,
                style: style.copyWith(
                    fontWeight: FontWeight.normal, color: Colors.grey))
          ])
        ]));
  }
}
