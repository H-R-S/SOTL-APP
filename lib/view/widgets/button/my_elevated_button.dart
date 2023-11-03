import 'package:flutter/material.dart';
import 'package:sotl/theme/theme.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final double? customWidth;
  final Color? buttonColor, contentColor, borderColor;
  final bool isLoading;

  const MyElevatedButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.borderColor,
      this.customWidth,
      this.isLoading = false,
      this.contentColor = Colors.white,
      this.buttonColor = const Color(0xff071285)});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: customWidth ?? double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                border:
                    Border.all(color: borderColor ?? LightColorTheme.kPrimary),
                borderRadius: BorderRadius.circular(10),
                color: buttonColor),
            child: Center(
              child: isLoading
                  ? SizedBox(
                      height: 20,
                      width: 20,
                      child: Center(
                          child: CircularProgressIndicator(
                              color: contentColor ?? Colors.white)))
                  : Text(title,
                      style: TextStyle(
                          fontSize: 18,
                          color: contentColor,
                          fontWeight: FontWeight.bold)),
            )));
  }
}
