import 'package:flutter/material.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/resources/constants/style.dart';

class TeachingPlanWidget extends StatefulWidget {
  final TeachingPlan teachingPlan;
  final MyCallback? submitPlan;
  final HidePlanCallback? hideTeachinPlan;
  final int facultyId;
  final int observationId;

  const TeachingPlanWidget(
      {super.key,
      required this.teachingPlan,
      required this.submitPlan,
      required this.facultyId,
      required this.observationId,
      required this.hideTeachinPlan});

  @override
  State<TeachingPlanWidget> createState() => _TeachingPlanWidgetState();
}

typedef MyCallback = void Function(List<Map<String, dynamic>> stepAns,
    int templateId, int editedBy); // Define the callback type

typedef HidePlanCallback = void Function(); // Define the callback type

class _TeachingPlanWidgetState extends State<TeachingPlanWidget> {
  // TextEditingController ans1Controller = TextEditingController();
  // TextEditingController ans2Controller = TextEditingController();
  // TextEditingController ans3Controller = TextEditingController();
  // TextEditingController ans4Controller = TextEditingController();
  // TextEditingController ans5Controller = TextEditingController();
  // TextEditingController ans6Controller = TextEditingController();
  // TextEditingController textController = TextEditingController();

  final List<TextEditingController> _controllers =
      List.generate(7, (_) => TextEditingController());
  final List<GlobalKey<FormState>> _formKeys =
      List.generate(7, (_) => GlobalKey<FormState>());

  @override
  void initState() {
    super.initState();
    // Populate text fields with fetched data
    for (int i = 0; i < _controllers.length; i++) {
      if (widget.teachingPlan.steps![i].response != null) {
        _controllers[i].text =
            widget.teachingPlan.steps![i].response.toString();
      }
    }
  }

