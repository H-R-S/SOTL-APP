import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/view/screens/admin/widgets/welcome_container.dart';
import 'package:sotl/view/widgets/all_users_card/all_users_card.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';
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
            Consumer<ObservationViewModel>(builder: (context, value, child) {
              return AllUsersCard(
                  title: "Observations", value: 1, onTap: () {});
            })
          ],
        ),
      )),
    );
  }
}
