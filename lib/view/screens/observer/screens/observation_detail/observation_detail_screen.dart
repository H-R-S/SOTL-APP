import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';
import 'package:sotl/view/widgets/loading_indicator/my_loading_indicator.dart';
import 'package:sotl/view/widgets/observation_card/observation_detail_card.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';

class ObservationDetailScreen extends StatefulWidget {
  final int observationId;

  const ObservationDetailScreen({super.key, required this.observationId});

  @override
  State<ObservationDetailScreen> createState() =>
      _ObservationDetailScreenState();
}

class _ObservationDetailScreenState extends State<ObservationDetailScreen> {
  ObservationViewModel observationModel = ObservationViewModel();

  @override
  void initState() {
    observationModel.getAllObservationById(widget.observationId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.observationId.toString());

    return ChangeNotifierProvider<ObservationViewModel>(
        create: (context) => observationModel,
        child: Consumer<ObservationViewModel>(builder: (context, value, child) {
          switch (value.observationDetail.status) {
            case Status.ERROR:
              debugPrint("Error is: ${value.observationDetail.message}");
              return Scaffold(
                body: Center(
                  child: Text(
                      "Error Occured : ${value.observationDetail.message}"),
                ),
              );

            case Status.LOADING:
              return const Scaffold(
                body: Center(
                  child: MyLoadingIndicator(),
                ),
              );
            case Status.COMPLETED:
              return Scaffold(
                appBar: const MyAppBar(
                  title: "Observation Detail",
                  isBack: true,
                ),
                body: Padding(
                  padding: const EdgeInsets.all(20),
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        ObservationDetailCard(
                            obs: value.observationDetail.data!,
                            title: "INFORMED OBSERVATION SCHEDULING"),
                        ObservationDetailCard(
                            obs: value.observationDetail.data!,
                            isNotStarted: true,
                            title: "INFORMED OBSERVATION"),
                      ],
                    ),
                  ),
                ),
              );

            default:
              return const MyLoadingIndicator();
          }
        }));
  }
}
