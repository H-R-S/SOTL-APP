import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

import '../skeleton/skeleton.dart';

class ObservationSkeletonCard extends StatelessWidget {
  const ObservationSkeletonCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade400,
      highlightColor: Colors.grey.shade500,
      enabled: true,
      child: Container(
        decoration: BoxDecoration(
            color: Theme.of(context).primaryColor.withOpacity(0.1),
            borderRadius: BorderRadius.circular(10)),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            const Padding(
              padding: EdgeInsets.fromLTRB(15, 0, 0, 10),
              child: Column(
                children: [
                  Skeleton(width: 20),
                  SizedBox(height: 5),
                  Skeleton(width: 20),
                  SizedBox(height: 5),
                  Skeleton(width: 20),
                ],
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                color: Colors.white54,
                borderRadius: BorderRadius.all(Radius.circular(10)),
              ),
              margin: const EdgeInsets.only(left: 60),
              padding: const EdgeInsets.only(right: 10),
              child: Theme(
                data: ThemeData().copyWith(dividerColor: Colors.transparent),
                child: ListTileTheme(
                  contentPadding: EdgeInsets.zero,
                  dense: true,
                  horizontalTitleGap: 0.0,
                  minLeadingWidth: 0,
                  child: ExpansionTile(
                    tilePadding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 10.0),
                    childrenPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    title: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Skeleton(),
                          const SizedBox(height: 5),
                          const Skeleton(),
                          const SizedBox(height: 15),
                          const Skeleton(),
                          const SizedBox(height: 5),
                          const Skeleton(),
                          const SizedBox(height: 15),
                          const Skeleton(),
                          const SizedBox(height: 5),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context)
                                    .primaryColor
                                    .withOpacity(0.1),
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: LinearProgressIndicator(
                              value: .8,
                              color: Theme.of(context)
                                  .primaryColor
                                  .withOpacity(0.1),
                              backgroundColor: Colors.transparent,
                            ),
                          )
                        ]),
                    children: const [],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
