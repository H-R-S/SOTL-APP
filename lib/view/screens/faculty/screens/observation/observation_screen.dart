import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/view/widgets/observation_card/observation_skeleton_card.dart';
import 'package:sotl/view_models/user/user_view_model.dart';
import '../../../../../data/enums/status.dart';
import '../../../../../view_models/observation/observation_view_model.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';
import '../../../../widgets/observation_card/observation_card.dart';

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
    final userViiewModel = Provider.of<UserViewModel>(context);

    return Scaffold(
        appBar: MyAppBar(title: "Observations"),
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
                      if (userViiewModel.userRole == "Faculty") {
                        return ListView.builder(
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: value.observationsList.data!
                                .where((obs) =>
                                    obs.facultyId == userViiewModel.userId)
                                .toList()
                                .length,
                            itemBuilder: (context, index) {
                              final obs = value.observationsList.data!
                                  .where((obs) =>
                                      obs.facultyId == userViiewModel.userId)
                                  .toList()[index];

                              return ObservationCard(obs: obs);
                            });
                      } else {
                        return ListView.builder(
                            shrinkWrap: true,
                            // physics: const NeverScrollableScrollPhysics(),
                            itemCount: value.observationsList.data!
                                .where((obs) =>
                                    obs.observerId == userViiewModel.userId)
                                .toList()
                                .length,
                            itemBuilder: (context, index) {
                              final obs = value.observationsList.data!
                                  .where((obs) =>
                                      obs.observerId == userViiewModel.userId)
                                  .toList()[index];

                              return ObservationCard(obs: obs);
                            });
                      }

                    default:
                      return ListView.separated(
                        itemCount: 5,
                        itemBuilder: (context, index) =>
                            const ObservationSkeletonCard(),
                        separatorBuilder: (context, index) =>
                            const SizedBox(height: 30),
                      );
                  }
                }))));
  }
}
