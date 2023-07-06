import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
import '../../../routes/routes_name.dart';

class ObservationInfoContainer extends StatelessWidget {
  final Color statusColor;
  final String facultyName, observerName, status, obsPeriod;

  const ObservationInfoContainer(
      {super.key, this.statusColor = Colors.white,
      required this.facultyName,
      required this.observerName,
      required this.status,
      required this.obsPeriod});

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 16, color: primary);

    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: statusColor,
          boxShadow: const [
            BoxShadow(
                color: grey,
                spreadRadius: 1,
                blurRadius: 5,
                offset: Offset(0, 4)),
          ],
        ),
        margin: const EdgeInsets.only(top: 5, bottom: 10),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            FittedBox(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "JULY",
                      style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 10,
                          color: statusColor == primary
                              ? Colors.white
                              : Styles.fontColor),
                    ),
                    Text(
                      "20",
                      style: TextStyle(
                          fontSize: 20,
                          color: statusColor == primary
                              ? Colors.white
                              : Styles.fontColor,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "WED",
                      style: TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.w600,
                          color: statusColor == primary
                              ? Colors.white
                              : Styles.fontColor),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(5)),
                color: Styles.scaffoldBgColor,
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
                    // trailing: Column(
                    //   mainAxisAlignment: MainAxisAlignment.center,
                    //   children: [
                    //     SizedBox(
                    //       height: 20,
                    //     ),
                    //     Icon(Icons.arrow_downward_rounded)
                    //   ],
                    // ),
                    tilePadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    childrenPadding: const EdgeInsets.symmetric(
                        vertical: 5.0, horizontal: 10.0),
                    title: GestureDetector(
                      onTap: () =>
                          Navigator.pushNamed(context, RoutesName.rubrics),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Faculty",
                                style: style.copyWith(
                                    fontSize: 10,
                                    color: Styles.fontColor)),
                            // const SizedBox(height: 10),
                            Text(facultyName,
                                style: style.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Styles.fontColor)),
                            const SizedBox(height: 10),
                            Text("Observer",
                                style: style.copyWith(
                                    fontSize: 10,
                                    color: Styles.fontColor)),
                            Text(observerName,
                                style: style.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Styles.fontColor)),
                            const SizedBox(height: 10),
                            Text("Progress",
                                style: style.copyWith(
                                    fontSize: 10,
                                    color: Styles.fontColor)),
                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: statusColor,
                                  width: 2.0,
                                ),
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: LinearProgressIndicator(
                                value: statusColor == active
                                    ? 0.4
                                    : statusColor == secondary
                                        ? 0.7
                                        : 1,
                                color: statusColor,
                                backgroundColor: Colors.transparent,
                              ),
                            )
                          ]),
                    ),
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.zero,
                        title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Head of Department",
                                style: style.copyWith(
                                    fontSize: 10,
                                    color: Styles.fontColor)),
                            Text("Calculus And Analytical Geometry",
                                style: style.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Styles.fontColor)),
                            const SizedBox(height: 10),
                            Text("Observer Slot",
                                style: style.copyWith(
                                    fontSize: 10,
                                    color: Styles.fontColor)),
                            Text("July / 12 / 2023 ( 04:30 PM - 05:30)",
                                style: style.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Styles.fontColor)),
                            const SizedBox(height: 10),
                            Text("Faculty Slot",
                                style: style.copyWith(
                                    fontSize: 10,
                                    color: Styles.fontColor)),
                            Text("July / 12 / 2023 ( 04:30 PM - 05:30)",
                                style: style.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Styles.fontColor)),
                            const SizedBox(height: 10),
                            Text("Teaching Plan",
                                style: style.copyWith(
                                    fontSize: 10,
                                    color: Styles.fontColor)),
                            Text("Submitted",
                                style: style.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Styles.fontColor)),
                            const SizedBox(height: 10),
                            Text("Status",
                                style: style.copyWith(
                                    fontSize: 10,
                                    color: Styles.fontColor)),
                            Text("Ongoing",
                                style: style.copyWith(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600,
                                    color: Styles.fontColor)),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ));
    // child: FittedBox(
    //   child: Column(
    //     children: [
    //       Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
    //         Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             children: [
    //               Text(
    //                 "Faculty",
    //                 textAlign: TextAlign.start,
    //                 style: style.copyWith(
    //                     fontSize: 13, color: Styles.whiteColor),
    //               ),
    //               const SizedBox(height: 10),
    //               Text(facultyName,
    //                   style: style.copyWith(
    //                       fontSize: 20,
    //                       fontWeight: FontWeight.w600,
    //                       color: Styles.whiteColor)),
    //             ]),
    //         const SizedBox(width: 40),
    //         Column(crossAxisAlignment: CrossAxisAlignment.end, children: [
    //           Text("Observation Period",
    //               textAlign: TextAlign.end,
    //               style: style.copyWith(color: Styles.whiteColor)),
    //           Text(obsPeriod,
    //               style: style.copyWith(
    //                   fontWeight: FontWeight.bold,
    //                   color: Styles.whiteColor)),
    //           const SizedBox(height: 20),
    //         ])
    //       ]),
    //       Row(
    //         crossAxisAlignment: CrossAxisAlignment.end,
    //         children: [
    //           Row(
    //             children: [
    //               const SizedBox(height: 10),
    //               Text("$observerName (Observer)",
    //                   style:
    //                       style.copyWith(color: Styles.whiteColor)),
    //               Text("Status: ",
    //                   style: style.copyWith(
    //                       fontSize: 18, color: Styles.whiteColor)),
    //               Text(status,
    //                   style: style.copyWith(
    //                       fontSize: 18,
    //                       color: color,
    //                       fontWeight: FontWeight.w600))
    //             ],
    //           )
    //         ],
    //       )
    //     ],
    //   ),
    // ));
  }
}
