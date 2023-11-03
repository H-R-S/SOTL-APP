import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/view/screens/admin/widgets/welcome_container.dart';
import 'package:sotl/view/widgets/all_users_card/all_user_skeleton_card.dart';
import 'package:sotl/view/widgets/all_users_card/all_users_card.dart';
import 'package:sotl/view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';

class FacultyHomeScreen extends StatefulWidget {
  const FacultyHomeScreen({super.key});

  @override
  State<FacultyHomeScreen> createState() => _FacultyHomeScreenState();
}

class _FacultyHomeScreenState extends State<FacultyHomeScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  UserViewModel userViewModel = UserViewModel();

  @override
  void initState() {
    userViewModel.getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(title: "Dashboard"),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            const SotlWelcomeContainer(),
            const SizedBox(height: 20),
            records(),
            // records(),
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
    return ChangeNotifierProvider<UserViewModel>(
        create: (context) => userViewModel,
        builder: (context, snapshot) {
          return Consumer<UserViewModel>(builder: (context, value, child) {
            switch (value.userData.status) {
              case Status.ERROR:
                return Container();

              case Status.COMPLETED:
                return GridView.count(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: [
                    AllUsersCard(
                      title: "Observation(s)",
                      value: value.userData.data!.observations!.length,
                      onTap: () {},
                    ),
                  ],
                );

              default:
                return GridView.count(
                  shrinkWrap: true,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  crossAxisCount: 2,
                  children: const [
                    AllUsersSkeletonCard(),
                  ],
                );
            }
          });
        });
  }
}
