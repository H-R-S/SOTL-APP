import 'package:flutter/material.dart';
import '../../../../resources/constants/logos.dart';
import '../../../../resources/constants/style.dart';

class SotlWelcomeContainer extends StatelessWidget {
  const SotlWelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Container(
        width: width,
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(color: Styles.fontColor, width: 2),
            borderRadius: BorderRadius.circular(10)),
        child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Welcome to", style: Styles.h3),
                    Text("SOTL System", style: Styles.h2)
                  ]),
              Image.asset(sotlLogo, height: 40)
              // SvgPicture.asset(
              //   "assets/images/welcome_img.svg",
              //   fit: BoxFit.fill,
              // ),
            ]));
  }
}
