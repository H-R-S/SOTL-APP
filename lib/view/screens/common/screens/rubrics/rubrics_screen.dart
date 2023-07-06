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
  List<bool> selectedOptions = [false, false, false, false];
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5, // Specify the number of tabs
      child: Scaffold(
        appBar: MyAppBar(
          scaffoldKey,
          context,
          isBack: true,
          title: 'Rubrics',
          bottom: TabBar(
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
              Tab(
                text: '1.E',
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            elementTab(),
            elementTab(),
            elementTab(),
            elementTab(),
            elementTab(),
          ],
        ),
      ),
    );
  }

  Widget elementTab() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            elementPartsExpansionTile(
                context: context,
                elementHeading: "1.A Demonstrating Knowledge of Content",
                elementDescription: options,
                selectedOptions: selectedOptions),
            elementPartsExpansionTile(
                context: context,
                elementHeading: "1.B Demonstrating Knowledge of Content",
                elementDescription: options,
                selectedOptions: selectedOptions),
            elementPartsExpansionTile(
                context: context,
                elementHeading: "1.C Demonstrating Knowledge of Content",
                elementDescription: options,
                selectedOptions: selectedOptions),
            elementPartsExpansionTile(
                context: context,
                elementHeading: "1.D Demonstrating Knowledge of Content",
                elementDescription: options,
                selectedOptions: selectedOptions),
          ],
        ),
      ),
    );
  }

  Widget elementPartsExpansionTile(
      {required BuildContext context,
      required String elementHeading,
      required List<String> elementDescription,
      required List<bool> selectedOptions}) {
    Size size = MediaQuery.of(context).size;
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
          Container(
            width: size.width,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
            decoration: const BoxDecoration(
              color: primary,
            ),
            child: Text(
              elementHeading,
              style: TextStyle(color: Styles.whiteColor),
            ),
          ),
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
                                  Text(
                                      "1-A.1 Alignment with Program and Course Learning Goals ",
                                      style: style.copyWith(
                                          fontSize: 14,
                                          color: Styles.fontColor)),
                                ]),
                          ),
                          children: [
                            ListTile(
                              contentPadding: EdgeInsets.zero,
                              title: ListView.builder(
                                  physics: const NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  itemCount: 4,
                                  itemBuilder: (context, index) {
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 15),
                                        Text(points[index],
                                            style: style.copyWith(
                                                fontSize: 12,
                                                color:
                                                    Styles.fontColor)),
                                        const SizedBox(height: 5),
                                        Container(
                                          padding: const EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              border: Border.all(
                                                  width: 0.2,
                                                  color:
                                                      Styles.fontColor),
                                              borderRadius:
                                                  BorderRadius.circular(10)),
                                          child: ListTile(
                                            leading: CustomCheckBox(
                                              isChecked: selectedOptions[index],
                                              onChanged: (value) {
                                                setState(() {
                                                  selectedOptions[index] =
                                                      value;
                                                });
                                              },
                                            ),
                                            title: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 8.0),
                                              child: Text(
                                                elementDescription[index],
                                                style: style.copyWith(
                                                    fontSize: 12,
                                                    color: Styles
                                                        .fontColor),
                                              ),
                                            ),
                                          ),
                                        )
                                      ],
                                    );
                                  }),
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

class CustomCheckBox extends StatefulWidget {
  final bool isChecked;
  final Function(bool) onChanged;

  CustomCheckBox({super.key, 
    required this.isChecked,
    required this.onChanged,
  });

  @override
  _CustomCheckBoxState createState() => _CustomCheckBoxState();
}

class _CustomCheckBoxState extends State<CustomCheckBox> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        widget.onChanged(!widget.isChecked);
      },
      child: Icon(
        widget.isChecked ? Icons.check_circle : Icons.circle,
        color: widget.isChecked ? Colors.green : Colors.grey,
        size: 18,
      ),
    );
  }
}
