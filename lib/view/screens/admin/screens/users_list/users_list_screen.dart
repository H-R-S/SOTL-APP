import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../resources/constants/style.dart';
import '../../../../../view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../../../widgets/search_bar/my_search_bar.dart';
import '../../../../widgets/text_field/my_text_field.dart';
import '../../../../widgets/user_card/user_card.dart';
import '../add_faculty/add_faculty_screen.dart';

class UsersListScreen extends StatefulWidget {
  final String? title;

  const UsersListScreen({super.key, required this.title});

  @override
  State<UsersListScreen> createState() => _UsersListScreenState();
}

class _UsersListScreenState extends State<UsersListScreen> {
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
            title: widget.title,
            actionData: Container(
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.all(3),
                decoration:
                    const BoxDecoration(color: primary, shape: BoxShape.circle),
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const AddFacultyScreen()));
                    },
                    child: const Center(
                        child: Icon(Icons.add, color: Colors.white))))),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const SizedBox(height: 20),
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
                                          dropDownList: const [
                                            "FEST"
                                          ],
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
                      hint: "Search ${widget.title}",
                      controller: searchController,
                      onChanged: (value) {}),
                  const SizedBox(height: 30),
                  ChangeNotifierProvider<UserViewModel>(
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
                                      designation: user.designation ?? "",
                                      email: user.email ?? "");
                                });

                          default:
                            return const MyLoadingIndicator();
                        }
                      }))
                ]))));
  }
}
