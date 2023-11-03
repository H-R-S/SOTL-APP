import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/view/screens/faculty/screens/select_slot/faculty_select_slot_screen.dart';
import 'package:sotl/view/screens/common/screens/teaching_plan/teaching_plan_screen.dart';
import 'package:sotl/view/screens/observer/screens/rubrics/observer_rubric_screen.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';
import 'package:sotl/view/widgets/loading_indicator/my_loading_indicator.dart';
import 'package:sotl/view/widgets/observation_card/observation_detail_card.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';

class FacultyObservationDetailScreen extends StatefulWidget {
  final int observationId;

  const FacultyObservationDetailScreen(
      {super.key, required this.observationId});

  @override
  State<FacultyObservationDetailScreen> createState() =>
      _FacultyObservationDetailScreenState();
}

class _FacultyObservationDetailScreenState
    extends State<FacultyObservationDetailScreen> {
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
              final obs = value.observationDetail.data!;

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
                          isNotStarted: obs.course == null,
                          isButton: obs.course == null,
                          obs: obs,
                          onTapPlan: obs.obsRequest!.teachingPlan!.editedBy !=
                                  null
                              ? () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TeachingPlanScreen(
                                                  teachingPlan: obs.obsRequest!
                                                      .teachingPlan!,
                                                  submitPlan: (stepAns,
                                                      templateId, editedBy) {
                                                    value.submitTeachingPlan(
                                                        context,
                                                        obsId: obs.id!,
                                                        steps: stepAns,
                                                        templateId: templateId,
                                                        facultyId: editedBy);
                                                  },
                                                  facultyId: obs.facultyId!,
                                                  observationId: obs.id!,
                                                  hideTeachinPlan: value
                                                      .setshowTeachingPlan())));
                                }
                              : null,
                          title: "INFORMED OBSERVATION SCHEDULING",
                          onTap: () {
                            if (obs.course != null &&
                                obs.obsRequest?.teachingPlan != null &&
                                obs.obsRequest!.teachingPlan!.editedBy ==
                                    null) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TeachingPlanScreen(
                                          teachingPlan:
                                              obs.obsRequest!.teachingPlan!,
                                          submitPlan:
                                              (stepAns, templateId, editedBy) {
                                            value.submitTeachingPlan(context,
                                                obsId: obs.id!,
                                                steps: stepAns,
                                                templateId: templateId,
                                                facultyId: editedBy);
                                          },
                                          facultyId: obs.facultyId!,
                                          observationId: obs.id!,
                                          hideTeachinPlan: null)));
                            }
                            if (!obs.obsRequest!.facultyAccepted!) {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          FacultySelectSlotScreen(obs: obs)));
                            }
                          },
                        ),
                        ObservationDetailCard(
                          obs: obs,
                          isScheduling: false,
                          isNotStarted:
                              obs.meetings!.informedObservation!.status ==
                                  "Pending",
                          isDisabled:
                              obs.meetings!.informedObservation!.status ==
                                  "Pending",
                          title: "INFORMED OBSERVATION",
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        ObserverRubricScreen(obs: obs)));
                          },
                        ),
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
