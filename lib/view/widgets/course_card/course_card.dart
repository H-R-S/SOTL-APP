import 'package:flutter/material.dart';
import 'package:sotl/models/course/course_model.dart';
import '../../../resources/constants/style.dart';

class CourseCard extends StatelessWidget {
  final CourseModel course;
  final Function() onTap;

  const CourseCard({super.key, required this.onTap, required this.course});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: primary)),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(10),
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
                    Text("${course.name} (${course.slots!.first.location})",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: Styles.h2),
                    const SizedBox(height: 5),
                    Text(
                        "${course.slots!.first.day} ${course.slots!.first.time}",
                        style: Styles.h3),
                    const SizedBox(height: 5),
                    Text("${course.slots!.first.faculty!.name}",
                        style: Styles.subHeading.copyWith(
                            fontWeight: FontWeight.normal, color: Colors.grey))
                  ]),
            )
          ]),
        ),
      ),
    );
  }
}
