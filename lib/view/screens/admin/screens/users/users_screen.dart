import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/routes/routes_name.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:sotl/view/widgets/user_card/user_skeleton_card.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/search_bar/my_search_bar.dart';
import '../../../../widgets/text_field/my_text_field.dart';
import '../../../../widgets/user_card/user_card.dart';

class UsersScreen extends StatefulWidget {
  const UsersScreen({super.key});

  @override
  State<UsersScreen> createState() => _UsersScreenState();
}

class _UsersScreenState extends State<UsersScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController searchController = TextEditingController();
  final TextEditingController roleController = TextEditingController();

  UserViewModel userViewModel = UserViewModel();

  @override
  void initState() {
    userViewModel.getAllUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context,
            title: "Users", actionIcon: Icons.add, onTapAction: () {
          Navigator.pushNamed(context, RoutesName.addUser);
        }),
        body: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(children: [
              MySearchBar(
                  onTapSufix: () {
                    showModalBottomSheet(
                        context: context,
                        builder: (context) => Padding(
                              padding: const EdgeInsets.all(20),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  MyTextField(
                                      isReadable: true,
                                      controller: roleController,
                                      dropDownList: const [
                                        "Observer",
                                        "Faculty"
                                      ],
                                      hint: "Select Role"),
                                  MyTextField(
                                      isReadable: true,
                                      controller: roleController,
                                      dropDownList: const ["FEST"],
                                      hint: "Select Department"),
                                  const SizedBox(height: 20),
                                  MyElevatedButton(
                                      title: "Apply Filter", onTap: () {}),
                                  const SizedBox(height: 40)
                                ],
                              ),
                            ));
                  },
                  sufixIcon: Icons.filter_list_rounded,
                  hint: "Search Users",
                  controller: searchController,
                  onChanged: (value) {}),
              const SizedBox(height: 10),
              Expanded(
                child: SingleChildScrollView(
                  child: ChangeNotifierProvider<UserViewModel>(
                      create: (context) => userViewModel,
                      child: Consumer<UserViewModel>(
                          builder: (context, value, child) {
                        switch (value.usersList.status) {
                          case Status.ERROR:
                            debugPrint(value.usersList.message);
                            return Container();

                          case Status.COMPLETED:
                            return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: value.usersList.data!.length,
                                itemBuilder: (context, index) {
                                  final user = value.usersList.data![index];

                                  return UserCard(
                                      onTap: () {},
                                      name: user.name ?? "",
                                      designation: user.role ?? "",
                                      email: user.email ?? "");
                                });

                          default:
                            return ListView.separated(
                              shrinkWrap: true,
                              itemCount: 5,
                              itemBuilder: (context, index) =>
                                  const UserSkeletonCard(),
                              separatorBuilder: (context, index) =>
                                  const SizedBox(height: 30),
                            );
                        }
                      })),
                ),
              )
            ])));
  }
}
