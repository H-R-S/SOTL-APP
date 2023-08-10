import 'package:flutter/material.dart';
import '../../../../../resources/constants/style.dart';
import '../../../../widgets/app_bar/my_app_bar.dart';

class RubricScreen extends StatefulWidget {
  const RubricScreen({super.key});

  @override
  State<RubricScreen> createState() => _RubricScreenState();
}

class _RubricScreenState extends State<RubricScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  List<String> options = [
    'Instruction shows no alignment with adopted standards, PLOs and CLOs.',
    'Instruction shows partial alignment (< 50%) with adopted standards, PLOs and CLOs.',
    'Instruction shows reasonable alignment (50% - 90%) with adopted standards, PLOs and CLOs.',
    'Instruction shows consistent alignment (90% - 100%) with adopted standards, PLOs and CLOs'
  ];
  List<String> Part1 = [
    "1. Instruction (including class activities) shows alignment with the programme and course learning outcomes (PLOs and CLOs) and any specified standards.",
    "2. Instruction (including class activities) demonstrates knowledge of the content area, relevant terminology and discipline-specific concepts and skills.",
    "3. Instruction (including class activities) engages students as members of a learning community within their content and/or discipline.",
    "4. Instruction (including class activities) encourages students to utilize their prior content knowledge and to acknowledge their preconceptions about the topic.",
    "5. Instruction (including class activities) explores connections with other content disciplines and/or real world situations."
  ];

  List<String> Part2 = [
    "6. Instruction (including class activities) demonstrates ANY of the following instructional strategies: student-centered approaches (e.g. Active Learning), differentiated instruction (e.g. Universal Design for Learning), experiential learning approaches (e.g. field tours, authentic real-world examples) and/or resources to fit varied student learning styles and needs.",
    "7. Instruction (including class activities) demonstrates a visible movement (e.g. factual knowledge > understanding > application > analysis > integration) and/or learning progression (e.g. easy to difficult and/or basic to complex).",
    "8. Instruction (including class activities) demonstrates use of student engagement strategies such as purposeful questions, strategic grouping, instructional pacing, use of technologies, digital media, and other learning resources.",
    "9. Instruction (including class activities) is responsive to students’ questions, input and examples.",
    "10. Instruction (including class activities) generates a high proportion of student talk between and among students to discuss ideas."
  ];

  List<String> Part3 = [
    "11. Assessments (formative and/or summative) show alignment with the programme and course learning outcomes (PLOs and CLOs) and any specified standards.",
    "12. Assessments (formative and/or summative) are ranged across formative and summative types.",
    "13. Assessments (formative and/or summative) are SMART i.e. specific, measurable, achievable, relevant, and time-bound.",
    "14. Assessments (formative and/or summative) offer a visible movement (e.g. factual knowledge > understanding > application > analysis > integration) and/or learning progression (e.g. easy to difficult and/or basic to complex).",
    "15. Assessments (formative and/or summative) clearly communicate how the students will be assessed (e.g. rubrics, marking guides, etc.)"
  ];

  List<String> Part4 = [
    "16. Instruction, class activities and/or assessments enable the following amongst students: self-directed learning, self-awareness, self-regulation, social awareness, independence, and responsible decision-making.",
    "17. Instruction, class activities and/or assessments support an enabling environment for collaboration across mixed-ability and multilevel student groups.",
    "18. Instruction, class activities and/or assessments encourage a culture of respect for diverse opinions, reflections and unconventional ideas.",
    "19. Instruction, class activities and/or assessments support students who are grappling with challenging material and difficult tasks.",
    "20. Instruction, class activities and/or assessments support communication of ideas through a variety of resources (e.g. digital technologies, learning games, platforms, media, slideshow, models, drawings, graphs, concrete materials, manipulatives, etc.)"
  ];
  List<bool> selectedOptions = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    final style2 = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Styles.fontColor);
    return DefaultTabController(
      length: 4, // Specify the number of tabs
      child: Scaffold(
        // appBar: AppBar(
        //   automaticallyImplyLeading: false,
        //   bottom:

        // MyAppBar(
        //   scaffoldKey,
        //   context,
        //   isBack: true,
        //   title: 'Rubrics',
        //   bottom: TabBar(
        //     indicatorColor: primary,
        //     indicatorSize: TabBarIndicatorSize.label,
        //     labelColor: Styles.fontColor,
        //     tabs: const [
        //       Tab(
        //         text: '1.A',
        //       ),
        //       Tab(
        //         text: '1.B',
        //       ),
        //       Tab(
        //         text: '1.C',
        //       ),
        //       Tab(
        //         text: '1.D',
        //       ),
        //     ],
        //   ),
        // ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SCORE BY FACULTY:"),
                        Text("0.0 / 80", style: style2),
                        SizedBox(height: 10.0),
                        Text("FINAL SCORE:"),
                        Text("0.0 / 80", style: style2),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [],
                        )
                      ],
                    ),
                    SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("SCORE BY OBSERVER:"),
                        Text("0.0 / 80", style: style2),
                        SizedBox(height: 10.0),
                        Text("SCORE PERCENTAGE:"),
                        Text(
                          "0.0%",
                          style: style2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              TabBar(
                indicatorColor: primary,
                indicatorSize: TabBarIndicatorSize.label,
                labelColor: Styles.fontColor,
                tabs: const [
                  Tab(
                    text: '1.A',
                  ),
                  Tab(
                    text: '1.B',
                  ),
                  Tab(
                    text: '1.C',
                  ),
                  Tab(
                    text: '1.D',
                  ),
                ],
              ),
              Expanded(
                child: TabBarView(
                  children: [
                    elementTab(
                        questionList: Part1, data: "1.A KNOWLEDGE OF CONTENT"),
                    elementTab(
                        questionList: Part2, data: "1.B KNOWLEDGE OF PEDAGOGY"),
                    elementTab(
                        questionList: Part3, data: "1.C STUDENT ASSESSMENT"),
                    elementTab(
                        questionList: Part4, data: "1.D LEARNING ENVIRONMENT"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget elementTab(
      {required List<String> questionList, required String data}) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: Column(
          children: [
            Container(
              width: size.width,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              decoration: const BoxDecoration(
                color: primary,
              ),
              child: Text(
                data,
                style: TextStyle(color: Styles.whiteColor),
              ),
            ),
            elementPartsExpansionTile(
                context: context,
                question: questionList[0],
                elementDescription: options,
                selectedOptions: selectedOptions),
            elementPartsExpansionTile(
                context: context,
                question: questionList[1],
                elementDescription: options,
                selectedOptions: selectedOptions),
            elementPartsExpansionTile(
                context: context,
                question: questionList[2],
                elementDescription: options,
                selectedOptions: selectedOptions),
            elementPartsExpansionTile(
                context: context,
                question: questionList[3],
                elementDescription: options,
                selectedOptions: selectedOptions),
          ],
        ),
      ),
    );
  }

  Widget elementPartsExpansionTile(
      {required BuildContext context,
      required String question,
      required List<String> elementDescription,
      required List<bool> selectedOptions}) {
    const style = TextStyle(fontSize: 16, color: primary);

    List<String> points = [
      "Non Demonstrating (1)",
      "Developing (2)",
      "Applying (3)",
      "Innovating (4)"
    ];
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10.0),
          Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: primary,
                boxShadow: const [
                  BoxShadow(
                      color: grey,
                      spreadRadius: 1,
                      blurRadius: 5,
                      offset: Offset(0, 4)),
                ],
              ),
              margin: const EdgeInsets.only(top: 5, bottom: 10),
              child: Stack(
                alignment: Alignment.centerLeft,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.all(Radius.circular(5)),
                      color: Styles.scaffoldBgColor,
                    ),
                    margin: const EdgeInsets.only(left: 10),
                    padding: const EdgeInsets.only(right: 10),
                    child: Theme(
                      data: ThemeData()
                          .copyWith(dividerColor: Colors.transparent),
                      child: ListTileTheme(
                        contentPadding: EdgeInsets.zero,
                        dense: true,
                        horizontalTitleGap: 0.0,
                        minLeadingWidth: 0,
                        child: ExpansionTile(
                          // trailing: Column(
                          //   mainAxisAlignment: MainAxisAlignment.center,
                          //   children: [
                          //     SizedBox(
                          //       height: 20,
                          //     ),
                          //     Icon(Icons.arrow_downward_rounded)
                          //   ],
                          // ),
                          tilePadding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          childrenPadding: const EdgeInsets.symmetric(
                              vertical: 5.0, horizontal: 10.0),
                          title: GestureDetector(
                            onTap: () {},
                            child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("$question ",
                                      style: style.copyWith(
                                          fontSize: 14,
                                          color: Styles.fontColor)),
                                ]),
                          ),
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: ScoringSlider(),

                              // ListView.builder(
                              //     physics: const NeverScrollableScrollPhysics(),
                              //     shrinkWrap: true,
                              //     itemCount: 4,
                              //     itemBuilder: (context, index) {
                              //       return Column(
                              //         crossAxisAlignment:
                              //             CrossAxisAlignment.start,
                              //         children: [
                              //           const SizedBox(height: 15),
                              //           Text(points[index],
                              //               style: style.copyWith(
                              //                   fontSize: 12,
                              //                   color: Styles.fontColor)),
                              //           const SizedBox(height: 5),
                              //           Container(
                              //             padding: const EdgeInsets.all(10),
                              //             decoration: BoxDecoration(
                              //                 color: Colors.white,
                              //                 border: Border.all(
                              //                     width: 0.2,
                              //                     color: Styles.fontColor),
                              //                 borderRadius:
                              //                     BorderRadius.circular(10)),
                              //             child: ListTile(
                              //               leading: CustomCheckBox(
                              //                 isChecked: selectedOptions[index],
                              //                 onChanged: (value) {
                              //                   setState(() {
                              //                     selectedOptions[index] =
                              //                         value;
                              //                   });
                              //                 },
                              //               ),
                              //               title: Padding(
                              //                 padding: const EdgeInsets.only(
                              //                     left: 8.0),
                              //                 child: Text(
                              //                   elementDescription[index],
                              //                   style: style.copyWith(
                              //                       fontSize: 12,
                              //                       color: Styles.fontColor),
                              //                 ),
                              //               ),
                              //             ),
                              //           )
                              //         ],
                              //       );
                              //     }),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              )),
        ],
      ),
    );
  }
}

