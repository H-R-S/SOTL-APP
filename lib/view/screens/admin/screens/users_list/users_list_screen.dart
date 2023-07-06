import 'package:flutter/material.dart';
import '../../../../../resources/constants/style.dart';
import '../../../../../resources/data/user_list.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/search_bar/my_search_bar.dart';
import '../../../../widgets/user_card/user_card.dart';
import '../add_faculty/add_faculty_screen.dart';

class UsersListScreen extends StatelessWidget {
  final String? title;

  UsersListScreen({super.key, required this.title});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          scaffoldKey,
          context,
          isBack: true,
          title: title,
          actionData: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(3),
            decoration: const BoxDecoration(
              color: primary,
              shape: BoxShape.circle,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddFacultyScreen()));
                },
                child: const Center(
                  child: Icon(Icons.add),
                ),
              ),
            ),
          ),
          actionButton: Icons.person_add_alt_1,
        ),
        //      onTapAction: () {
        // Navigator.push(context,
        //     MaterialPageRoute(builder: (context) => AddFacultyScreen()));
        // }),
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
                  const SizedBox(height: 30),
                  ListView.builder(
                      itemCount: 10,
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) {
                        return UserCard(
                            onTap: () {},
                            name: userList[index % 4]["name"],
                            designation: userList[index % 4]["designation"],
                            email: userList[index % 4]["email"]);
                      })

                  // GridView.builder(
                  //     shrinkWrap: true,
                  //     physics: const NeverScrollableScrollPhysics(),
                  //     gridDelegate:
                  //         const SliverGridDelegateWithFixedCrossAxisCount(
                  //             mainAxisExtent: 250,
                  //             crossAxisSpacing: 20,
                  //             mainAxisSpacing: 20,
                  //             crossAxisCount: 2),
                  //     itemCount: userList.length,
                  //     itemBuilder: (context, index) {
                  //       return UserCard(
                  //           onTap: () {},
                  //           name: userList[index]["name"],
                  //           designation: userList[index]["designation"],
                  //           email: userList[index]["email"]);
                  //     })
                ]))));
  }
}
