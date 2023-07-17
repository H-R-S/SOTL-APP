import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../resources/constants/logos.dart';
import '../../../../resources/constants/style.dart';
import '../../../../theme/theme_provider.dart';

class SotlWelcomeContainer extends StatelessWidget {
  const SotlWelcomeContainer({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    bool isDark = themeProvider.currentTheme == ThemeData.dark();

    double width = MediaQuery.of(context).size.width;

    return Container(
        width: width,
        height: 80,
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        decoration: BoxDecoration(
            border: Border.all(color: isDark ? Colors.grey : Styles.fontColor, width: 2),
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
            ]));
  }
}
