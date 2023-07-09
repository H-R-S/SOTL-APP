import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/info_container/info_container.dart';

class UserRecords extends StatelessWidget {
  final bool isAdmin, isCampusDirector, isDean, isHOD;
  final int? campusDirectors, deans, hods, observers, faculties, guest;

  const UserRecords(
      {super.key,
      this.isAdmin = false,
      this.isCampusDirector = false,
      this.isDean = false,
      this.isHOD = false,
      this.campusDirectors,
      this.deans,
      this.hods,
      this.observers,
      this.faculties,
      this.guest});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      if (isAdmin)
        Row(
          children: [
            InfoContainer(
                title: "Campus Directors",
                value: campusDirectors!,
                onTap: () {}),
            InfoContainer(title: "Deans", value: deans!, onTap: () {}),
          ],
        ),
      if (isAdmin || isCampusDirector || isDean)
        Row(
          children: [
            InfoContainer(
                title: "Head of Departments", value: hods!, onTap: () {}),
            InfoContainer(title: "Observers", value: observers!, onTap: () {}),
          ],
        ),
      if (isAdmin || isCampusDirector || isDean)
        Row(
          children: [
            InfoContainer(title: "Faculty", value: faculties!, onTap: () {}),
            InfoContainer(title: "Gues", value: guest!, onTap: () {}),
          ],
        )
    ]);
  }
}
