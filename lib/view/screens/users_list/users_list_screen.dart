import 'package:flutter/material.dart';
import 'package:sotl/view/screens/add_user/add_user_screen.dart';
import '../../../resources/data/user_list.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/search_bar/my_search_bar.dart';
import '../../widgets/user_card/user_card.dart';

class UsersListScreen extends StatelessWidget {
  final String? title;

  UsersListScreen({super.key, required this.title});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context,
            isBack: true,
            title: title,
            actionButton: Icons.person_add_alt_1, onTapAction: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddUserScreen(title: title!)));
        }),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  const SizedBox(height: 20),
                  MySearchBar(
                      onTapSufix: () {
                        // showModalBottomSheet(context: context, builder: (context) => Column());
                      },
                      sufixIcon: Icons.filter_list_rounded,
                      hint: "Search $title",
                      controller: searchController,
                      onChanged: (value) {}),
                  const SizedBox(height: 40),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 200,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              crossAxisCount: 2),
                      itemCount: userList.length,
                      itemBuilder: (context, index) {
                        return UserCard(
                            onTap: () {},
                            name: userList[index]["name"],
                            designation: userList[index]["designation"],
                            email: userList[index]["email"]);
                      })
                ]))));
  }
}
