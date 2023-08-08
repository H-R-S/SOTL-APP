import 'package:flutter/material.dart';
import 'package:sotl/resources/constants/style.dart';
import 'package:sotl/view/screens/faculty/screens/observation_detail/sub_screens/informed_observation_sub_screen.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';

class ObservationDetailScreen extends StatefulWidget {
  final int observationId;

  const ObservationDetailScreen({super.key, required this.observationId});
  @override
  State<ObservationDetailScreen> createState() =>
      ObservationDetailScreenState();
}

class ObservationDetailScreenState extends State<ObservationDetailScreen> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey();

  int currentIndex = 0;

  final controller = PageController(initialPage: 0);

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  final style =
      const TextStyle(fontWeight: FontWeight.bold, color: Colors.black);

  double value() {
    if (currentIndex == 0) {
      return 0.25;
    } else if (currentIndex == 1) {
      return 0.5;
    } else if (currentIndex == 2) {
      return 0.75;
    } else {
      return 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: MyAppBar(scaffoldKey, context,
            title: "Detail Observation",
            isBack: true,
            bottom: PreferredSize(
              preferredSize: const Size.fromHeight(60),
              child: SizedBox(
                width: width * 0.90,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text("INFORMED",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: currentIndex == 0
                                    ? primary
                                    : Colors.black)),
                        const SizedBox(width: 10),
                        Text("INFORMED",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: currentIndex == 1
                                    ? primary
                                    : Colors.black)),
                        const SizedBox(width: 10),
                        Text("INFORMED",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: currentIndex == 2
                                    ? primary
                                    : Colors.black)),
                        const SizedBox(width: 10),
                        Text("INFORMED",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: currentIndex == 3
                                    ? primary
                                    : Colors.black)),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: LinearProgressIndicator(
                        value: value(),
                        color: primary,
                        backgroundColor: Colors.grey,
                      ),
                    )
                  ],
                ),
              ),
            )),
        body: PageView(
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            controller: controller,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: [
              InformedObservationSubScreen(),
              Container(),
              Container(),
              Container(),
            ]));
  }
}
