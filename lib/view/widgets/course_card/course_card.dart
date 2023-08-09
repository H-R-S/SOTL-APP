import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class CourseCard extends StatelessWidget {
  final String name, timings, instructorName;
  final Function() onTap;

  const CourseCard(
      {super.key,
      required this.onTap,
      required this.name,
      required this.timings,
      required this.instructorName});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
          margin: const EdgeInsets.symmetric(vertical: 10),
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: primary)),
          child: Row(children: [
            const CircleAvatar(
                backgroundColor: primary,
                radius: 30,
                child: Icon(Icons.person, size: 40, color: Colors.white)),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.h2),
                    const SizedBox(height: 5),
                    Text(timings, style: Styles.h3),
                    const SizedBox(height: 5),
                    Text(instructorName,
                        style: Styles.subHeading.copyWith(
                            fontWeight: FontWeight.normal, color: Colors.grey))
                  ]),
            )
          ])),
    );
  }
}
