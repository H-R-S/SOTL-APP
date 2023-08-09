import 'package:flutter/material.dart';
import 'package:sotl/view/screens/admin/widgets/welcome_container.dart';
import 'package:sotl/view/widgets/all_users_card/all_users_card.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';

class FacultyHomeScreen extends StatelessWidget {
  FacultyHomeScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(scaffoldKey, context, title: "Dashboard"),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SotlWelcomeContainer(),
            const SizedBox(height: 20),
            records(),
            const SizedBox(height: 40),
            // Consumer<ObservationViewModel>(builder: (context, value, child) {
            //   return AllUsersCard(
            //       title: "Observations", value: 1, onTap: () {});
            // })
          ],
        ),
      )),
    );
  }

  Widget records() {
    return GridView.builder(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            mainAxisExtent: 150,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20,
            crossAxisCount: 2),
        itemCount: 1,
        itemBuilder: (context, index) {
          return AllUsersCard(
              title: "Observations",
              value: 1,
              onTap: () {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => UsersListScreen(
                //             title: facultyList[index]
                //                 ["name"])));
              }
              // title: facultyList[index]["name"],
              // value: facultyList[index]["value"].toString());
              );
        });
  }
}