class ScoringSlider extends StatefulWidget {
  @override
  _ScoringSliderState createState() => _ScoringSliderState();
}

class _ScoringSliderState extends State<ScoringSlider> {
  double _currentScore = 0.0; // Initial score value
  String score = "Non Demonstrating(0)";
  displayCat(newValue) {
    if (newValue == 0.0) {
      score = "Non Demonstrating (0)";
    } else if (newValue == 0.5) {
      score = "Non Demonstrating + Limiting (0.5)";
    } else if (newValue == 1) {
      score = "Limiting  (1.0)";
    } else if (newValue == 1.5) {
      score = "Limiting + Developing (1.5)";
    } else if (newValue == 2.0) {
      score = "Developing  (2.0)";
    } else if (newValue == 2.5) {
      score = "Developing + Applying  (2.5)";
    } else if (newValue == 3.0) {
      score = "Applying   (3.0)";
    } else if (newValue == 3.5) {
      score = "Applying + Innovating  (3.5)";
    } else if (newValue == 4.0) {
      score = "Innovating   (4.0)";
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 16, color: primary);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          ' $score',
          style: style.copyWith(fontSize: 14, color: Styles.fontColor),
        ),
        const SizedBox(height: 20),
        Slider(
          label: _currentScore.toStringAsFixed(1),
          value: _currentScore,
          min: 0,
          max: 4,
          divisions: 8,
          onChanged: (newValue) {
            _currentScore = newValue;
            displayCat(newValue);
          },
        ),
      ],
    );
  }
}

// class CustomCheckBox extends StatefulWidget {
//   final bool isChecked;
//   final Function(bool) onChanged;

//   CustomCheckBox({
//     super.key,
//     required this.isChecked,
//     required this.onChanged,
//   });

//   @override
//   _CustomCheckBoxState createState() => _CustomCheckBoxState();
// }

// class _CustomCheckBoxState extends State<CustomCheckBox> {
//   @override
//   Widget build(BuildContext context) {
//     return GestureDetector(
//       onTap: () {
//         widget.onChanged(!widget.isChecked);
//       },
//       child: Icon(
//         widget.isChecked ? Icons.check_circle : Icons.circle,
//         color: widget.isChecked ? Colors.green : Colors.grey,
//         size: 18,
//       ),
//     );
//   }
// }
