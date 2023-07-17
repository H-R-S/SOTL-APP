import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/view/widgets/loading_indicator/my_loading_indicator.dart';
import '../../../../../../data/enums/status.dart';
import '../../../../../../view_models/observation/observation_view_model.dart';
import '../../../../../widgets/observation_info_container/observation_info_container.dart';

class ObservationsList extends StatefulWidget {
  const ObservationsList({super.key});

  @override
  State<ObservationsList> createState() => _ObservationsListState();
}

class _ObservationsListState extends State<ObservationsList> {
  ObservationViewModel observationViewModel = ObservationViewModel();

  @override
  void initState() {
    observationViewModel.getAllObservations();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ObservationViewModel>(
        create: (context) => observationViewModel,
        child: Consumer<ObservationViewModel>(builder: (context, value, child) {
          switch (value.observationsList.status) {
            case Status.ERROR:
              return Container();

            case Status.COMPLETED:
              return ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: value.observationsList.data!.length,
                  itemBuilder: (context, index) {
                    final obs = value.observationsList.data![index];
                    debugPrint(value.observationsList.data!.length.toString());
                    return ObservationInfoContainer(
                        facultyName: obs.faculty!.name ?? "",
                        observerName: obs.observer!.name ?? "",
                        status: obs.observationStatus ?? "",
                        obsPeriod: obs.starting ?? "");
                  });

            default:
              return const MyLoadingIndicator();
          }
        }));
  }
}
