import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/view/widgets/all_users_card/all_user_skeleton_card.dart';
import 'package:sotl/view/widgets/all_users_card/all_users_card.dart';
import 'package:sotl/view_models/user/user_view_model.dart';

class ObserverRecords extends StatefulWidget {
  const ObserverRecords({super.key});

  @override
  State<ObserverRecords> createState() => _ObserverRecordsState();
}

class _ObserverRecordsState extends State<ObserverRecords> {
  UserViewModel userViewModel = UserViewModel();

  @override
  void initState() {
    userViewModel.getUserById();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
        create: (context) => userViewModel,
        child: Consumer<UserViewModel>(builder: (context, value, child) {
          switch (value.userData.status) {
            case Status.ERROR:
              debugPrint(value.userData.message);
              return Center(
                child: Text("Error: ${value.userData.message}"),
              );

            case Status.COMPLETED:
              final user = value.userData.data!;

              debugPrint("obs: ${user.observations!.length.toString()}");

              return AllUsersCard(
                  title: "Observations",
                  value: user.observations?.length ?? 0,
                  onTap: () {});

            default:
              return GridView.count(
                shrinkWrap: true,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                crossAxisCount: 2,
                children: const [
                  AllUsersSkeletonCard(),
                  AllUsersSkeletonCard(),
                ],
              );
          }
        }));
  }
}
