import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class HeaderTag extends StatelessWidget {
  final String title;

  const HeaderTag({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
        child: Text(title,
            style: TextStyle(
                color: Styles.fontColor,
                fontSize: 22,
                letterSpacing: 0.2,
                fontWeight: FontWeight.bold)));
  }
}
