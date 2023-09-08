import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:sotl/view_models/observation/observation_view_model.dart';
import '../../../../../resources/constants/style.dart';

class RubricScreen extends StatefulWidget {
  const RubricScreen({super.key});

  @override
  State<RubricScreen> createState() => _RubricScreenState();
}

class _RubricScreenState extends State<RubricScreen> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();
  // List<String> options = [
  //   'Instruction shows no alignment with adopted standards, PLOs and CLOs.',
  //   'Instruction shows partial alignment (< 50%) with adopted standards, PLOs and CLOs.',
  //   'Instruction shows reasonable alignment (50% - 90%) with adopted standards, PLOs and CLOs.',
  //   'Instruction shows consistent alignment (90% - 100%) with adopted standards, PLOs and CLOs'
  // ];

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
          child: Consumer<ObservationViewModel>(builder: (_, value, __) {
            return Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("SCORE BY FACULTY:"),
                          Text("0.0 / 80", style: style2),
                          const SizedBox(height: 10.0),
                          const Text("FINAL SCORE:"),
                          Text("0.0 / 80", style: style2),
                          const Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [],
                          )
                        ],
                      ),
                      const SizedBox(height: 20),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text("SCORE BY OBSERVER:"),
                          Text("0.0 / 80", style: style2),
                          const SizedBox(height: 10.0),
                          const Text("SCORE PERCENTAGE:"),
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
                          elementNo: 1,
                          questionList: value.Part1,
                          data: "1.A KNOWLEDGE OF CONTENT"),
                      elementTab(
                          elementNo: 2,
                          questionList: value.Part2,
                          data: "1.B KNOWLEDGE OF PEDAGOGY"),
                      elementTab(
                          elementNo: 3,
                          questionList: value.Part3,
                          data: "1.C STUDENT ASSESSMENT"),
                      elementTab(
                          elementNo: 4,
                          questionList: value.Part4,
                          data: "1.D LEARNING ENVIRONMENT"),
                    ],
                  ),
                ),
              ],
            );
          }),
        ),
      ),
    );
  }

  Widget elementTab(
      {required List<String> questionList,
      required int elementNo,
      required String data}) {
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
            ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: 5,
              itemBuilder: (context, index) {
                return elementPartsExpansionTile(
                  context: context,
                  question: questionList[index],
                  elementNo: elementNo,
                  index: index,
                  selectedOptions: selectedOptions,
                );
              },
            ),
            const SizedBox(height: 30),
            Consumer<ObservationViewModel>(builder: (context, value, __) {
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 80.0),
                child: MyElevatedButton(
                    title: "Submit",
                    onTap: value.checkIfAllIndexesAreTrue(elementNo) == true
                        ? () {}
                        : null),
              );
            }),
            const SizedBox(height: 30),
          ],
        ),
      ),
    );
  }

  Widget elementPartsExpansionTile(
      {required BuildContext context,
      required String question,
      required int elementNo,
      required int index,
      // required List<String> elementDescription,
      required List<bool> selectedOptions}) {
    const style = TextStyle(fontSize: 16, color: primary);

    // List<String> points = [
    //   "Non Demonstrating (1)",
    //   "Developing (2)",
    //   "Applying (3)",
    //   "Innovating (4)"
    // ];
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
              child: Container(
                color: Styles.scaffoldBgColor,
                margin: const EdgeInsets.only(left: 10),
                padding: const EdgeInsets.fromLTRB(15, 10, 10, 0),
                child: Column(
                  children: [
                    Text("$question ",
                        style: style.copyWith(
                            fontSize: 14, color: Styles.fontColor)),
                    ListTile(
                      contentPadding: EdgeInsets.zero,
                      title: ScoringSlider(elementNo: elementNo, index: index),

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
              )),
        ],
      ),
    );
  }
}

class ScoringSlider extends StatefulWidget {
  final int elementNo;
  final int index;
  const ScoringSlider(
      {super.key, required this.elementNo, required this.index});

  @override
  _ScoringSliderState createState() => _ScoringSliderState();
}

class _ScoringSliderState extends State<ScoringSlider> {
  double _currentScore = 0.0; // Initial score value
  String score = "Non Demonstrating(0)";
  // bool _hasValueChanged = false;

