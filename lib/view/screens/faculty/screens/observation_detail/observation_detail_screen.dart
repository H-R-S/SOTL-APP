import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/data/enums/status.dart';
import 'package:sotl/resources/constants/style.dart';
import 'package:sotl/view/screens/common/screens/rubrics/rubrics_screen.dart';
import 'package:sotl/view/screens/faculty/screens/observation_detail/sub_screens/obs_scheduling/informed_observation_scheduling.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';

class ObservationDetailScreen extends StatefulWidget {
  final int observationId;

  const ObservationDetailScreen({super.key, required this.observationId});
  @override
  State<ObservationDetailScreen> createState() =>
      ObservationDetailScreenState();
}

class ObservationDetailScreenState extends State<ObservationDetailScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  // @override
  // void dispose() {
  //   observationModel.controller.dispose();
  //   super.dispose();
  // }

  final style =
      const TextStyle(fontWeight: FontWeight.bold, color: Colors.black);

  ObservationViewModel observationModel = ObservationViewModel();

  @override
  void initState() {
    observationModel.getAllObservationById(widget.observationId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    debugPrint(widget.observationId.toString());
    double width = MediaQuery.of(context).size.width;

    return ChangeNotifierProvider<ObservationViewModel>(
      create: (context) => observationModel,
      child: Consumer<ObservationViewModel>(
        builder: (context, value, child) {
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
                  child: CircularProgressIndicator(),
                ),
              );
            case Status.COMPLETED:
              return Scaffold(
                resizeToAvoidBottomInset: false,
                appBar: MyAppBar(
                  scaffoldKey,
                  context,
                  title: "Detail Observation",
                  isBack: true,
                  bottom: PreferredSize(
                    preferredSize: const Size.fromHeight(60),
                    child: SizedBox(
                      width: width * 0.90,
                      child: Column(
                        children: [
                          SizedBox(
                            height: 20,
                            child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: [
                                Text("SCHEDULING",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: value.getCurrentIndex() == 0
                                            ? primary
                                            : Colors.black)),
                                const SizedBox(width: 10),
                                Text("OBSERVATION",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: value.getCurrentIndex() == 1
                                            ? primary
                                            : Colors.black)),
                                const SizedBox(width: 10),
                                Text("MEETING",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: value.getCurrentIndex() == 2
                                            ? primary
                                            : Colors.black)),
                                const SizedBox(width: 10),
                                Text("UNINFORMED",
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: value.getCurrentIndex() == 3
                                            ? primary
                                            : Colors.black)),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: LinearProgressIndicator(
                              value: value.valuefunction(),
                              color: primary,
                              backgroundColor: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                body: PageView(
                    onPageChanged: (index) {
                      value.setCurrentIndex(index);
                    },
                    controller: value.controller,
                    scrollDirection: Axis.horizontal,
                    children: [
                      InformedObservationScheduling(
                        observationId: widget.observationId,
                        observationModel: observationModel,
                      ),
                      const RubricScreen(),
                      Container(),
                      Container(),
                    ]),
              );
            default:
              return const Scaffold(
                body: Center(child: Text("Error Occured in main Body")),
              );
          }
        },
      ),
    );
  }
}
