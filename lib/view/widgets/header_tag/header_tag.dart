import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class HeaderTag extends StatelessWidget {
  final String title;

  const HeaderTag({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    const style =
        TextStyle(color: primary, fontSize: 35, fontWeight: FontWeight.bold);

    return FittedBox(child: Text(title, style: style));
  }
}
