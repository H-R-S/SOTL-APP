import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../../data/enums/status.dart';
import '../../../../../../view_models/user/user_view_model.dart';
import '../../../../../widgets/info_container/info_container.dart';
import '../../../../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../add_user/add_user_screen.dart';

class UserRecords extends StatefulWidget {
  const UserRecords({super.key});

  @override
  State<UserRecords> createState() => _UserRecordsState();
}

class _UserRecordsState extends State<UserRecords> {
  UserViewModel userViewModel = UserViewModel();

  bool isAdmin = false;
  bool isCampusDirector = false;
  bool isHOD = false;
  bool isDean = false;
  bool isObserver = false;
  bool isFaculty = false;

  @override
  void initState() {
    userViewModel.getAllUsers();
    userViewModel.getUser().then((value) {
      switch (value.role) {
        case "Head_of_Department":
          return isHOD = true;
        default:
          null;
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<UserViewModel>(
        create: (context) => userViewModel,
        child: Consumer<UserViewModel>(builder: (context, value, child) {
          switch (value.usersList.status) {
            case Status.ERROR:
              return Container();

            case Status.COMPLETED:
              final users = value.usersList.data!;

              return Column(children: [
                if (isAdmin)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoContainer(
                        title: "Campus Directors",
                        value: users
                            .where((user) => user.role == "Campus_Director")
                            .length,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddUserScreen(
                                      title: "Campus Directors")));
                        },
                      ),
                      InfoContainer(
                        title: "Deans",
                        value:
                            users.where((user) => user.role == "Dean").length,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddUserScreen(title: "Deans")));
                        },
                      ),
                    ],
                  ),
                if (isAdmin || isCampusDirector || isDean)
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InfoContainer(
                        title: "Head of Departments",
                        value: users
                            .where((user) => user.role == "Head_of_Department")
                            .length,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const AddUserScreen(
                                      title: "Head of Departments")));
                        },
                      ),
                      InfoContainer(
                        title: "Observers",
                        value: users
                            .where((user) => user.role == "Observer")
                            .length,
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const AddUserScreen(title: "Observer")));
                        },
                      ),
                    ],
                  ),
                if (isAdmin || isCampusDirector || isDean || isHOD)
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        InfoContainer(
                          title: "Observers",
                          value: users
                              .where((user) => user.role == "Observer")
                              .length,
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const AddUserScreen(
                                        title: "Observer")));
                          },
                        ),
                        InfoContainer(
                            title: "Faculty",
                            value: users
                                .where((user) => user.role == "Faculty")
                                .length,
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const AddUserScreen(
                                          title: "Faculty")));
                            })
                      ])
              ]);

            default:
              return const MyLoadingIndicator();
          }
        }));
  }
}
