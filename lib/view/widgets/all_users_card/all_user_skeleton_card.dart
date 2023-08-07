import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/skeleton/skeleton.dart';

class AllUsersSkeletonCard extends StatelessWidget {
  const AllUsersSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: 200,
      padding: const EdgeInsets.fromLTRB(15, 15, 10, 20),
      decoration: BoxDecoration(boxShadow: const [
        BoxShadow(
            color: Colors.black12,
            spreadRadius: 1,
            blurRadius: 5,
            offset: Offset(0, 4)),
      ], borderRadius: BorderRadius.circular(10), color: Colors.white),
      child:
          const Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CircleSkeleton(
          size: 65,
        ),
        SizedBox(height: 10),
        Skeleton(width: 50),
        SizedBox(height: 10),
        Skeleton(width: 70),
        SizedBox(height: 10)
      ]),
    );
  }
}
