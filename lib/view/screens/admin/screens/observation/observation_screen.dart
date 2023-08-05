import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/view/screens/admin/screens/observation/widgets/observation_filter.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../routes/routes_name.dart';
import '../../../../../view_models/observation/observation_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../../../widgets/observation_info_container/observation_info_container.dart';
import '../../../../widgets/search_bar/my_search_bar.dart';

class ObservationScreen extends StatefulWidget {
  const ObservationScreen({super.key});

  @override
  State<ObservationScreen> createState() => _ObservationScreenState();
}

class _ObservationScreenState extends State<ObservationScreen> {
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
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context,
            title: "Observations", actionIcon: Icons.add, onTapAction: () {
          Navigator.pushNamed(context, RoutesName.initiateObservation);
        }),
        body: SingleChildScrollView(
          child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
              child: Column(children: [
                MySearchBar(
                    onTapSufix: () {
                      showModalBottomSheet(
                          context: context,
                          builder: (context) => ObservationFilter(
                              course: courseController,
                              faculty: facultyController,
                              observer: observerController));
                    },
                    sufixIcon: Icons.filter_list_rounded,
                    hint: "Search",
                    controller: searchController,
                    onChanged: (value) {}),
                const SizedBox(height: 20),
                ChangeNotifierProvider<ObservationViewModel>(
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
                              itemCount: value.observationsList.data!.length,
                              itemBuilder: (context, index) {
                                final obs = value.observationsList.data![index];
                                debugPrint(value.observationsList.data!.length
                                    .toString());

                                return ObservationInfoContainer(
                                    facultyName: obs.faculty!.name ?? "",
                                    observerName: obs.observer!.name ?? "",
                                    status: obs.observationStatus ?? "",
                                    obsPeriod: obs.starting ?? "");
                              });

                        default:
                          return const MyLoadingIndicator();
                      }
                    }))
              ])),
        ));
  }
}
