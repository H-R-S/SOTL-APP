import 'package:flutter/material.dart';
import 'package:sotl/view/widgets/button/my_elevated_button.dart';

class ObservationFooter extends StatelessWidget {
  final Function()? onTapBack, onTapNext;
  final int stepLeft;

  const ObservationFooter(
      {super.key, this.onTapBack, this.onTapNext, required this.stepLeft});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
              width: 100,
              child: MyElevatedButton(title: "Back", onTap: onTapBack)),
          Text("$stepLeft steps left"),
          SizedBox(
              width: 100,
              child: MyElevatedButton(title: "Next", onTap: onTapNext))
        ],
      ),
    );
  }
}
