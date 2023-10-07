import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../view_models/observation/observation_view_model.dart';
import '../../../../../view_models/user/user_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/observation_card/observation_card.dart';
import '../../../../widgets/observation_card/observation_skeleton_card.dart';
import '../../../../widgets/search_bar/my_search_bar.dart';

class ObserverObservationScreen extends StatefulWidget {
  const ObserverObservationScreen({super.key});

  @override
  State<ObserverObservationScreen> createState() =>
      _ObserverObservationScreenState();
}

class _ObserverObservationScreenState extends State<ObserverObservationScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  final TextEditingController searchController = TextEditingController();
  final TextEditingController facultyController = TextEditingController();
  final TextEditingController observerController = TextEditingController();
  final TextEditingController courseController = TextEditingController();

  ObservationViewModel observationViewModel = ObservationViewModel();

  @override
  void initState() {
    observationViewModel.getAllObservations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userViewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: const MyAppBar(
          title: "Observations",
          // actionIcon: Icons.add,
          // onTapAction: () {
          //   Navigator.pushNamed(context, RoutesName.initiateObservation);
          // }
        ),
        body: Column(children: [
          const SizedBox(
            height: 16,
          ),
          MySearchBar(
              // onTapSufix: () {
              //   showModalBottomSheet(
              //       context: context,
              //       builder: (context) => ObservationFilter(
              //           course: courseController,
              //           faculty: facultyController,
              //           observer: observerController));
              // },
              // sufixIcon: Icons.filter_list_rounded,
              hint: "Search",
              controller: searchController,
              onChanged: (value) {}),
          const SizedBox(
            height: 6,
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: ChangeNotifierProvider<ObservationViewModel>(
                    create: (context) => observationViewModel,
                    child: Consumer<ObservationViewModel>(
                        builder: (context, value, child) {
                      switch (value.observationsList.status) {
                        case Status.ERROR:
                          debugPrint(value.observationsList.message);
                          return Container();

                        case Status.COMPLETED:
                          return ListView.builder(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemCount: value.observationsList.data!
                                  .where((obs) =>
                                      obs.observerId == userViewModel.userId)
                                  .toList()
                                  .length,
                              itemBuilder: (context, index) {
                                final obs = value.observationsList.data!
                                    .where((obs) =>
                                        obs.observerId == userViewModel.userId)
                                    .toList()[index];

                                return ObservationCard(obs: obs);
                              });

                        default:
                          return ListView.separated(
                            shrinkWrap: true,
                            itemCount: 5,
                            itemBuilder: (context, index) =>
                                const ObservationSkeletonCard(),
                            separatorBuilder: (context, index) =>
                                const SizedBox(height: 16),
                          );
                      }
                    })),
              ),
            ),
          )
        ]));
  }
}
