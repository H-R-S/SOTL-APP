import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';
import '../../../resources/data/user_list.dart';
import '../../widgets/app_bar/my_app_bar.dart';
import '../../widgets/header_tag/header_tag.dart';
import '../../widgets/info_container/info_container.dart';
import '../users_list/users_list_screen.dart';

class UsersScreen extends StatelessWidget {
  UsersScreen({super.key});

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Users"),
        body: SingleChildScrollView(
            child: Padding(
                padding: const EdgeInsets.all(20),
                child: Column(children: [
                  // Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       const HeaderTag(title: "Users"),
                  //       Container(
                  //           decoration: BoxDecoration(
                  //               color: primary,
                  //               borderRadius: BorderRadius.circular(10)),
                  //           child: IconButton(
                  //               onPressed: () {},
                  //               icon:
                  //                   const Icon(Icons.add, color: Colors.white)))
                  //     ]),
                  const SizedBox(height: 20),
                  GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              mainAxisExtent: 100,
                              crossAxisSpacing: 20,
                              mainAxisSpacing: 20,
                              crossAxisCount: 2),
                      itemCount: facultyList.length,
                      itemBuilder: (context, index) {
                        return InfoContainer(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => UsersListScreen(
                                          title: facultyList[index]["name"])));
                            },
                            title: facultyList[index]["name"],
                            value: facultyList[index]["value"].toString());
                      })
                ]))));
  }
}
