import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/skeleton/skeleton.dart';

class UserSkeletonCard extends StatelessWidget {
  const UserSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(children: [
            SizedBox(width: 8),
            CircleSkeleton(size: 60),
            SizedBox(width: 10),
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Skeleton(width: 150),
              SizedBox(height: 10),
              Skeleton(width: 100)
            ]),
          ]),
          Icon(Icons.more_vert, color: Colors.black26)
        ]);
  }
}
