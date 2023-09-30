import 'package:flutter/material.dart';
import '../../../resources/constants/style.dart';

class MyElevatedButton extends StatelessWidget {
  final String title;
  final Function()? onTap;
  final double? customWidth;
  final Color? buttonColor;
  final Color? contentColor;
  final bool isLoading;

  const MyElevatedButton(
      {super.key,
      required this.title,
      required this.onTap,
      this.customWidth,
      this.isLoading = false,
      this.contentColor = Colors.white,
      this.buttonColor = primary});

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: onTap,
        child: Container(
            width: customWidth ?? double.infinity,
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10), color: buttonColor),
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
