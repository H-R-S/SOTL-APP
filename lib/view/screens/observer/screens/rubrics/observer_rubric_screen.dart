import 'package:flutter/material.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/resources/constants/style.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';
import 'package:url_launcher/url_launcher.dart';

class ObserverRubricScreen extends StatelessWidget {
  final DetailObservationModel obs;
  final bool isObserver;
  final bool isFaculty;

  const ObserverRubricScreen(
      {super.key,
      required this.obs,
      this.isObserver = false,
      this.isFaculty = false});

  @override
  Widget build(BuildContext context) {
    final style2 = TextStyle(
        fontSize: 16, fontWeight: FontWeight.w600, color: Styles.fontColor);
    return Scaffold(
      appBar: const MyAppBar(
        isBack: true,
        title: "Rubrics",
      ),
      persistentFooterButtons: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: MyElevatedButton(
              title: "Open Rubrics",
              onTap: () => _launchInBrowser(
                  "https://sotlsystem.tech/observations/observation-rubric/${obs.id}")),
        )
      ],
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
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
                        Text(
                            "${obs.meetings!.informedObservation!.facultyScore?.toDouble() ?? 0} / 80",
                            style: style2),
                        const SizedBox(height: 10.0),
                        const Text("FINAL SCORE:"),
                        Text(
                            "${obs.meetings!.informedObservation!.facultyScore?.toDouble() ?? 0 + obs.meetings!.informedObservation!.observerScore!.toDouble()} / 80",
                            style: style2),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text("SCORE BY OBSERVER:"),
                        Text(
                            "${obs.meetings!.informedObservation!.observerScore?.toDouble() ?? 0} / 80",
                            style: style2),
                        const SizedBox(height: 10.0),
                        const Text("SCORE PERCENTAGE:"),
                        Text(
                          "${obs.meetings!.informedObservation!.facultyScore!.toDouble() + obs.meetings!.informedObservation!.observerScore!.toDouble() / 100}%",
                          style: style2,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _launchInBrowser(String url) async {
    if (!await launchUrl(
      Uri.parse(url),
      mode: LaunchMode.externalApplication,
    )) {
      throw Exception('Could not launch $url');
    }
  }
}
