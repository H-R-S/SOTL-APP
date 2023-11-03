import 'package:flutter/material.dart';
import 'package:sotl/models/observation/detail_observation_model.dart';
import 'package:sotl/view/widgets/app_bar/my_app_bar.dart';

class ObserverRubricScreen extends StatelessWidget {
  final DetailObservationModel obs;

  const ObserverRubricScreen({super.key, required this.obs});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        isBack: true,
        title: "Rubrics",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              
              Container()],
          ),
        ),
      ),
    );
  }
}
