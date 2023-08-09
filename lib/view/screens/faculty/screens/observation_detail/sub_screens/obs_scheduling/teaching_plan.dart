import 'package:flutter/material.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/resources/constants/style.dart';

class TeachingPlanWidget extends StatefulWidget {
  final TeachingPlan teachingPlan;

  const TeachingPlanWidget({super.key, required this.teachingPlan});

  @override
  State<TeachingPlanWidget> createState() => _TeachingPlanWidgetState();
}

class _TeachingPlanWidgetState extends State<TeachingPlanWidget> {
  TextEditingController ans1Controller = TextEditingController();
  TextEditingController ans2Controller = TextEditingController();
  TextEditingController ans3Controller = TextEditingController();
  TextEditingController ans4Controller = TextEditingController();
  TextEditingController ans5Controller = TextEditingController();
  TextEditingController ans6Controller = TextEditingController();

  TextEditingController textController = TextEditingController();

  @override
  void dispose() {
    ans1Controller.dispose();
    ans2Controller.dispose();
    ans3Controller.dispose();
    ans4Controller.dispose();
    ans5Controller.dispose();
    ans6Controller.dispose();
    // ans7Controller.dispose();

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
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: widget.teachingPlan.steps!.length,
              itemBuilder: (context, index) {
                final step = widget.teachingPlan.steps![index];

                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      step.field ?? "",
                      style: style,
                    ),
                    const SizedBox(height: 20.0),
                    TextField(
                      maxLines: 5,
                      decoration: InputDecoration(
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1,
                              color: Styles.fontColor), //<-- Change this
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              width: 1, color: Styles.fontColor), //<-- SEE HERE
                        ),
                      ),
                      onEditingComplete: () {
                        setState(() {
                          step.response = textController.text;
                        });
                        print("$index: ${step.response}");
                      },
                      maxLength: 500,
                    ),
                    const SizedBox(height: 40)
                  ],
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
                  _showAlertDialog(context);
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
                child: const Text(
                  'Submit',
                  style: TextStyle(
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
                          child: Text("Wednesday | 8:30 | E601"),
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
                  onPressed: () => _selectDateByObserver(context),
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

  void _selectDateByObserver(context) {
    DateTime selectedDate = DateTime.now();
    String datePicked = "dd/mm/yyyy";

    Future<void> _selectDate(BuildContext context) async {
      final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2000),
        lastDate: DateTime(2101),
      );
      if (picked != null && picked != selectedDate) {
        setState(() {
          selectedDate = picked;
          datePicked = picked.toString(); // Update the TextField value
        });
      }
    }

    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text("Select Observation Date"),
            content: SizedBox(
              width: MediaQuery.of(context).size.width *
                  0.7, // Change as per your requirement
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Text("Select Faculty Slot"),
                  const SizedBox(height: 10.0),
                  SizedBox(
                    height: 80,
                    child: Scrollbar(
                      child: ListView.builder(
                        shrinkWrap: true,
                        itemCount: 10,
                        itemBuilder: (BuildContext context, int index) {
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(vertical: 5.0),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 5.0, horizontal: 5.0),
                                decoration: BoxDecoration(
                                  border: Border.all(color: primary),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                child: Text("Wednesday | 8:30 | E601"),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  const Text("Provide Date"),
                  const SizedBox(height: 10.0),
                  GestureDetector(
                    onTap: () => _selectDate(context),
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 4.0, horizontal: 10.0),
                      width: MediaQuery.of(context).size.width *
                          0.7, // Change as per your requirement
                      decoration: BoxDecoration(
                        border: Border.all(color: primary),
                      ),
                      child: Text(datePicked),
                    ),
                  )
                ],
              ),
            ),
            actions: [
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(4)),
                      backgroundColor: primary),
                  onPressed: () {},
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