  displayCat(newValue) {
    if (newValue == 0.0) {
      score = "Non Demonstrating (0)";
    } else if (newValue == 1) {
      score = "Limiting  (1.0)";
    } else if (newValue == 2.0) {
      score = "Developing  (2.0)";
    } else if (newValue == 3.0) {
      score = "Applying   (3.0)";
    } else if (newValue == 4.0) {
      score = "Innovating   (4.0)";
    }
    // _hasValueChanged = true;
    // setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    const style = TextStyle(fontSize: 16, color: primary);

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(height: 10),
        Text(
          ' $score',
          style: style.copyWith(fontSize: 14, color: Styles.fontColor),
        ),
        const SizedBox(height: 10),
        Consumer<ObservationViewModel>(builder: (_, value, __) {
          return Slider(
            label: _currentScore.toStringAsFixed(1),
            value: _currentScore,
            min: 0,
            max: 4,
            divisions: 4,
            activeColor: value.sliderValueChangedList[widget.elementNo]
                    [widget.index]
                ? primary
                : Colors
                    .grey, // Set active color based on whether it has changed
            onChanged: (newValue) {
              _currentScore = newValue;
              value.setValueChanged(widget.elementNo, widget.index, true);
              displayCat(newValue);
            },
          );
        }),
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


//---------------------------------------  Rubric Expansion Tile ---------------------------------------------

// Widget elementPartsExpansionTile(
//       {required BuildContext context,
//       required String question,
//       required List<String> elementDescription,
//       required List<bool> selectedOptions}) {
//     const style = TextStyle(fontSize: 16, color: primary);

//     List<String> points = [
//       "Non Demonstrating (1)",
//       "Developing (2)",
//       "Applying (3)",
//       "Innovating (4)"
//     ];
//     return Padding(
//       padding: const EdgeInsets.symmetric(vertical: 10.0),
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           const SizedBox(height: 10.0),
//           Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(5),
//                 color: primary,
//                 boxShadow: const [
//                   BoxShadow(
//                       color: grey,
//                       spreadRadius: 1,
//                       blurRadius: 5,
//                       offset: Offset(0, 4)),
//                 ],
//               ),
//               margin: const EdgeInsets.only(top: 5, bottom: 10),
//               child: Stack(
//                 alignment: Alignment.centerLeft,
//                 children: [
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: const BorderRadius.all(Radius.circular(5)),
//                       color: Styles.scaffoldBgColor,
//                     ),
//                     margin: const EdgeInsets.only(left: 10),
//                     padding: const EdgeInsets.only(right: 10),
//                     child: Theme(
//                       data: ThemeData()
//                           .copyWith(dividerColor: Colors.transparent),
//                       child: ListTileTheme(
//                         contentPadding: EdgeInsets.zero,
//                         dense: true,
//                         horizontalTitleGap: 0.0,
//                         minLeadingWidth: 0,
//                         child: ExpansionTile(
//                           // trailing: Column(
//                           //   mainAxisAlignment: MainAxisAlignment.center,
//                           //   children: [
//                           //     SizedBox(
//                           //       height: 20,
//                           //     ),
//                           //     Icon(Icons.arrow_downward_rounded)
//                           //   ],
//                           // ),
//                           tilePadding: const EdgeInsets.symmetric(
//                               vertical: 5.0, horizontal: 10.0),
//                           childrenPadding: const EdgeInsets.symmetric(
//                               vertical: 5.0, horizontal: 10.0),
//                           title: GestureDetector(
//                             onTap: () {},
//                             child: Column(
//                                 mainAxisAlignment: MainAxisAlignment.start,
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text("$question ",
//                                       style: style.copyWith(
//                                           fontSize: 14,
//                                           color: Styles.fontColor)),
//                                 ]),
//                           ),
//                           children: const [
//                             ListTile(
//                               contentPadding: EdgeInsets.zero,
//                               title: ScoringSlider(),

//                               // ListView.builder(
//                               //     physics: const NeverScrollableScrollPhysics(),
//                               //     shrinkWrap: true,
//                               //     itemCount: 4,
//                               //     itemBuilder: (context, index) {
//                               //       return Column(
//                               //         crossAxisAlignment:
//                               //             CrossAxisAlignment.start,
//                               //         children: [
//                               //           const SizedBox(height: 15),
//                               //           Text(points[index],
//                               //               style: style.copyWith(
//                               //                   fontSize: 12,
//                               //                   color: Styles.fontColor)),
//                               //           const SizedBox(height: 5),
//                               //           Container(
//                               //             padding: const EdgeInsets.all(10),
//                               //             decoration: BoxDecoration(
//                               //                 color: Colors.white,
//                               //                 border: Border.all(
//                               //                     width: 0.2,
//                               //                     color: Styles.fontColor),
//                               //                 borderRadius:
//                               //                     BorderRadius.circular(10)),
//                               //             child: ListTile(
//                               //               leading: CustomCheckBox(
//                               //                 isChecked: selectedOptions[index],
//                               //                 onChanged: (value) {
//                               //                   setState(() {
//                               //                     selectedOptions[index] =
//                               //                         value;
//                               //                   });
//                               //                 },
//                               //               ),
//                               //               title: Padding(
//                               //                 padding: const EdgeInsets.only(
//                               //                     left: 8.0),
//                               //                 child: Text(
//                               //                   elementDescription[index],
//                               //                   style: style.copyWith(
//                               //                       fontSize: 12,
//                               //                       color: Styles.fontColor),
//                               //                 ),
//                               //               ),
//                               //             ),
//                               //           )
//                               //         ],
//                               //       );
//                               //     }),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ],
//               )),
//         ],
//       ),
//     );
//   }
// }