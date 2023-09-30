import 'package:flutter/material.dart';
import 'package:sotl/view/screens/admin/widgets/welcome_container.dart';
import 'package:sotl/view/screens/observer/widgets/record/observer_record.dart';
import 'package:sotl/view/widgets/all_users_card/all_users_card.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';

class ObserverHomeScreen extends StatelessWidget {
  ObserverHomeScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(scaffoldKey, context, title: "Dashboard"),
      body: const SingleChildScrollView(
          child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            SotlWelcomeContainer(),
            SizedBox(height: 20),
            ObserverRecords(),
            // records(),
            SizedBox(height: 40),
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
          return AllUsersCard(title: "Observations", value: 1, onTap: () {});
        });
  }
}
