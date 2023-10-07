import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/skeleton/skeleton.dart';

class CourseSkeletonCard extends StatelessWidget {
  const CourseSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
          )),
      child: const Row(children: [
        CircleSkeleton(size: 60),
        SizedBox(width: 10),
        Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Skeleton(width: 200),
          SizedBox(height: 10),
          Skeleton(width: 100),
          SizedBox(height: 10),
          Skeleton(width: 150)
        ]),
      ]),
    );
  }
}
