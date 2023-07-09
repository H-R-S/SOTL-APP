import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../view_models/observation/observation_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/loading_indicator/my_loading_indicator.dart';
import '../../../../widgets/observation_info_container/observation_info_container.dart';

class FacultyObservationScreen extends StatefulWidget {
  const FacultyObservationScreen({super.key});

  @override
  State<FacultyObservationScreen> createState() =>
      _FacultyObservationScreenState();
}

class _FacultyObservationScreenState extends State<FacultyObservationScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  ObservationViewModel observationViewModel = ObservationViewModel();

  @override
  void initState() {
    observationViewModel.getAllObservations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context, title: "Observations"),
        body: Padding(
            padding: const EdgeInsets.all(20),
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
                          itemCount: value.observationsList.data!.length,
                          itemBuilder: (context, index) {
                            final obs = value.observationsList.data![index];

                            return ObservationInfoContainer(
                                facultyName: obs.faculty!.name ?? "",
                                observerName: obs.observer!.name ?? "",
                                status: obs.observationStatus ?? "Pending",
                                obsPeriod: obs.semester ?? "");
                          });

                    default:
                      return const MyLoadingIndicator();
                  }
                }))));
  }
}