  @override
  void dispose() {
    // Dispose of the controllers to prevent memory leaks
    for (final controller in _controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final style =
        TextStyle(fontWeight: FontWeight.w600, color: Styles.fontColor);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Provide Teaching Plan Details (Words limit: 500 each)",
            style: style.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          const SizedBox(height: 40.0),
          ListView.builder(
              keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.teachingPlan.steps!.length,
              itemBuilder: (context, index) {
                // final step = widget.teachingPlan.steps![index];

                return Form(
                  key: _formKeys[index],
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.teachingPlan.steps![index].field ?? "",
                        style: style,
                      ),
                      const SizedBox(height: 20.0),
                      TextFormField(
                        readOnly:
                            widget.teachingPlan.editedBy == null ? false : true,
                        maxLines: 5,
                        controller: _controllers[index],
                        validator: (value) {
                          debugPrint("Value is: ${value.runtimeType}");
                          if (value == null || value.isEmpty) {
                            return 'Please enter some text.';
                          }
                          // Add more validation logic as needed.
                          return null;
                        },
                        decoration: InputDecoration(
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Styles.fontColor),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(width: 1, color: Styles.fontColor),
                          ),
                          errorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 1, color: Colors.red),
                          ),
                          focusedErrorBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.red, width: 1),
                          ),
                        ),
                        onEditingComplete: () {
                          // setState(() {
                          //   widget.teachingPlan.steps![index].response =
                          //       textController.text;
                          // });
                          debugPrint(
                              "$index: ${widget.teachingPlan.steps![index].response}");
                        },
                        maxLength: 500,
                      ),
                      const SizedBox(height: 40)
                    ],
                  ),
                );
              }),
          // const SizedBox(height: 20.0),
          // Text(
          //   "Program Outcomes for this Program (PLOs)",
          //   style: style,
          // ),
          // const SizedBox(height: 20.0),
          // customTextField(controller: ans1Controller),
          // Text(
          //   "Learning Outcomes for this Course (CLOs)",
          //   style: style,
          // ),
          // const SizedBox(height: 10.0),
          // customTextField(controller: ans2Controller),
          // const SizedBox(height: 20.0),
          // Text(
          //   "Learning Resources",
          //   style: style,
          // ),
          // const SizedBox(height: 10.0),
          // customTextField(controller: ans3Controller),
          // const SizedBox(height: 20.0),
          // Text(
          //   "Teaching Summary",
          //   style: style,
          // ),
          // const SizedBox(height: 10.0),
          // customTextField(controller: ans4Controller),
          // const SizedBox(height: 20.0),
          // Text(
          //   "Pre Teaching / Warm-up",
          //   style: style,
          // ),
          // const SizedBox(height: 10.0),
          // customTextField(controller: ans5Controller),
          // const SizedBox(height: 20.0),
          // Text(
          //   "Post Teaching",
          //   style: style,
          // ),
          // const SizedBox(height: 10.0),
          // customTextField(controller: ans6Controller),
          // const SizedBox(height: 20.0),
          // Text(
          //   "Learning Feedbacks (activity, quiz, no-graded/graded assessments)",
          //   style: style,
          // ),
          // const SizedBox(height: 10.0),
          // customTextField(controller: ans7Controller),
          // const SizedBox(height: 20.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  // _showAlertDialog(context);
                  // bool isAnyResponseEmpty(List<Steps> steps) {
                  //   // Check if any response is empty (null or an empty string)
                  //   return steps.any((step) =>
                  //       step.response == null || step.response!.isEmpty);
                  // }
                  if (widget.teachingPlan.editedBy == null) {
                    submitTeachinPlanData();
                  } else {
                    widget.hideTeachinPlan!();
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: primary,
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.circular(8), // Adjust the value as needed
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                ),
                child: Text(
                  widget.teachingPlan.editedBy == null
                      ? 'Submit'
                      : 'Edit Scheduling',
                  style: const TextStyle(
                    fontSize: 18,
                    color: Colors.white, // Set the text color
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 40.0),
        ],
      ),
    );
  }

  Widget customTextField({required TextEditingController? controller}) {
    return TextField(
      maxLength: 500,
      maxLines: 5,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Styles.fontColor), //<-- Change this
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(width: 1, color: Styles.fontColor), //<-- SEE HERE
        ),
      ),
    );
  }

  submitTeachinPlanData() {
    bool allValid = true;
    for (int i = 0; i < _controllers.length; i++) {
      if (!_formKeys[i].currentState!.validate()) {
        allValid = false;
      }
    }
    if (!allValid) {
      // All fields are valid, you can perform further actions here.
      // Access the text from each controller like this: _controllers[index].text
      // Example: print(_controllers[0].text);
      debugPrint("We are into this");
    }
    // if (isAnyResponseEmpty(widget.teachingPlan.steps!)) {
    //   // Handle the case where any response is empty
    // }
    else {
      // Handle the case where all responses are filled
      List<Map<String, dynamic>> abc = [];
      for (int i = 0; i < _controllers.length; i++) {
        // Access the text from the TextEditingController
        String controllerText = _controllers[i].text;

        // Add the data to the abc list
        abc.add({
          "id": widget.teachingPlan.steps![i].id,
          "response": controllerText,
        });
      }
      // for (var ans in widget.teachingPlan.steps!) {
      //   abc.add(
      //     {"id": ans.id, "response": _controllers[i].text.},
      //     // ans.response.toString()
      //   );
      // }

      widget.submitPlan!(
          abc, widget.teachingPlan.steps![0].templatePlanId!, widget.facultyId);
    }
  }

  void _showAlertDialog(context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text("Provide Available Time Slot"),
            content: SizedBox(
              // Change as per your requirement
              width: MediaQuery.of(context).size.width *
                  0.7, // Change as per your requirement
              child: Scrollbar(
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 3,
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
                          child: const Text("Wednesday | 8:30 | E601"),
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
                  onPressed: () {},
                  // _selectDateByObserver(context),
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

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
