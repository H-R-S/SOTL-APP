import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/resources/constants/style.dart';
import 'package:sotl/view/screens/faculty/screens/observation_detail/sub_screens/obs_scheduling/teaching_plan.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';

class InformedObservationScheduling extends StatefulWidget {
  const InformedObservationScheduling({super.key});

  @override
  State<InformedObservationScheduling> createState() =>
      _InformedObservationSchedulingState();
}

class _InformedObservationSchedulingState
    extends State<InformedObservationScheduling> {
  ObservationViewModel observationModel = ObservationViewModel();
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Padding(
          padding: const EdgeInsets.all(20),
          child: ChangeNotifierProvider<ObservationViewModel>(
            create: (context) => observationModel,
            child: Consumer<ObservationViewModel>(
                builder: (context, value, child) {
              return SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "INFORMED OBSERVATION SCHEDULING",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 20),
                      const Row(
                        children: [
                          Text(
                            "Slot By Observer: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Slot By Observer: ",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      const Row(
                        children: [
                          Text(
                            "Slot By Observer: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          Text(
                            "Slot By Observer: ",
                            style: TextStyle(fontSize: 16),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          const Text(
                            "Teaching Plan: ",
                            style: TextStyle(fontSize: 16),
                          ),
                          GestureDetector(
                            onTap: () {
                              print('Text Tapped!');
                            },
                            child: const Text(
                              "Download",
                              style: TextStyle(
                                color: Colors.blue,
                                decoration: TextDecoration.underline,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      value.isCourseSelect
                          ? TeachingPlan()
                          : courseNotSelected(context)
                    ]),
              );
            }),
          )),
    );
  }

  Widget courseNotSelected(context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Column(children: [
          const Text('Observation not started',
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                  fontSize: 16)),
          const SizedBox(height: 10),
          ElevatedButton(
            onPressed: () {
              _showAlertDialog(context);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.circular(8), // Adjust the value as needed
              ),
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            ),
            child: const Text(
              'Select Course',
              style: TextStyle(
                fontSize: 18,
                color: Colors.white, // Set the text color
              ),
            ),
          ),
        ]),
      ],
    );
  }

  void _showAlertDialog(context) {
    final providerObs =
        Provider.of<ObservationViewModel>(context, listen: false);

    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text("Select Faculty course"),
            content: SizedBox(
              // Change as per your requirement
              width: MediaQuery.of(context).size.width *
                  0.7, // Change as per your requirement
              child: Scrollbar(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  itemBuilder: (BuildContext context, int index) {
                    return Row(
                      children: [
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 10.0),
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 10.0),
                          decoration: BoxDecoration(
                            border: Border.all(color: primary),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Text("Embedded Systems"),
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      backgroundColor: primary),
                  onPressed: () {
                    providerObs.setCourseSelected(true);
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Start Scheduling',
                    style: TextStyle(color: Colors.white),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4)),
                    backgroundColor: primary,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Colors.white),
                  )),
            ],
          );
        });
  }
}
