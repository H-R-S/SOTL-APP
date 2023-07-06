import 'package:flutter/material.dart';
import '../../../../../resources/constants/style.dart';
import '../../../../../routes/routes_name.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/observation_info_container/observation_info_container.dart';
import '../../../../widgets/search_bar/my_search_bar.dart';

class ObservationScreen extends StatelessWidget {
  ObservationScreen({super.key});

  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(
          scaffoldKey,
          context,
          title: "Observations",
          actionData: Container(
            margin: const EdgeInsets.only(right: 10),
            padding: const EdgeInsets.all(5),
            decoration: const BoxDecoration(
              // color: primary,
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: Material(
              color: Colors.transparent,
              child: InkWell(
                customBorder: const CircleBorder(),
                onTap: () => Navigator.pushNamed(
                  context,
                  RoutesName.initiateObservation,
                ),
                child: const Center(
                  child:
                      Icon(Icons.handshake_outlined, size: 28, color: primary),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
            child: Column(children: [
              // Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              //   const HeaderTag(title: "Observations"),
              //   Container(
              //       decoration: BoxDecoration(
              //           color: primary,
              //           borderRadius: BorderRadius.circular(10)),
              //       child: IconButton(
              //           onPressed: () {},
              //           icon: const Icon(Icons.add, color: Colors.white)))
              // ]),
              // const SizedBox(height: 20),
              MySearchBar(
                  onTapSufix: () {},
                  sufixIcon: Icons.filter_list_rounded,
                  hint: "Search",
                  controller: searchController,
                  onChanged: (value) {}),
              Expanded(
                child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    padding: const EdgeInsets.symmetric(vertical: 20),
                    shrinkWrap: true,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      List colorList = [
                        active,
                        secondary,
                        primary,
                      ];

                      List statusList = ["Pending", "Ongoing", "Completed"];

                      return ObservationInfoContainer(
                          facultyName: "Sheraz Ahmed",
                          observerName: "Mansoor Ebrahim",
                          status: statusList[index % 3],
                          statusColor: colorList[index % 3],
                          obsPeriod: "1/2/23 - 3/4/23");
                    }),
              )
            ])));
  }
}
