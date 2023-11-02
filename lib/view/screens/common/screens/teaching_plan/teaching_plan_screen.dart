import 'package:flutter/material.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/resources/constants/style.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';

class TeachingPlanScreen extends StatefulWidget {
  final TeachingPlan teachingPlan;
  final MyCallback? submitPlan;
  final HidePlanCallback? hideTeachinPlan;
  final int facultyId;
  final int observationId;

  const TeachingPlanScreen(
      {super.key,
      required this.teachingPlan,
      required this.submitPlan,
      required this.facultyId,
      required this.observationId,
      required this.hideTeachinPlan});

  @override
  State<TeachingPlanScreen> createState() => _TeachingPlanScreenState();
}

typedef MyCallback = void Function(List<Map<String, dynamic>> stepAns,
    int templateId, int editedBy); // Define the callback type

typedef HidePlanCallback = void Function(); // Define the callback type

class _TeachingPlanScreenState extends State<TeachingPlanScreen> {
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
    return Scaffold(
      appBar: const MyAppBar(
        isBack: true,
        title: "Teaching Plan",
      ),
      persistentFooterButtons: [
        if (widget.hideTeachinPlan != null)
          Padding(
            padding: const EdgeInsets.all(10),
            child: MyElevatedButton(
                title: 'Submit',
                onTap: () {
                  if (widget.teachingPlan.editedBy == null) {
                    submitTeachinPlanData();
                  } else {
                    widget.hideTeachinPlan!();
                  }
                }),
          )
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: GestureDetector(
            onTap: () => FocusScope.of(context).unfocus(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Provide Teaching Plan Details (Words limit: 500 each)",
                  style:
                      style.copyWith(fontSize: 18, fontWeight: FontWeight.w500),
                ),
                const SizedBox(height: 40.0),
                ListView.builder(
                    keyboardDismissBehavior:
                        ScrollViewKeyboardDismissBehavior.onDrag,
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
                              readOnly: widget.teachingPlan.editedBy == null
                                  ? false
                                  : true,
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
                                  borderSide: BorderSide(
                                      width: 1, color: Styles.fontColor),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      width: 1, color: Styles.fontColor),
                                ),
                                errorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(width: 1, color: Colors.red),
                                ),
                                focusedErrorBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.red, width: 1),
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
                const SizedBox(height: 40.0),
              ],
            ),
          ),
        ),
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
      debugPrint("We are into this");
    } else {
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

      widget.submitPlan!(
          abc, widget.teachingPlan.steps![0].templatePlanId!, widget.facultyId);
    }
  }
}
