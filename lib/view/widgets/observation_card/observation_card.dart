import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:sotl/view/screens/observer/screens/observation_detail/observation_detail_screen.dart';
import 'package:sotl/view_models/user/user_view_model.dart';
import '../../../models/observation/observation_model.dart';
import '../../../resources/constants/style.dart';

// ignore: must_be_immutable
class ObservationCard extends StatelessWidget {
  Color statusColor;
  final ObservationModel obs;

  ObservationCard(
      {super.key, required this.obs, this.statusColor = Colors.white});

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    if (obs.observationStatus == "Pending") {
      statusColor = active;
    } else if (obs.observationStatus == "Completed") {
      statusColor = primary;
    } else if (obs.observationStatus == "Ongoing") {
      statusColor = secondary;
    }

    final style = TextStyle(
        fontWeight: FontWeight.w600,
        fontSize: 10,
        color: statusColor == primary ? Colors.white : Styles.fontColor);

    final style2 = TextStyle(
        fontSize: 14, fontWeight: FontWeight.w600, color: Styles.fontColor);

    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
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
      child: Stack(alignment: Alignment.centerLeft, children: [
        FittedBox(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(15, 0, 0, 10),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              if (obs.starting != null) ...[
                Text(DateFormat.MMM().format(DateTime.parse(obs.starting!)),
                    style: style.copyWith(fontSize: 16)),
                Text(DateFormat.d().format(DateTime.parse(obs.starting!)),
                    style: style.copyWith(fontSize: 16)),
                Text(DateFormat.E().format(DateTime.parse(obs.starting!)),
                    style: style.copyWith(fontSize: 16)),
              ] else ...[
                Text("---", style: style),
                Text("---", style: style),
                Text("---", style: style),
              ]
            ]),
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
                  iconColor: statusColor,
                  tilePadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  childrenPadding: const EdgeInsets.symmetric(
                      vertical: 5.0, horizontal: 10.0),
                  title: GestureDetector(
                    onTap: () {
                      debugPrint("Value of obs.id: ${obs.id}");
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ObservationDetailScreen(
                                  observationId: obs.id!)));
                    },
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          if (userViewModel.userRole !=
                              "Head_of_Department") ...[
                            Text("Head of Department",
                                style: style.copyWith(
                                    fontSize: 10, color: Styles.fontColor)),
                            Text(obs.hod?.name ?? "---", style: style2),
                            const SizedBox(height: 10),
                          ],
                          if (userViewModel.userRole != "Faculty") ...[
                            Text("Faculty",
                                style: style.copyWith(
                                    fontSize: 10, color: Styles.fontColor)),
                            Text(obs.faculty?.name ?? "---", style: style2),
                            const SizedBox(height: 10),
                          ],
                          if (userViewModel.userRole != "Observer") ...[
                            Text("Observer",
                                style: style2.copyWith(fontSize: 10)),
                            Text(obs.observer?.name ?? "---", style: style2),
                            const SizedBox(height: 10)
                          ],
                          Text("Progress",
                              style: style2.copyWith(fontSize: 10)),
                          Container(
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: statusColor,
                                width: 2.0,
                              ),
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: LinearProgressIndicator(
                                value: obs.observationScore!.toDouble(),
                                color: statusColor,
                                backgroundColor: Colors.transparent),
                          )
                        ]),
                  ),
                  children: [
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Course",
                                style: style2.copyWith(fontSize: 10)),
                            Text(obs.course?.name ?? "---", style: style2),
                            const SizedBox(height: 10),
                            Text("Observer Slot",
                                style: style2.copyWith(fontSize: 10)),
                            Text("---", style: style2),
                            const SizedBox(height: 10),
                            Text("Faculty Slot",
                                style: style2.copyWith(fontSize: 10)),
                            Text("---", style: style2),
                            const SizedBox(height: 10),
                            Text("Teaching Plan",
                                style: style2.copyWith(fontSize: 10)),
                            Text("---", style: style2),
                            const SizedBox(height: 10),
                            Text("Status",
                                style: style2.copyWith(fontSize: 10)),
                            Text(obs.observationStatus ?? "---", style: style2),
                            const SizedBox(height: 20)
                          ]),
                    ),
                  ]),
            ),
          ),
        ),
      ]),
    );
  }
}
