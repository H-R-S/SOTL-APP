import 'package:flutter/material.dart';

class InformedObservationSubScreen extends StatelessWidget {
  const InformedObservationSubScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("INFORMED OBSERVATION",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold))
        ],
      ),
    );
  }
}
