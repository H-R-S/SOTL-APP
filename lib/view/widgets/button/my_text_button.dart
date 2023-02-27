import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sotl/resources/constants/style.dart';

class MyTextButton extends StatelessWidget {
  final String title;
  final Function() onTap;

  const MyTextButton({super.key, required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onTap,
        child: Text(title,
            style: const TextStyle(
                color: primary, fontSize: 18, fontWeight: FontWeight.w500)));
  }
}
